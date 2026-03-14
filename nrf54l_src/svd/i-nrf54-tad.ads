--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

package Interfaces.NRF54.TAD is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Activate power-up request
   type SYSPWRUPREQ_ACTIVE_Field is
     (--  Power-up request not active
      NotActive,
      --  Power-up request active
      Active)
     with Size => 1;
   for SYSPWRUPREQ_ACTIVE_Field use
     (NotActive => 0,
      Active => 1);

   --  System power-up request
   type SYSPWRUPREQ_Register is record
      --  Activate power-up request
      ACTIVE        : SYSPWRUPREQ_ACTIVE_Field :=
                       Interfaces.NRF54.TAD.NotActive;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SYSPWRUPREQ_Register use record
      ACTIVE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Activate power-up request
   type DBGPWRUPREQ_ACTIVE_Field is
     (--  Power-up request not active
      NotActive,
      --  Power-up request active
      Active)
     with Size => 1;
   for DBGPWRUPREQ_ACTIVE_Field use
     (NotActive => 0,
      Active => 1);

   --  Debug power-up request
   type DBGPWRUPREQ_Register is record
      --  Activate power-up request
      ACTIVE        : DBGPWRUPREQ_ACTIVE_Field :=
                       Interfaces.NRF54.TAD.NotActive;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DBGPWRUPREQ_Register use record
      ACTIVE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   type ENABLE_ENABLE_Field is
     (--  Disable debug domain and release selected GPIOs
      DISABLED,
      --  Enable debug domain and aquire selected GPIOs
      ENABLED)
     with Size => 1;
   for ENABLE_ENABLE_Field use
     (DISABLED => 0,
      ENABLED => 1);

   --  Enable debug domain and aquire selected GPIOs
   type ENABLE_Register is record
      ENABLE        : ENABLE_ENABLE_Field := Interfaces.NRF54.TAD.DISABLED;
      --  unspecified
      Reserved_1_31 : Interfaces.NRF54.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ENABLE_Register use record
      ENABLE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Trace port speed is divided from CPU clock. The TRACECLK pin output will
   --  be divided again by two from the trace port clock.
   type TRACEPORTSPEED_TRACEPORTSPEED_Field is
     (--  Trace port speed equals CPU clock
      DIV1,
      --  Trace port speed equals CPU clock divided by 2
      DIV2,
      --  Trace port speed equals CPU clock divided by 4
      DIV4,
      --  Trace port speed equals CPU clock divided by 32
      DIV32)
     with Size => 2;
   for TRACEPORTSPEED_TRACEPORTSPEED_Field use
     (DIV1 => 0,
      DIV2 => 1,
      DIV4 => 2,
      DIV32 => 3);

   --  Trace port speed
   type TRACEPORTSPEED_Register is record
      --  Trace port speed is divided from CPU clock. The TRACECLK pin output
      --  will be divided again by two from the trace port clock.
      TRACEPORTSPEED : TRACEPORTSPEED_TRACEPORTSPEED_Field :=
                        Interfaces.NRF54.TAD.DIV1;
      --  unspecified
      Reserved_2_31  : Interfaces.NRF54.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TRACEPORTSPEED_Register use record
      TRACEPORTSPEED at 0 range 0 .. 1;
      Reserved_2_31  at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Trace and debug control 0
   type TAD_Peripheral is record
      --  System power-up request
      SYSPWRUPREQ    : aliased SYSPWRUPREQ_Register;
      pragma Volatile_Full_Access (SYSPWRUPREQ);
      --  Debug power-up request
      DBGPWRUPREQ    : aliased DBGPWRUPREQ_Register;
      pragma Volatile_Full_Access (DBGPWRUPREQ);
      --  Enable debug domain and aquire selected GPIOs
      ENABLE         : aliased ENABLE_Register;
      pragma Volatile_Full_Access (ENABLE);
      --  Trace port speed
      TRACEPORTSPEED : aliased TRACEPORTSPEED_Register;
      pragma Volatile_Full_Access (TRACEPORTSPEED);
   end record
     with Volatile;

   for TAD_Peripheral use record
      SYSPWRUPREQ    at 16#400# range 0 .. 31;
      DBGPWRUPREQ    at 16#404# range 0 .. 31;
      ENABLE         at 16#500# range 0 .. 31;
      TRACEPORTSPEED at 16#518# range 0 .. 31;
   end record;

   --  Trace and debug control 0
   GLOBAL_TAD_NS_Periph : aliased TAD_Peripheral
     with Import, Address => GLOBAL_TAD_NS_Base;

   --  Trace and debug control 1
   GLOBAL_TAD_S_Periph : aliased TAD_Peripheral
     with Import, Address => GLOBAL_TAD_S_Base;

end Interfaces.NRF54.TAD;
