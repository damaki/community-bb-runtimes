--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54ls05b_enga_application.svd

--  This is a version for the System-on-chip with a 32-bit Arm Cortex-M33
--  microcontroller MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   --  System tick
   Sys_Tick_Interrupt     : constant Interrupt_ID := -1;
   SWI00_Interrupt        : constant Interrupt_ID := 28;
   SWI01_Interrupt        : constant Interrupt_ID := 29;
   SWI02_Interrupt        : constant Interrupt_ID := 30;
   SWI03_Interrupt        : constant Interrupt_ID := 31;
   AAR00_CCM00_Interrupt  : constant Interrupt_ID := 74;
   ECB00_Interrupt        : constant Interrupt_ID := 75;
   RRAMC_Interrupt        : constant Interrupt_ID := 78;
   CTRLAP_Interrupt       : constant Interrupt_ID := 82;
   TIMER00_Interrupt      : constant Interrupt_ID := 85;
   EGU00_Interrupt        : constant Interrupt_ID := 88;
   CRACEN_Interrupt       : constant Interrupt_ID := 89;
   TIMER10_Interrupt      : constant Interrupt_ID := 133;
   EGU10_Interrupt        : constant Interrupt_ID := 135;
   RADIO_0_Interrupt      : constant Interrupt_ID := 138;
   RADIO_1_Interrupt      : constant Interrupt_ID := 139;
   SERIAL20_Interrupt     : constant Interrupt_ID := 198;
   SERIAL21_Interrupt     : constant Interrupt_ID := 199;
   SERIAL22_Interrupt     : constant Interrupt_ID := 200;
   EGU20_Interrupt        : constant Interrupt_ID := 201;
   TIMER20_Interrupt      : constant Interrupt_ID := 202;
   PWM20_Interrupt        : constant Interrupt_ID := 210;
   SAADC_Interrupt        : constant Interrupt_ID := 213;
   TEMP_Interrupt         : constant Interrupt_ID := 215;
   GPIOTE20_0_Interrupt   : constant Interrupt_ID := 218;
   QDEC20_Interrupt       : constant Interrupt_ID := 224;
   GRTC_0_Interrupt       : constant Interrupt_ID := 226;
   GRTC_1_Interrupt       : constant Interrupt_ID := 227;
   GRTC_2_Interrupt       : constant Interrupt_ID := 228;
   GRTC_3_Interrupt       : constant Interrupt_ID := 229;
   TAMPC_Interrupt        : constant Interrupt_ID := 239;
   WDT30_Interrupt        : constant Interrupt_ID := 264;
   GPIOTE30_0_Interrupt   : constant Interrupt_ID := 268;
   CLOCK_POWER_Interrupt  : constant Interrupt_ID := 270;

end Ada.Interrupts.Names;
