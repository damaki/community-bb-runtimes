--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from RP2350.svd


with System;

--  Controls time and alarms
--
--              time is a 64 bit value indicating the time since power-on
--
--              timeh is the top 32 bits of time & timel is the bottom 32 bits
--  to change time write to timelw before timehw to read time read from timelr
--  before timehr
--
--              An alarm is set by setting alarm_enable and writing to the
--  corresponding alarm register When an alarm is pending, the corresponding
--  alarm_running signal will be high An alarm can be cancelled before it has
--  finished by clearing the alarm_enable When an alarm fires, the
--  corresponding alarm_irq is set and alarm_running is cleared To clear the
--  interrupt write a 1 to the corresponding alarm_irq The timer can be locked
--  to prevent writing
package Interfaces.RP2350.TIMER1 is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype ARMED_ARMED_Field is Interfaces.RP2350.UInt4;

   --  Indicates the armed/disarmed status of each alarm. A write to the
   --  corresponding ALARMx register arms the alarm. Alarms automatically
   --  disarm upon firing, but writing ones here will disarm immediately
   --  without waiting to fire.
   type ARMED_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      ARMED         : ARMED_ARMED_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.RP2350.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ARMED_Register use record
      ARMED         at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  DBGPAUSE_DBG array element
   subtype DBGPAUSE_DBG_Element is Interfaces.RP2350.Bit;

   --  DBGPAUSE_DBG array
   type DBGPAUSE_DBG_Field_Array is array (0 .. 1) of DBGPAUSE_DBG_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for DBGPAUSE_DBG
   type DBGPAUSE_DBG_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DBG as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  DBG as an array
            Arr : DBGPAUSE_DBG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DBGPAUSE_DBG_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Set bits high to enable pause when the corresponding debug ports are
   --  active
   type DBGPAUSE_Register is record
      --  unspecified
      Reserved_0_0  : Interfaces.RP2350.Bit := 16#1#;
      --  Pause when processor 0 is in debug mode
      DBG           : DBGPAUSE_DBG_Field := (As_Array => False, Val => 16#1#);
      --  unspecified
      Reserved_3_31 : Interfaces.RP2350.UInt29 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DBGPAUSE_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      DBG           at 0 range 1 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype PAUSE_PAUSE_Field is Interfaces.RP2350.Bit;

   --  Set high to pause the timer
   type PAUSE_Register is record
      PAUSE         : PAUSE_PAUSE_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : Interfaces.RP2350.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PAUSE_Register use record
      PAUSE         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype LOCKED_LOCKED_Field is Interfaces.RP2350.Bit;

   --  Set locked bit to disable write access to timer Once set, cannot be
   --  cleared (without a reset)
   type LOCKED_Register is record
      LOCKED        : LOCKED_LOCKED_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : Interfaces.RP2350.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for LOCKED_Register use record
      LOCKED        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   type SOURCE_CLK_SYS_Field is
     (TICK,
      CLK_SYS)
     with Size => 1;
   for SOURCE_CLK_SYS_Field use
     (TICK => 0,
      CLK_SYS => 1);

   --  Selects the source for the timer. Defaults to the normal tick configured
   --  in the ticks block (typically configured to 1 microsecond). Writing to 1
   --  will ignore the tick and count clk_sys cycles instead.
   type SOURCE_Register is record
      CLK_SYS       : SOURCE_CLK_SYS_Field := Interfaces.RP2350.TIMER1.TICK;
      --  unspecified
      Reserved_1_31 : Interfaces.RP2350.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SOURCE_Register use record
      CLK_SYS       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype INTR_ALARM_0_Field is Interfaces.RP2350.Bit;
   subtype INTR_ALARM_1_Field is Interfaces.RP2350.Bit;
   subtype INTR_ALARM_2_Field is Interfaces.RP2350.Bit;
   subtype INTR_ALARM_3_Field is Interfaces.RP2350.Bit;

   --  Raw Interrupts
   type INTR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      ALARM_0       : INTR_ALARM_0_Field := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      ALARM_1       : INTR_ALARM_1_Field := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      ALARM_2       : INTR_ALARM_2_Field := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field.
      ALARM_3       : INTR_ALARM_3_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.RP2350.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTR_Register use record
      ALARM_0       at 0 range 0 .. 0;
      ALARM_1       at 0 range 1 .. 1;
      ALARM_2       at 0 range 2 .. 2;
      ALARM_3       at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype INTE_ALARM_0_Field is Interfaces.RP2350.Bit;
   subtype INTE_ALARM_1_Field is Interfaces.RP2350.Bit;
   subtype INTE_ALARM_2_Field is Interfaces.RP2350.Bit;
   subtype INTE_ALARM_3_Field is Interfaces.RP2350.Bit;

   --  Interrupt Enable
   type INTE_Register is record
      ALARM_0       : INTE_ALARM_0_Field := 16#0#;
      ALARM_1       : INTE_ALARM_1_Field := 16#0#;
      ALARM_2       : INTE_ALARM_2_Field := 16#0#;
      ALARM_3       : INTE_ALARM_3_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.RP2350.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTE_Register use record
      ALARM_0       at 0 range 0 .. 0;
      ALARM_1       at 0 range 1 .. 1;
      ALARM_2       at 0 range 2 .. 2;
      ALARM_3       at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype INTF_ALARM_0_Field is Interfaces.RP2350.Bit;
   subtype INTF_ALARM_1_Field is Interfaces.RP2350.Bit;
   subtype INTF_ALARM_2_Field is Interfaces.RP2350.Bit;
   subtype INTF_ALARM_3_Field is Interfaces.RP2350.Bit;

   --  Interrupt Force
   type INTF_Register is record
      ALARM_0       : INTF_ALARM_0_Field := 16#0#;
      ALARM_1       : INTF_ALARM_1_Field := 16#0#;
      ALARM_2       : INTF_ALARM_2_Field := 16#0#;
      ALARM_3       : INTF_ALARM_3_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.RP2350.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTF_Register use record
      ALARM_0       at 0 range 0 .. 0;
      ALARM_1       at 0 range 1 .. 1;
      ALARM_2       at 0 range 2 .. 2;
      ALARM_3       at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype INTS_ALARM_0_Field is Interfaces.RP2350.Bit;
   subtype INTS_ALARM_1_Field is Interfaces.RP2350.Bit;
   subtype INTS_ALARM_2_Field is Interfaces.RP2350.Bit;
   subtype INTS_ALARM_3_Field is Interfaces.RP2350.Bit;

   --  Interrupt status after masking & forcing
   type INTS_Register is record
      --  Read-only.
      ALARM_0       : INTS_ALARM_0_Field;
      --  Read-only.
      ALARM_1       : INTS_ALARM_1_Field;
      --  Read-only.
      ALARM_2       : INTS_ALARM_2_Field;
      --  Read-only.
      ALARM_3       : INTS_ALARM_3_Field;
      --  unspecified
      Reserved_4_31 : Interfaces.RP2350.UInt28;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTS_Register use record
      ALARM_0       at 0 range 0 .. 0;
      ALARM_1       at 0 range 1 .. 1;
      ALARM_2       at 0 range 2 .. 2;
      ALARM_3       at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Controls time and alarms time is a 64 bit value indicating the time
   --  since power-on timeh is the top 32 bits of time & timel is the bottom 32
   --  bits to change time write to timelw before timehw to read time read from
   --  timelr before timehr An alarm is set by setting alarm_enable and writing
   --  to the corresponding alarm register When an alarm is pending, the
   --  corresponding alarm_running signal will be high An alarm can be
   --  cancelled before it has finished by clearing the alarm_enable When an
   --  alarm fires, the corresponding alarm_irq is set and alarm_running is
   --  cleared To clear the interrupt write a 1 to the corresponding alarm_irq
   --  The timer can be locked to prevent writing
   type TIMER1_Peripheral is record
      --  Write to bits 63:32 of time always write timelw before timehw
      TIMEHW   : aliased Interfaces.RP2350.UInt32;
      --  Write to bits 31:0 of time writes do not get copied to time until
      --  timehw is written
      TIMELW   : aliased Interfaces.RP2350.UInt32;
      --  Read from bits 63:32 of time always read timelr before timehr
      TIMEHR   : aliased Interfaces.RP2350.UInt32;
      --  Read from bits 31:0 of time
      TIMELR   : aliased Interfaces.RP2350.UInt32;
      --  Arm alarm 0, and configure the time it will fire. Once armed, the
      --  alarm fires when TIMER_ALARM0 == TIMELR. The alarm will disarm itself
      --  once it fires, and can be disarmed early using the ARMED status
      --  register.
      ALARM0   : aliased Interfaces.RP2350.UInt32;
      --  Arm alarm 1, and configure the time it will fire. Once armed, the
      --  alarm fires when TIMER_ALARM1 == TIMELR. The alarm will disarm itself
      --  once it fires, and can be disarmed early using the ARMED status
      --  register.
      ALARM1   : aliased Interfaces.RP2350.UInt32;
      --  Arm alarm 2, and configure the time it will fire. Once armed, the
      --  alarm fires when TIMER_ALARM2 == TIMELR. The alarm will disarm itself
      --  once it fires, and can be disarmed early using the ARMED status
      --  register.
      ALARM2   : aliased Interfaces.RP2350.UInt32;
      --  Arm alarm 3, and configure the time it will fire. Once armed, the
      --  alarm fires when TIMER_ALARM3 == TIMELR. The alarm will disarm itself
      --  once it fires, and can be disarmed early using the ARMED status
      --  register.
      ALARM3   : aliased Interfaces.RP2350.UInt32;
      --  Indicates the armed/disarmed status of each alarm. A write to the
      --  corresponding ALARMx register arms the alarm. Alarms automatically
      --  disarm upon firing, but writing ones here will disarm immediately
      --  without waiting to fire.
      ARMED    : aliased ARMED_Register;
      pragma Volatile_Full_Access (ARMED);
      --  Raw read from bits 63:32 of time (no side effects)
      TIMERAWH : aliased Interfaces.RP2350.UInt32;
      --  Raw read from bits 31:0 of time (no side effects)
      TIMERAWL : aliased Interfaces.RP2350.UInt32;
      --  Set bits high to enable pause when the corresponding debug ports are
      --  active
      DBGPAUSE : aliased DBGPAUSE_Register;
      pragma Volatile_Full_Access (DBGPAUSE);
      --  Set high to pause the timer
      PAUSE    : aliased PAUSE_Register;
      pragma Volatile_Full_Access (PAUSE);
      --  Set locked bit to disable write access to timer Once set, cannot be
      --  cleared (without a reset)
      LOCKED   : aliased LOCKED_Register;
      pragma Volatile_Full_Access (LOCKED);
      --  Selects the source for the timer. Defaults to the normal tick
      --  configured in the ticks block (typically configured to 1
      --  microsecond). Writing to 1 will ignore the tick and count clk_sys
      --  cycles instead.
      SOURCE   : aliased SOURCE_Register;
      pragma Volatile_Full_Access (SOURCE);
      --  Raw Interrupts
      INTR     : aliased INTR_Register;
      pragma Volatile_Full_Access (INTR);
      --  Interrupt Enable
      INTE     : aliased INTE_Register;
      pragma Volatile_Full_Access (INTE);
      --  Interrupt Force
      INTF     : aliased INTF_Register;
      pragma Volatile_Full_Access (INTF);
      --  Interrupt status after masking & forcing
      INTS     : aliased INTS_Register;
      pragma Volatile_Full_Access (INTS);
   end record
     with Volatile;

   for TIMER1_Peripheral use record
      TIMEHW   at 16#0# range 0 .. 31;
      TIMELW   at 16#4# range 0 .. 31;
      TIMEHR   at 16#8# range 0 .. 31;
      TIMELR   at 16#C# range 0 .. 31;
      ALARM0   at 16#10# range 0 .. 31;
      ALARM1   at 16#14# range 0 .. 31;
      ALARM2   at 16#18# range 0 .. 31;
      ALARM3   at 16#1C# range 0 .. 31;
      ARMED    at 16#20# range 0 .. 31;
      TIMERAWH at 16#24# range 0 .. 31;
      TIMERAWL at 16#28# range 0 .. 31;
      DBGPAUSE at 16#2C# range 0 .. 31;
      PAUSE    at 16#30# range 0 .. 31;
      LOCKED   at 16#34# range 0 .. 31;
      SOURCE   at 16#38# range 0 .. 31;
      INTR     at 16#3C# range 0 .. 31;
      INTE     at 16#40# range 0 .. 31;
      INTF     at 16#44# range 0 .. 31;
      INTS     at 16#48# range 0 .. 31;
   end record;

   --  Controls time and alarms time is a 64 bit value indicating the time
   --  since power-on timeh is the top 32 bits of time & timel is the bottom 32
   --  bits to change time write to timelw before timehw to read time read from
   --  timelr before timehr An alarm is set by setting alarm_enable and writing
   --  to the corresponding alarm register When an alarm is pending, the
   --  corresponding alarm_running signal will be high An alarm can be
   --  cancelled before it has finished by clearing the alarm_enable When an
   --  alarm fires, the corresponding alarm_irq is set and alarm_running is
   --  cleared To clear the interrupt write a 1 to the corresponding alarm_irq
   --  The timer can be locked to prevent writing
   TIMER1_Periph : aliased TIMER1_Peripheral
     with Import, Address => TIMER1_Base;

end Interfaces.RP2350.TIMER1;
