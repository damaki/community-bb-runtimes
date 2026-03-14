--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.GLITCHDET is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Enable glitch detector
   type CONFIG_ENABLE_Field is
     (--  Disable glitch detector
      Disable,
      --  Enable glitch detector
      Enable)
     with Size => 1;
   for CONFIG_ENABLE_Field use
     (Disable => 0,
      Enable => 1);

   --  Glitch detector mode
   type CONFIG_MODE_Field is
     (--  High pass filter mode
      HighPassFilter,
      --  Cap divider mode
      CapDiv)
     with Size => 1;
   for CONFIG_MODE_Field use
     (HighPassFilter => 0,
      CapDiv => 1);

   --  Configuration for glitch detector
   type CONFIG_Register is record
      --  Enable glitch detector
      ENABLE        : CONFIG_ENABLE_Field :=
                       Interfaces.NRF54.GLITCHDET.Enable;
      --  unspecified
      Reserved_1_3  : Interfaces.NRF54.UInt3 := 16#0#;
      --  Glitch detector mode
      MODE          : CONFIG_MODE_Field :=
                       Interfaces.NRF54.GLITCHDET.HighPassFilter;
      --  unspecified
      Reserved_5_31 : Interfaces.NRF54.UInt27 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      ENABLE        at 0 range 0 .. 0;
      Reserved_1_3  at 0 range 1 .. 3;
      MODE          at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Voltage glitch detectors
   type GLITCHDET_Peripheral is record
      --  Configuration for glitch detector
      CONFIG : aliased CONFIG_Register;
      pragma Volatile_Full_Access (CONFIG);
   end record
     with Volatile;

   for GLITCHDET_Peripheral use record
      CONFIG at 16#5A0# range 0 .. 31;
   end record;

   --  Voltage glitch detectors
   GLOBAL_GLITCHDET_S_Periph : aliased GLITCHDET_Peripheral
     with Import, Address => GLOBAL_GLITCHDET_S_Base;

end Interfaces.NRF54.GLITCHDET;
