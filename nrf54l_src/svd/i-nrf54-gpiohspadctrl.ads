--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.GPIOHSPADCTRL is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype BIAS_HSBIAS_Field is Interfaces.NRF54.UInt2;
   subtype BIAS_REPLICABIAS_Field is Interfaces.NRF54.Bit;

   --  Bias control
   type BIAS_Register is record
      --  Slew setting for high-speed pad (higher value is faster)
      HSBIAS        : BIAS_HSBIAS_Field := 16#0#;
      --  Slew setting for replica clock (used by the VPR coprocessor for
      --  emulating a QSPI peripheral)
      REPLICABIAS   : BIAS_REPLICABIAS_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : Interfaces.NRF54.UInt29 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for BIAS_Register use record
      HSBIAS        at 0 range 0 .. 1;
      REPLICABIAS   at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype CTRL_RXDELAY_Field is Interfaces.NRF54.UInt3;

   --  Enable SCK
   type CTRL_SCKEN_Field is
     (--  Delay chain is reset and delayed sampling is disabled
      Disabled,
      --  Delay chain and delayed sampling is active
      Enabled)
     with Size => 1;
   for CTRL_SCKEN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  SCK phase
   type CTRL_SCKPHASE_Field is
     (--  Invert SCK phase
      Inverted,
      --  Non-inverted SCK phase
      NonInverted)
     with Size => 1;
   for CTRL_SCKPHASE_Field use
     (Inverted => 0,
      NonInverted => 1);

   --  Enable CSN synchronization of sampling
   type CTRL_CSNEN_Field is
     (--  Delay chain is reset on active edge of CSN
      Enabled,
      --  Delay chain is not reset on active edge of CSN
      Disabled)
     with Size => 1;
   for CTRL_CSNEN_Field use
     (Enabled => 0,
      Disabled => 1);

   --  Enable delayed sampling
   type CTRL_DATAENABLE_Field is
     (--  Delayed sampling is disabled
      Disabled,
      --  Delayed sampling is enabled
      Enabled)
     with Size => 4;
   for CTRL_DATAENABLE_Field use
     (Disabled => 0,
      Enabled => 15);

   --  Input sampling and buffering control (used by the VPR coprocessor for
   --  emulating a QSPI peripheral)
   type CTRL_Register is record
      --  Delay selection
      RXDELAY        : CTRL_RXDELAY_Field := 16#0#;
      --  Enable SCK
      SCKEN          : CTRL_SCKEN_Field :=
                        Interfaces.NRF54.GPIOHSPADCTRL.Disabled;
      --  SCK phase
      SCKPHASE       : CTRL_SCKPHASE_Field :=
                        Interfaces.NRF54.GPIOHSPADCTRL.Inverted;
      --  Enable CSN synchronization of sampling
      CSNEN          : CTRL_CSNEN_Field :=
                        Interfaces.NRF54.GPIOHSPADCTRL.Enabled;
      --  Enable delayed sampling
      DATAENABLE     : CTRL_DATAENABLE_Field :=
                        Interfaces.NRF54.GPIOHSPADCTRL.Disabled;
      --  unspecified
      Reserved_10_31 : Interfaces.NRF54.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      RXDELAY        at 0 range 0 .. 2;
      SCKEN          at 0 range 3 .. 3;
      SCKPHASE       at 0 range 4 .. 4;
      CSNEN          at 0 range 5 .. 5;
      DATAENABLE     at 0 range 6 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  GPIO high-speed pad control
   type GPIOHSPADCTRL_Peripheral is record
      --  Bias control
      BIAS : aliased BIAS_Register;
      pragma Volatile_Full_Access (BIAS);
      --  Input sampling and buffering control (used by the VPR coprocessor for
      --  emulating a QSPI peripheral)
      CTRL : aliased CTRL_Register;
      pragma Volatile_Full_Access (CTRL);
   end record
     with Volatile;

   for GPIOHSPADCTRL_Peripheral use record
      BIAS at 16#30# range 0 .. 31;
      CTRL at 16#38# range 0 .. 31;
   end record;

   --  GPIO high-speed pad control
   GLOBAL_GPIOHSPADCTRL_S_Periph : aliased GPIOHSPADCTRL_Peripheral
     with Import, Address => GLOBAL_GPIOHSPADCTRL_S_Base;

end Interfaces.NRF54.GPIOHSPADCTRL;
