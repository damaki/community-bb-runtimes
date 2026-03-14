--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.OSCILLATORS is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   ---------------------------------------------
   -- OSCILLATORS_XOSC32M cluster's Registers --
   ---------------------------------------------

   ----------------------------------------------------
   -- OSCILLATORS_XOSC32M_CONFIG cluster's Registers --
   ----------------------------------------------------

   subtype INTCAP_CONFIG_VAL_Field is Interfaces.NRF54.UInt6;

   --  Crystal load capacitor as seen by the crystal across its terminals,
   --  including pin capacitance but excluding PCB stray capacitance.
   type INTCAP_CONFIG_Register is record
      --  Crystal load capacitor value
      VAL           : INTCAP_CONFIG_VAL_Field := 16#20#;
      --  unspecified
      Reserved_6_31 : Interfaces.NRF54.UInt26 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTCAP_CONFIG_Register use record
      VAL           at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   --  Unspecified
   type OSCILLATORS_XOSC32M_CONFIG_Cluster is record
      --  Crystal load capacitor as seen by the crystal across its terminals,
      --  including pin capacitance but excluding PCB stray capacitance.
      INTCAP : aliased INTCAP_CONFIG_Register;
      pragma Volatile_Full_Access (INTCAP);
   end record
     with Size => 96;

   for OSCILLATORS_XOSC32M_CONFIG_Cluster use record
      INTCAP at 16#8# range 0 .. 31;
   end record;

   --  32 MHz oscillator control
   type OSCILLATORS_XOSC32M_Cluster is record
      --  Unspecified
      CONFIG : aliased OSCILLATORS_XOSC32M_CONFIG_Cluster;
   end record
     with Size => 256;

   for OSCILLATORS_XOSC32M_Cluster use record
      CONFIG at 16#14# range 0 .. 95;
   end record;

   -----------------------------------------
   -- OSCILLATORS_PLL cluster's Registers --
   -----------------------------------------

   --  Select CPU speed
   type FREQ_FREQ_Field is
     (--  128 MHz
      CK128M,
      --  64 MHz
      CK64M)
     with Size => 2;
   for FREQ_FREQ_Field use
     (CK128M => 1,
      CK64M => 3);

   --  Set speed of MCU power domain, including CPU
   type FREQ_PLL_Register is record
      --  Select CPU speed
      FREQ          : FREQ_FREQ_Field := Interfaces.NRF54.OSCILLATORS.CK64M;
      --  unspecified
      Reserved_2_31 : Interfaces.NRF54.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for FREQ_PLL_Register use record
      FREQ          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Active CPU speed
   type CURRENTFREQ_CURRENTFREQ_Field is
     (--  128 MHz
      CK128M,
      --  64 MHz
      CK64M)
     with Size => 2;
   for CURRENTFREQ_CURRENTFREQ_Field use
     (CK128M => 1,
      CK64M => 3);

   --  Current speed of MCU power domain, including CPU
   type CURRENTFREQ_PLL_Register is record
      --  Read-only. Active CPU speed
      CURRENTFREQ   : CURRENTFREQ_CURRENTFREQ_Field;
      --  unspecified
      Reserved_2_31 : Interfaces.NRF54.UInt30;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CURRENTFREQ_PLL_Register use record
      CURRENTFREQ   at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Oscillator control
   type OSCILLATORS_PLL_Cluster is record
      --  Set speed of MCU power domain, including CPU
      FREQ        : aliased FREQ_PLL_Register;
      pragma Volatile_Full_Access (FREQ);
      --  Current speed of MCU power domain, including CPU
      CURRENTFREQ : aliased CURRENTFREQ_PLL_Register;
      pragma Volatile_Full_Access (CURRENTFREQ);
   end record
     with Size => 64;

   for OSCILLATORS_PLL_Cluster use record
      FREQ        at 16#0# range 0 .. 31;
      CURRENTFREQ at 16#4# range 0 .. 31;
   end record;

   ----------------------------------------------
   -- OSCILLATORS_XOSC32KI cluster's Registers --
   ----------------------------------------------

   --  Enable or disable bypass of LFCLK crystal oscillator with external clock
   --  source
   type BYPASS_BYPASS_Field is
     (--  Disable (use crystal)
      Disabled,
      --  Enable (use rail-to-rail external source)
      Enabled)
     with Size => 1;
   for BYPASS_BYPASS_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable bypass of LFCLK crystal oscillator with external clock
   --  source
   type BYPASS_XOSC32KI_Register is record
      --  Enable or disable bypass of LFCLK crystal oscillator with external
      --  clock source
      BYPASS        : BYPASS_BYPASS_Field :=
                       Interfaces.NRF54.OSCILLATORS.Disabled;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for BYPASS_XOSC32KI_Register use record
      BYPASS        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype INTCAP_XOSC32KI_VAL_Field is Interfaces.NRF54.UInt5;

   --  Programmable capacitance of XL1 and XL2
   type INTCAP_XOSC32KI_Register is record
      --  Crystal load capacitor as seen by the crystal across its terminals,
      --  including pin capacitance but excluding PCB stray capacitance.
      VAL           : INTCAP_XOSC32KI_VAL_Field := 16#17#;
      --  unspecified
      Reserved_5_31 : Interfaces.NRF54.UInt27 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for INTCAP_XOSC32KI_Register use record
      VAL           at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  32.768 kHz oscillator control
   type OSCILLATORS_XOSC32KI_Cluster is record
      --  Enable or disable bypass of LFCLK crystal oscillator with external
      --  clock source
      BYPASS : aliased BYPASS_XOSC32KI_Register;
      pragma Volatile_Full_Access (BYPASS);
      --  Programmable capacitance of XL1 and XL2
      INTCAP : aliased INTCAP_XOSC32KI_Register;
      pragma Volatile_Full_Access (INTCAP);
   end record
     with Size => 64;

   for OSCILLATORS_XOSC32KI_Cluster use record
      BYPASS at 16#0# range 0 .. 31;
      INTCAP at 16#4# range 0 .. 31;
   end record;

   ---------------------------------------------
   -- OSCILLATORS_XOSC32M cluster's Registers --
   ---------------------------------------------

   ----------------------------------------------------
   -- OSCILLATORS_XOSC32M_CONFIG cluster's Registers --
   ----------------------------------------------------

   -----------------------------------------
   -- OSCILLATORS_PLL cluster's Registers --
   -----------------------------------------

   ----------------------------------------------
   -- OSCILLATORS_XOSC32KI cluster's Registers --
   ----------------------------------------------

   -----------------
   -- Peripherals --
   -----------------

   --  Oscillator control 0
   type OSCILLATORS_Peripheral is record
      --  32 MHz oscillator control
      XOSC32M  : aliased OSCILLATORS_XOSC32M_Cluster;
      --  Oscillator control
      PLL      : aliased OSCILLATORS_PLL_Cluster;
      --  32.768 kHz oscillator control
      XOSC32KI : aliased OSCILLATORS_XOSC32KI_Cluster;
   end record
     with Volatile;

   for OSCILLATORS_Peripheral use record
      XOSC32M  at 16#700# range 0 .. 255;
      PLL      at 16#800# range 0 .. 63;
      XOSC32KI at 16#900# range 0 .. 63;
   end record;

   --  Oscillator control 0
   GLOBAL_OSCILLATORS_NS_Periph : aliased OSCILLATORS_Peripheral
     with Import, Address => GLOBAL_OSCILLATORS_NS_Base;

   --  Oscillator control 1
   GLOBAL_OSCILLATORS_S_Periph : aliased OSCILLATORS_Peripheral
     with Import, Address => GLOBAL_OSCILLATORS_S_Base;

end Interfaces.NRF54.OSCILLATORS;
