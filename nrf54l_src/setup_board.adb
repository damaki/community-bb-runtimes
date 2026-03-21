------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          Copyright (C) 2012-2021, Free Software Foundation, Inc.         --
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
------------------------------------------------------------------------------

--  This file is based on the startup code from the following file in Nordic's
--  nrf-bm v1.0.0: modules/nrfx/mdk/system_nrf54l.c for errata
--  workarounds and startup configuration.
--
--  This Errata_X_Workaround functions detect if certain errata are applicable
--  for the MCU. If they are applicable, then a workaround is applied for the
--  errata. Some of these errata workarounds rely on reading and/or writing
--  registers that are not documented in the datasheet. As mentioned above,
--  these register addresses and values are copied from Nordic's nrf-bm.

pragma Ada_2012;
pragma Suppress (All_Checks);

with System;
with Interfaces;                     use Interfaces;
with Interfaces.NRF54;               use Interfaces.NRF54;
with Interfaces.NRF54.CACHE;         use Interfaces.NRF54.CACHE;
with Interfaces.NRF54.CLOCK;         use Interfaces.NRF54.CLOCK;
with Interfaces.NRF54.FICR;          use Interfaces.NRF54.FICR;
with Interfaces.NRF54.GLITCHDET;     use Interfaces.NRF54.GLITCHDET;
with Interfaces.NRF54.GPIO;          use Interfaces.NRF54.GPIO;
with Interfaces.NRF54.GPIOHSPADCTRL; use Interfaces.NRF54.GPIOHSPADCTRL;
with Interfaces.NRF54.KMU;           use Interfaces.NRF54.KMU;
with Interfaces.NRF54.OSCILLATORS;   use Interfaces.NRF54.OSCILLATORS;
with Interfaces.NRF54.TAD;           use Interfaces.NRF54.TAD;

with NRF54_App_Runtime_Config; use NRF54_App_Runtime_Config;

procedure Setup_Board is

   procedure Errata_31_Workaround
   with Inline;
   procedure Errata_32_Workaround
   with Inline;
   procedure Errata_37_Workaround
   with Inline;
   procedure Errata_40_Workaround
   with Inline;

   procedure Apply_FICR_TRIMCNF
   with Inline;

   --------------------------
   -- Errata_31_Workaround --
   --------------------------

   procedure Errata_31_Workaround is
      Var_1 : constant Unsigned_32
      with Import, Address => System'To_Address (16#00FF_C340#);

      Var_2 : constant Unsigned_32
      with Import, Address => System'To_Address (16#00FF_C344#);

      Reg_1 : Unsigned_32
      with Volatile, Import, Address => System'To_Address (16#5012_0624#);

      Reg_2 : Unsigned_32
      with Volatile, Import, Address => System'To_Address (16#5012_063C#);

      Is_Applicable : Boolean := False;

   begin
      case NRF54_App_Runtime_Config.Device is
         when nRF54L15 =>
            Is_Applicable := Var_1 = 16#1C# and then Var_2 = 16#01#;

         when nRF54L10 =>
            Is_Applicable := Var_1 = 16#2E# and then Var_2 = 16#01#;

         when nRF54L05 =>
            Is_Applicable := Var_1 = 16#2F# and then Var_2 = 16#01#;

         when others   =>
            Is_Applicable := False;
      end case;

      if Is_Applicable then
         Reg_1 := 20 or (2 ** 5);
         Reg_2 := Reg_2 and not Unsigned_32 (2 ** 19);
      end if;
   end Errata_31_Workaround;

   --------------------------
   -- Errata_32_Workaround --
   --------------------------

   procedure Errata_32_Workaround is
      Var_1 : constant Unsigned_32
      with Import, Address => System'To_Address (16#00FF_C340#);

      Var_2 : constant Unsigned_32
      with Import, Address => System'To_Address (16#00FF_C344#);

      Var_3 : constant Unsigned_32
      with Import, Address => System'To_Address (16#00FF_C334#);

      Reg : Unsigned_32
      with Volatile, Import, Address => System'To_Address (16#5012_0640#);

      Is_nRF54L15 : constant Boolean :=
        NRF54_App_Runtime_Config.Device = nRF54L15;

   begin
      if Is_nRF54L15 then
         if Var_1 = 16#1C#
           and then Var_2 = 16#01#
           and then Var_3 <= 16#180A_1D00#
         then
            Reg := 16#1EA9_E040#;
         end if;
      end if;
   end Errata_32_Workaround;

   --------------------------
   -- Errata_37_Workaround --
   --------------------------

   procedure Errata_37_Workaround is
      Var_1 : constant Unsigned_32
      with Import, Address => System'To_Address (16#00FF_C340#);

      Reg : Unsigned_32
      with Volatile, Import, Address => System'To_Address (16#5005_340C#);

      Is_Applicable : Boolean := False;

   begin
      case NRF54_App_Runtime_Config.Device is
         when nRF54L15   =>
            Is_Applicable := Var_1 = 16#1C#;

         when nRF54LV10A =>
            Is_Applicable := Var_1 = 16#27#;

         when nRF54LM20A =>
            Is_Applicable := Var_1 = 16#29#;

         when nRF54L10   =>
            Is_Applicable := Var_1 = 16#2E#;

         when nRF54L05   =>
            Is_Applicable := Var_1 = 16#2F#;

         when others     =>
            Is_Applicable := False;
      end case;

      if Is_Applicable then
         Reg := 1;
      end if;
   end Errata_37_Workaround;

   --------------------------
   -- Errata_40_Workaround --
   --------------------------

   procedure Errata_40_Workaround is
      Var_1 : constant Unsigned_32
      with Import, Address => System'To_Address (16#00FF_C340#);

      Var_2 : constant Unsigned_32
      with Import, Address => System'To_Address (16#00FF_C344#);

      Reg : Unsigned_32
      with Volatile, Import, Address => System'To_Address (16#5008_A7AC#);

      Is_nRF54L15 : constant Boolean :=
        NRF54_App_Runtime_Config.Device = nRF54L15;

   begin
      if Is_nRF54L15 then
         if Var_1 = 16#1C# and then Var_2 = 16#01# then
            Reg := 16#040A_0078#;
         end if;
      end if;
   end Errata_40_Workaround;

   ------------------------
   -- Apply_FICR_TRIMCNF --
   ------------------------

   procedure Apply_FICR_TRIMCNF is
   begin
      for Trim of GLOBAL_FICR_NS_Periph.TRIMCNF loop
         exit when Trim.ADDR in UInt32'First | UInt32'Last;

         declare
            Target : UInt32
            with Volatile, Import, Address => System'To_Address (Trim.ADDR);
         begin
            Target := Trim.DATA;
         end;
      end loop;
   end Apply_FICR_TRIMCNF;

   Unused : Interfaces.NRF54.KMU.STATUS_Register;

   Is_Secure : constant Boolean :=
     NRF54_App_Runtime_Config.Security_Level = Secure;

   LFCLK_Source : constant SRC_SRC_Field :=
     (case NRF54_App_Runtime_Config.LFCLK_Src is
        when LFXO   => LFXO,
        when LFRC   => LFRC,
        when LFSYNT => LFSYNT);
   --  Selects the source for the LFCLK.
   --  Xtal selects the external 32.768 kHz crystal (LFXO).
   --  Rc selects the internal 32.768 kHz RC oscillator.
   --  Synth selects the LFCLK synthesized from the 16 MHz HFCLK.

   Trace_Pin_Config : constant PIN_CNF_Register :=
     (DIR => Output, DRIVE0 => E0, DRIVE1 => E1, others => <>);
begin

   if Is_Secure then

      --  nRF54L15 datasheet, Section 5.5.3:
      --  "The device starts at 64 MHz. For higher frequencies, it must be
      --  configured when the CPU starts and before any peripherals that use
      --  the high-frequency clock are enabled. Changing the frequency on a
      --  running system or to an unsupported value causes undefined system
      --  behavior and the device can malfunction."

      GLOBAL_OSCILLATORS_S_Periph.PLL.FREQ :=
        (FREQ   =>
           (case NRF54_App_Runtime_Config.MCU_Domain_Speed is
              when CK64M  => CK64M,
              when CK128M => CK128M),
         others => <>);

      case NRF54_App_Runtime_Config.Device is
         when nRF54LM20A | nRF54LM20B | nRF54LV10A =>
            --  Dummy read the KMU to start its boot preparations
            Unused := GLOBAL_KMU_S_Periph.STATUS;
            pragma Unreferenced (Unused);

         when others                               =>
            null;
      end case;

      Errata_37_Workaround;

      Apply_FICR_TRIMCNF;

      Errata_32_Workaround;
      Errata_40_Workaround;
      Errata_31_Workaround;

      if NRF54_App_Runtime_Config.Enable_SWO then
         case NRF54_App_Runtime_Config.Device is
            when nRF54LV10A =>
               GLOBAL_P2_S_Periph.PIN_CNF_6 := Trace_Pin_Config;
               GLOBAL_P2_S_Periph.PIN_CNF_7 := Trace_Pin_Config;

            when others     =>
               GLOBAL_P2_S_Periph.PIN_CNF_10 := Trace_Pin_Config;
               GLOBAL_P2_S_Periph.PIN_CNF_11 := Trace_Pin_Config;
         end case;
      end if;

      if NRF54_App_Runtime_Config.Enable_Trace then
         case NRF54_App_Runtime_Config.Device is
            when nRF54LV10A =>
               GLOBAL_P2_S_Periph.PIN_CNF_6 := Trace_Pin_Config;
               GLOBAL_P2_S_Periph.PIN_CNF_7 := Trace_Pin_Config;
               GLOBAL_P2_S_Periph.PIN_CNF_8 := Trace_Pin_Config;
               GLOBAL_P2_S_Periph.PIN_CNF_9 := Trace_Pin_Config;

            when others     =>
               GLOBAL_P2_S_Periph.PIN_CNF_10 := Trace_Pin_Config;
               GLOBAL_P2_S_Periph.PIN_CNF_11 := Trace_Pin_Config;
               GLOBAL_P2_S_Periph.PIN_CNF_12 := Trace_Pin_Config;
               GLOBAL_P2_S_Periph.PIN_CNF_13 := Trace_Pin_Config;
         end case;
      end if;

      if NRF54_App_Runtime_Config.Enable_SWO
        or NRF54_App_Runtime_Config.Enable_Trace
      then
         --  Use highest bias setting for E0/E1 drive mode
         GLOBAL_GPIOHSPADCTRL_S_Periph.BIAS := (HSBIAS => 3, others => <>);

         GLOBAL_TAD_S_Periph.TRACEPORTSPEED :=
           (TRACEPORTSPEED => DIV2, others => <>);
      end if;

      if NRF54_App_Runtime_Config.Enable_Glitch_Detector then
         GLOBAL_GLITCHDET_S_Periph.CONFIG.ENABLE := Enable;
      else
         GLOBAL_GLITCHDET_S_Periph.CONFIG := (ENABLE => Disable, others => <>);
      end if;

      --  Configure the 32.768 kHz external crystal.
      --  The LFCLK will be started later, if required by the runtime.
      --
      --  The Ravenscar runtimes use LFCLK as its timing source for task
      --  delays, so LFCLK will be started by
      --  System.BB.Board_Support.Initialize_Board.
      --
      --  The Light runtime does not use LFCLK, so it is not started in Light.

      GLOBAL_CLOCK_S_Periph.LFCLK.SRC := (SRC => LFCLK_Source, others => <>);

      --  Enable ICACHE

      ICACHE_S_Periph.ENABLE := (ENABLE => Enabled, others => <>);

      loop
         exit when ICACHE_S_Periph.STATUS.READY = Ready;
      end loop;

      ICACHE_S_Periph.TASKS_ERASE := (TASKS_ERASE => Trigger, others => <>);
   end if;

end Setup_Board;
