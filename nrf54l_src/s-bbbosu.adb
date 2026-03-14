------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                S Y S T E M . B B . B O A R D _ S U P P O R T             --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2005 The European Space Agency            --
--                     Copyright (C) 2003-2026, AdaCore                     --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
-- The port of GNARL to bare board targets was initially developed by the   --
-- Real-Time Systems Group at the Technical University of Madrid.           --
--                                                                          --
------------------------------------------------------------------------------

with System.Machine_Code;

with System.BB.CPU_Primitives;

with Interfaces;                   use Interfaces;
with Interfaces.NRF54;             use Interfaces.NRF54;
with Interfaces.NRF54.GRTC;        use Interfaces.NRF54.GRTC;
with Interfaces.NRF54.CLOCK;       use Interfaces.NRF54.CLOCK;
with Interfaces.NRF54.OSCILLATORS; use Interfaces.NRF54.OSCILLATORS;

with NRF54_Runtime_Config; use NRF54_Runtime_Config;

package body System.BB.Board_Support is
   use CPU_Primitives, BB.Interrupts, Machine_Code, Time;
   use type BB.Time.Time;

   Interrupt_Request_Vector : constant Vector_Id := 16;
   --  See vector definitions in ARMv7-M version of System.BB.CPU_Primitives.
   --  Defined by ARMv7-M specifications.

   Alarm_Interrupt_ID : constant Interrupt_ID :=
     226 + NRF54_Runtime_Config.Time_Base_GRTC_IRQ;

   Alarm_CC_Channel : constant := NRF54_Runtime_Config.Time_Base_GRTC_CCn;

   GRTC_Periph : aliased Interfaces.NRF54.GRTC.GRTC_Peripheral
   with
     Import,
     Address =>
       (if NRF54_Runtime_Config.Security_Level = Secure
        then Interfaces.NRF54.GRTC.GLOBAL_GRTC_S_Periph'Address
        else Interfaces.NRF54.GRTC.GLOBAL_GRTC_NS_Periph'Address);

   CLOCK_Periph : aliased Interfaces.NRF54.CLOCK.CLOCK_Peripheral
   with
     Import,
     Address =>
       (if NRF54_Runtime_Config.Security_Level = Secure
        then Interfaces.NRF54.CLOCK.GLOBAL_CLOCK_S_Periph'Address
        else Interfaces.NRF54.CLOCK.GLOBAL_CLOCK_NS_Periph'Address);

   OSCILLATORS_Periph :
     aliased Interfaces.NRF54.OSCILLATORS.OSCILLATORS_Peripheral
   with
     Import,
     Address =>
       (if NRF54_Runtime_Config.Security_Level = Secure
        then Interfaces.NRF54.OSCILLATORS.GLOBAL_OSCILLATORS_S_Periph'Address
        else
          Interfaces.NRF54.OSCILLATORS.GLOBAL_OSCILLATORS_NS_Periph'Address);

   Alarm_EVENTS_COMPARE : aliased Interfaces.NRF54.GRTC.EVENTS_COMPARE_Register
   with
     Import,
     Address =>
       (if NRF54_Runtime_Config.Security_Level = Secure
        then Interfaces.NRF54.GLOBAL_GRTC_S_Base
        else Interfaces.NRF54.GLOBAL_GRTC_NS_Base)
       + 16#100#
       + (4 * Alarm_CC_Channel);

   Alarm_INTENSET : aliased Interfaces.NRF54.GRTC.INTENSET_Register
   with
     Import,
     Address =>
       (if NRF54_Runtime_Config.Security_Level = Secure
        then Interfaces.NRF54.GLOBAL_GRTC_S_Base
        else Interfaces.NRF54.GLOBAL_GRTC_NS_Base)
       + 16#304#
       + (16#10# * NRF54_Runtime_Config.Time_Base_GRTC_IRQ);

   Alarm_Occurred : Boolean := False
   with Atomic;

   ------------------
   -- RTC Handling --
   ------------------

   --  One of the GRTC's capture/compare channels is used as the clock source,
   --  which we use to implement "tick-less" alarm handling. The specific
   --  capture/compare channel used is configured in the Alire crate
   --  configuration.
   --
   --  The GRTC is a 52-bit timer with a precision of 1 us and can run for
   --  142 years before overflowing (see nRF54L15 datasheet v1.0, Section 8.10)
   --
   --  We use the COMPARE feature of the GRTC to provide accurate alarms.
   --  We achieve this by updating CC[n] each time Set_Alarm is called so
   --  that the alarm is triggered exactly at the alarm time.

   ----------------------------------------------
   -- New Vectored Interrupt Controller (NVIC) --
   ----------------------------------------------

   NVIC_Base : constant := 16#E000_E000#;
   --  Nested Vectored Interrupt Controller (NVIC) base.

   NVIC_ISER0 : constant Address := NVIC_Base + 16#100#;
   --  Writing a bit mask to this register enables the corresponding interrupts

   NVIC_STIR : Word
   with Volatile, Address => NVIC_Base + 16#F00#;
   --  Software Trigger Interrupt Register

   type PRI is mod 2 ** 8;
   --  Type for ARMv7-M interrupt priorities. Note that 0 is the highest
   --  priority, which is reserved for the kernel and has no corresponding
   --  Interrupt_Priority value, and 255 is the lowest. We assume the PRIGROUP
   --  setting is such that the 3 most significant bits determine the priority
   --  group used for preemption.

   function To_PRI (P : Integer) return PRI
   is (if P not in Interrupt_Priority
       then 0
       else PRI (Interrupt_Priority'Last - P + 1) * 32);
   --  Return the BASEPRI mask for the given Ada priority. Note that the zero
   --  value here means no mask, so no interrupts are masked.

   function To_Priority (P : PRI) return Interrupt_Priority
   is (if P = 0
       then Interrupt_Priority'Last
       else (Interrupt_Priority'Last - Any_Priority'Base (P / 32) + 1));
   --  Given an ARM interrupt priority (PRI value), determine the Ada priority
   --  While the value 0 is reserved for the kernel and has no Ada priority
   --  that represents it, Interrupt_Priority'Last is closest.

   IP : array (0 .. Interrupt_ID'Last) of PRI
   with Volatile, Address => 16#E000_E400#;

   --  Local utility functions

   procedure Enable_Interrupt_Request
     (Interrupt : Interrupt_ID; Prio : Interrupt_Priority);
   --  Enable interrupt requests for the given interrupt

   procedure Trigger_Interrupt (Interrupt : Interrupt_ID);
   --  Trigger an interrupt in the NVIC.

   procedure Interrupt_Handler;
   --  Low-level interrupt handlers

   procedure Delay_Us (Us : Unsigned_32);
   --  Delay in a busy loop for at least the specified number of nanoseconds

   ----------------------
   -- Initialize_Board --
   ----------------------

   procedure Initialize_Board is
   begin
      Disable_Interrupts;

      --  Start LFCLK
      --  We assume that the LFCLK source (Xtal, Rc, or Synth) has already been
      --  configured in setup_clocks.adb

      CLOCK_Periph.TASKS_LFCLKSTART :=
        (TASKS_LFCLKSTART => Trigger, others => <>);

      --  Wait for LFCLK to start-up.

      loop
         exit when
           CLOCK_Periph.EVENTS_LFCLKSTARTED.EVENTS_LFCLKSTARTED = Generated;
      end loop;

      --  Clear event

      CLOCK_Periph.EVENTS_LFCLKSTARTED :=
        (EVENTS_LFCLKSTARTED => NotGenerated, others => <>);

      --  Start the GRTC'S LFTIMER
      --
      --  nRF54L15 Datasheet v1.0, Section 8.10.6 states:
      --  "The STATUS.LFTIMER.READY indicates busy while handling the tasks
      --  TASKS_START, TASKS_STOP and TASKS_CLEAR. These tasks must be
      --  triggered only when the STATUS.LFTIMER.READY status indicates ready."

      GRTC_Periph.MODE := (SYSCOUNTEREN => Disabled, others => <>);
      GRTC_Periph.CLKCFG := (CLKSEL => SystemLFCLK, others => <>);

      loop
         exit when GRTC_Periph.STATUS.LFTIMER.READY = Ready;
      end loop;

      GRTC_Periph.TASKS_CLEAR := (TASKS_CLEAR => Trigger, others => <>);
      GRTC_Periph.TASKS_START := (TASKS_START => Trigger, others => <>);

      --  Wait for 3 LFCLK cycles (~91.5 us)

      Delay_Us (92);

      --  Use a conservative WAKETIME of 3 LFCLK cycles (~91.5 us) to allow
      --  plenty of time for clocks and power domains to be turned on.
      --
      --  Also use a default TIMEOUT of 10 LFCLK cycles (~305 us).
      --
      --  The user application can always change these values later on if
      --  needed.

      GRTC_Periph.WAKETIME := (VALUE => 3, others => <>);
      GRTC_Periph.TIMEOUT := (VALUE => 10, others => <>);

      --  Start the SYSCOUNTER
      --
      --  We also enable AUTOEN to reduce the latency when reading the clock
      --  time while the CPU is active.

      GRTC_Periph.MODE :=
        (AUTOEN => CpuActive, SYSCOUNTEREN => Enabled, others => <>);

      Time.Clear_Alarm_Interrupt;

      Install_Trap_Handler
        (Interrupt_Handler'Address, Interrupt_Request_Vector);
   end Initialize_Board;

   package body Time is

      ----------------
      -- Read_Clock --
      ----------------

      function Read_Clock return BB.Time.Time is
         Channel : constant := NRF54_Runtime_Config.Time_Base_GRTC_IRQ;

         SYSCOUNTERL : UInt32;
         SYSCOUNTERH : SYSCOUNTERH_SYSCOUNTER_Register;

      begin

         --  Ensure SYSCOUNTERL is active so we can read it

         GRTC_Periph.SYSCOUNTER (Channel).ACTIVE :=
           (ACTIVE => Active, others => <>);

         --  SYSCOUNTERL must be read before SYSCOUNTERH
         --  (nRF54L15 datasheet v1.0, Section 8.10.2)

         loop
            SYSCOUNTERL := GRTC_Periph.SYSCOUNTER (Channel).SYSCOUNTERL;
            SYSCOUNTERH := GRTC_Periph.SYSCOUNTER (Channel).SYSCOUNTERH;
            exit when SYSCOUNTERH.BUSY = Ready;
         end loop;

         --  Handle the case when the SYSCOUNTER overflowed between reading
         --  the low and hi values.

         if SYSCOUNTERH.OVERFLOW = Overflow then
            SYSCOUNTERH.VALUE := SYSCOUNTERH.VALUE - 1;
         end if;

         GRTC_Periph.SYSCOUNTER (Channel).ACTIVE :=
           (ACTIVE => NotActive, others => <>);

         return
           BB.Time.Time (SYSCOUNTERL)
           + (BB.Time.Time (SYSCOUNTERH.VALUE) * (2 ** 32));
      end Read_Clock;

      ---------------------------
      -- Clear_Alarm_Interrupt --
      ---------------------------

      procedure Clear_Alarm_Interrupt is
      begin
         Alarm_EVENTS_COMPARE :=
           (EVENTS_COMPARE => NotGenerated, others => <>);

         Alarm_Occurred := True;
      end Clear_Alarm_Interrupt;

      ---------------
      -- Set_Alarm --
      ---------------

      procedure Set_Alarm (Ticks : BB.Time.Time) is
         Ticks_Hi : UInt32;
         CCL      : UInt32;
         CCH      : CCH_CC_CCH_Field;
         Now      : BB.Time.Time;
      begin

         CCL := UInt32 (Ticks and 16#FFFF_FFFF#);
         Ticks_Hi := UInt32 (Ticks / (2 ** 32));

         --  BB.BB.Time is 64-bit, but the GRTC timer is 52-bit, so clamp to
         --  the maximum 52-bit value if the 64-bit value exceeds its range.
         --
         --  A 52-bit timer with 1 us resolution overflows after 142 years,
         --  so any alarm above this limit would not be reached in practice
         --  anyway.

         if Ticks_Hi <= UInt32 (CCH_CC_CCH_Field'Last) then
            CCH := CCH_CC_CCH_Field (Ticks_Hi);
         else
            CCH := CCH_CC_CCH_Field'Last;
         end if;

         Alarm_Occurred := False;

         --  Disable first to prevent any spurious interrupts while configuring
         --  the CCL/CCH registers.

         GRTC_Periph.CC (Alarm_CC_Channel).CCEN :=
           (ACTIVE => Disable, others => <>);

         GRTC_Periph.CC (Alarm_CC_Channel).CCL := CCL;
         GRTC_Periph.CC (Alarm_CC_Channel).CCH := (CCH => CCH, others => <>);

         GRTC_Periph.CC (Alarm_CC_Channel).CCEN :=
           (ACTIVE => Enable, others => <>);

         --  Check if the alarm time was missed while we were configuring it.
         --  If so, then trigger the alarm interrupt manually.

         Now := Read_Clock;

         if Now >= Ticks and then not Alarm_Occurred then
            Trigger_Interrupt (Alarm_Interrupt_ID);
         end if;

      end Set_Alarm;

      ---------------------------
      -- Install_Alarm_Handler --
      ---------------------------

      procedure Install_Alarm_Handler
        (Handler : BB.Interrupts.Interrupt_Handler) is
      begin
         BB.Interrupts.Attach_Handler
           (Handler, Alarm_Interrupt_ID, Interrupt_Priority'Last);

         --  Enable COMPARE interrupt

         Alarm_INTENSET :=
           (COMPARE =>
              (As_Array => True,
               Arr      =>
                 (Alarm_CC_Channel => Set,
                  others           => INTENSET0_COMPARE0_Field_Reset)),
            others  => <>);
      end Install_Alarm_Handler;
   end Time;

   package body Multiprocessors is separate;

   -----------------------
   -- Interrupt_Handler --
   -----------------------

   procedure Interrupt_Handler is
      Id      : Interrupt_ID;
      Res     : Word;
      PRIMASK : Word;
   begin
      Asm
        ("mrs %0, PRIMASK",
         Outputs  => Word'Asm_Output ("=&r", PRIMASK),
         Volatile => True);
      Asm
        ("msr PRIMASK, %0",
         Inputs   => Word'Asm_Input ("r", 1),
         Volatile => True);

      --  The exception number is read from the IPSR

      Asm ("mrs %0, ipsr", Word'Asm_Output ("=r", Res), Volatile => True);

      Res := Res and 16#FF#;

      --  Convert it to IRQ number by substracting 16 (number of cpu
      --  exceptions).

      Id := Interrupt_ID'Base (Res) - 16;

      Interrupt_Wrapper (Id);

      --  Restore interrupt mask

      Asm
        ("msr PRIMASK, %0",
         Inputs   => Word'Asm_Input ("r", PRIMASK),
         Volatile => True);
   end Interrupt_Handler;

   ------------------------------
   -- Enable_Interrupt_Request --
   ------------------------------

   procedure Enable_Interrupt_Request
     (Interrupt : Interrupt_ID; Prio : Interrupt_Priority) is
   begin
      if Interrupt = Alarm_Interrupt_ID then

         --  Consistency check with Priority_Of_Interrupt

         pragma Assert (Prio = Interrupt_Priority'Last);

         Time.Clear_Alarm_Interrupt;
      end if;

      declare
         pragma Assert (Interrupt >= 0);
         IRQ       : constant Natural := Interrupt;
         Regofs    : constant Natural := IRQ / 32;
         Regbit    : constant Word := 2 ** (IRQ mod 32);
         NVIC_ISER : array (0 .. 15) of Word
         with Volatile, Address => NVIC_ISER0;

         --  Many NVIC registers use 16 words of 32 bits each to serve as a
         --  bitmap for all interrupt channels. Regofs indicates register
         --  offset (0 .. 15), and Regbit indicates the mask required for
         --  addressing the bit.

      begin
         NVIC_ISER (Regofs) := Regbit;
      end;
   end Enable_Interrupt_Request;

   -----------------------
   -- Trigger_Interrupt --
   -----------------------
   procedure Trigger_Interrupt (Interrupt : Interrupt_ID) is
   begin
      NVIC_STIR := Word (Interrupt) and 16#0000_01FF#;
   end Trigger_Interrupt;

   --------------
   -- Delay_Us --
   --------------

   procedure Delay_Us (Us : Unsigned_32) is
      DEMCR : Unsigned_32
      with Volatile, Import, Address => System'To_Address (16#E000_EDFC#);

      DWT_CTRL : Unsigned_32
      with Volatile, Import, Address => System'To_Address (16#E000_1000#);

      DWT_CYCCNT : Unsigned_32
      with Volatile, Import, Address => System'To_Address (16#E000_1004#);

      Old_DEMCR    : Unsigned_32;
      Old_DWT_CTRL : Unsigned_32;

      Delay_Cycles : Unsigned_32;

      Start : Unsigned_32;

   begin
      --  Enable the trace and debug blocks (bit 24, TRCENA)

      Old_DEMCR := DEMCR;
      DEMCR := Old_DEMCR or (2 ** 24);

      --  Enable the cycle counter (bit 0, CYCCNTENA)

      Old_DWT_CTRL := DWT_CTRL;
      DWT_CTRL := Old_DWT_CTRL or (2 ** 0);

      --  Delay for the requested number of microseconds

      Start := DWT_CYCCNT;

      Delay_Cycles :=
        Us
        * (case OSCILLATORS_Periph.PLL.CURRENTFREQ.CURRENTFREQ is
             when CK64M  => 64,
             when CK128M => 128);

      loop
         exit when (DWT_CYCCNT - Start) >= Delay_Cycles;
      end loop;

      --  Restore values
      DWT_CTRL := Old_DWT_CTRL;
      DEMCR := Old_DEMCR;
   end Delay_Us;

   package body Interrupts is
      -------------------------------
      -- Install_Interrupt_Handler --
      -------------------------------

      procedure Install_Interrupt_Handler
        (Interrupt : Interrupt_ID; Prio : Interrupt_Priority) is
      begin
         if Interrupt /= Alarm_Interrupt_ID then
            IP (Interrupt) := To_PRI (Prio);
         end if;

         Enable_Interrupt_Request (Interrupt, Prio);
      end Install_Interrupt_Handler;

      ---------------------------
      -- Priority_Of_Interrupt --
      ---------------------------

      function Priority_Of_Interrupt
        (Interrupt : Interrupt_ID) return Any_Priority
      is (if Interrupt = Alarm_Interrupt_ID
          then Interrupt_Priority'Last
          else To_Priority (IP (Interrupt)));

      ----------------
      -- Power_Down --
      ----------------

      procedure Power_Down is
      begin
         Asm ("wfi", Volatile => True);
      end Power_Down;

      --------------------------
      -- Set_Current_Priority --
      --------------------------

      procedure Set_Current_Priority (Priority : Integer) is
      begin
         --  Writing a 0 to BASEPRI disables interrupt masking, while values
         --  15 .. 1 correspond to interrupt priorities 255 .. 241 in that
         --  order.

         Asm
           ("msr BASEPRI, %0",
            Inputs   => PRI'Asm_Input ("r", To_PRI (Priority)),
            Volatile => True);
      end Set_Current_Priority;
   end Interrupts;
end System.BB.Board_Support;
