--
--  Copyright (C) 2026, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2010 - 2025, Nordic Semiconductor ASA All rights reserved.SPDX-License-Identifier: BSD-3-ClauseRedistribution and use in source and binary forms, with or withoutmodification, are permitted provided that the following conditions are met:1. Redistributions of source code must retain the above copyright notice, this   list of conditions and the following disclaimer.2. Redistributions in binary form must reproduce the above copyright   notice, this list of conditions and the following disclaimer in the   documentation and/or other materials provided with the distribution.3. Neither the name of Nordic Semiconductor ASA nor the names of its   contributors may be used to endorse or promote products derived from this   software without specific prior written permission.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THEIMPLIED WARRANTIES OF MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSEARE DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BELIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OFSUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESSINTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THEPOSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from nrf54l15_application.svd


with System;

--  System-on-chip with a 32-bit Arm Cortex-M33 microcontroller
package Interfaces.NRF54 is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Base type --
   ---------------

   type UInt32 is new Interfaces.Unsigned_32;
   type UInt16 is new Interfaces.Unsigned_16;
   type Byte is new Interfaces.Unsigned_8;
   type Bit is mod 2**1
     with Size => 1;
   type UInt2 is mod 2**2
     with Size => 2;
   type UInt3 is mod 2**3
     with Size => 3;
   type UInt4 is mod 2**4
     with Size => 4;
   type UInt5 is mod 2**5
     with Size => 5;
   type UInt6 is mod 2**6
     with Size => 6;
   type UInt7 is mod 2**7
     with Size => 7;
   type UInt9 is mod 2**9
     with Size => 9;
   type UInt10 is mod 2**10
     with Size => 10;
   type UInt11 is mod 2**11
     with Size => 11;
   type UInt12 is mod 2**12
     with Size => 12;
   type UInt13 is mod 2**13
     with Size => 13;
   type UInt14 is mod 2**14
     with Size => 14;
   type UInt15 is mod 2**15
     with Size => 15;
   type UInt17 is mod 2**17
     with Size => 17;
   type UInt18 is mod 2**18
     with Size => 18;
   type UInt19 is mod 2**19
     with Size => 19;
   type UInt20 is mod 2**20
     with Size => 20;
   type UInt21 is mod 2**21
     with Size => 21;
   type UInt22 is mod 2**22
     with Size => 22;
   type UInt23 is mod 2**23
     with Size => 23;
   type UInt24 is mod 2**24
     with Size => 24;
   type UInt25 is mod 2**25
     with Size => 25;
   type UInt26 is mod 2**26
     with Size => 26;
   type UInt27 is mod 2**27
     with Size => 27;
   type UInt28 is mod 2**28
     with Size => 28;
   type UInt29 is mod 2**29
     with Size => 29;
   type UInt30 is mod 2**30
     with Size => 30;
   type UInt31 is mod 2**31
     with Size => 31;

   --------------------
   -- Base addresses --
   --------------------

   GLOBAL_FICR_NS_Base : constant System.Address := System'To_Address (16#FFC000#);
   GLOBAL_UICR_S_Base : constant System.Address := System'To_Address (16#FFD000#);
   GLOBAL_SICR_S_Base : constant System.Address := System'To_Address (16#FFE000#);
   ICACHEDATA_S_Base : constant System.Address := System'To_Address (16#2F00000#);
   ICACHEINFO_S_Base : constant System.Address := System'To_Address (16#2F10000#);
   GLOBAL_CRACENCORE_S_Base : constant System.Address := System'To_Address (16#51800000#);
   TPIU_NS_Base : constant System.Address := System'To_Address (16#E0040000#);
   ETM_NS_Base : constant System.Address := System'To_Address (16#E0041000#);
   CPUC_S_Base : constant System.Address := System'To_Address (16#E0080000#);
   ICACHE_S_Base : constant System.Address := System'To_Address (16#E0082000#);
   SWI00_S_Base : constant System.Address := System'To_Address (16#5001C000#);
   SWI01_S_Base : constant System.Address := System'To_Address (16#5001D000#);
   SWI02_S_Base : constant System.Address := System'To_Address (16#5001E000#);
   SWI03_S_Base : constant System.Address := System'To_Address (16#5001F000#);
   GLOBAL_SPU00_S_Base : constant System.Address := System'To_Address (16#50040000#);
   GLOBAL_MPC00_S_Base : constant System.Address := System'To_Address (16#50041000#);
   GLOBAL_DPPIC00_NS_Base : constant System.Address := System'To_Address (16#40042000#);
   GLOBAL_DPPIC00_S_Base : constant System.Address := System'To_Address (16#50042000#);
   GLOBAL_PPIB00_NS_Base : constant System.Address := System'To_Address (16#40043000#);
   GLOBAL_PPIB00_S_Base : constant System.Address := System'To_Address (16#50043000#);
   GLOBAL_PPIB01_NS_Base : constant System.Address := System'To_Address (16#40044000#);
   GLOBAL_PPIB01_S_Base : constant System.Address := System'To_Address (16#50044000#);
   GLOBAL_KMU_S_Base : constant System.Address := System'To_Address (16#50045000#);
   GLOBAL_AAR00_NS_Base : constant System.Address := System'To_Address (16#40046000#);
   GLOBAL_CCM00_NS_Base : constant System.Address := System'To_Address (16#40046000#);
   GLOBAL_AAR00_S_Base : constant System.Address := System'To_Address (16#50046000#);
   GLOBAL_CCM00_S_Base : constant System.Address := System'To_Address (16#50046000#);
   GLOBAL_ECB00_NS_Base : constant System.Address := System'To_Address (16#40047000#);
   GLOBAL_ECB00_S_Base : constant System.Address := System'To_Address (16#50047000#);
   GLOBAL_CRACEN_S_Base : constant System.Address := System'To_Address (16#50048000#);
   GLOBAL_SPIM00_NS_Base : constant System.Address := System'To_Address (16#4004A000#);
   GLOBAL_SPIS00_NS_Base : constant System.Address := System'To_Address (16#4004A000#);
   GLOBAL_UARTE00_NS_Base : constant System.Address := System'To_Address (16#4004A000#);
   GLOBAL_SPIM00_S_Base : constant System.Address := System'To_Address (16#5004A000#);
   GLOBAL_SPIS00_S_Base : constant System.Address := System'To_Address (16#5004A000#);
   GLOBAL_UARTE00_S_Base : constant System.Address := System'To_Address (16#5004A000#);
   GLOBAL_GLITCHDET_S_Base : constant System.Address := System'To_Address (16#5004B000#);
   GLOBAL_RRAMC_S_Base : constant System.Address := System'To_Address (16#5004B000#);
   GLOBAL_VPR00_NS_Base : constant System.Address := System'To_Address (16#4004C000#);
   GLOBAL_VPR00_S_Base : constant System.Address := System'To_Address (16#5004C000#);
   GLOBAL_P2_NS_Base : constant System.Address := System'To_Address (16#40050400#);
   GLOBAL_GPIOHSPADCTRL_S_Base : constant System.Address := System'To_Address (16#50050400#);
   GLOBAL_P2_S_Base : constant System.Address := System'To_Address (16#50050400#);
   GLOBAL_CTRLAP_NS_Base : constant System.Address := System'To_Address (16#40052000#);
   GLOBAL_CTRLAP_S_Base : constant System.Address := System'To_Address (16#50052000#);
   GLOBAL_TAD_NS_Base : constant System.Address := System'To_Address (16#40053000#);
   GLOBAL_TAD_S_Base : constant System.Address := System'To_Address (16#50053000#);
   GLOBAL_TIMER00_NS_Base : constant System.Address := System'To_Address (16#40055000#);
   GLOBAL_TIMER00_S_Base : constant System.Address := System'To_Address (16#50055000#);
   GLOBAL_SPU10_S_Base : constant System.Address := System'To_Address (16#50080000#);
   GLOBAL_DPPIC10_NS_Base : constant System.Address := System'To_Address (16#40082000#);
   GLOBAL_DPPIC10_S_Base : constant System.Address := System'To_Address (16#50082000#);
   GLOBAL_PPIB10_NS_Base : constant System.Address := System'To_Address (16#40083000#);
   GLOBAL_PPIB10_S_Base : constant System.Address := System'To_Address (16#50083000#);
   GLOBAL_PPIB11_NS_Base : constant System.Address := System'To_Address (16#40084000#);
   GLOBAL_PPIB11_S_Base : constant System.Address := System'To_Address (16#50084000#);
   GLOBAL_TIMER10_NS_Base : constant System.Address := System'To_Address (16#40085000#);
   GLOBAL_TIMER10_S_Base : constant System.Address := System'To_Address (16#50085000#);
   GLOBAL_EGU10_NS_Base : constant System.Address := System'To_Address (16#40087000#);
   GLOBAL_EGU10_S_Base : constant System.Address := System'To_Address (16#50087000#);
   GLOBAL_RADIO_NS_Base : constant System.Address := System'To_Address (16#4008A000#);
   GLOBAL_RADIO_S_Base : constant System.Address := System'To_Address (16#5008A000#);
   GLOBAL_SPU20_S_Base : constant System.Address := System'To_Address (16#500C0000#);
   GLOBAL_DPPIC20_NS_Base : constant System.Address := System'To_Address (16#400C2000#);
   GLOBAL_DPPIC20_S_Base : constant System.Address := System'To_Address (16#500C2000#);
   GLOBAL_PPIB20_NS_Base : constant System.Address := System'To_Address (16#400C3000#);
   GLOBAL_PPIB20_S_Base : constant System.Address := System'To_Address (16#500C3000#);
   GLOBAL_PPIB21_NS_Base : constant System.Address := System'To_Address (16#400C4000#);
   GLOBAL_PPIB21_S_Base : constant System.Address := System'To_Address (16#500C4000#);
   GLOBAL_PPIB22_NS_Base : constant System.Address := System'To_Address (16#400C5000#);
   GLOBAL_PPIB22_S_Base : constant System.Address := System'To_Address (16#500C5000#);
   GLOBAL_SPIM20_NS_Base : constant System.Address := System'To_Address (16#400C6000#);
   GLOBAL_SPIS20_NS_Base : constant System.Address := System'To_Address (16#400C6000#);
   GLOBAL_TWIM20_NS_Base : constant System.Address := System'To_Address (16#400C6000#);
   GLOBAL_TWIS20_NS_Base : constant System.Address := System'To_Address (16#400C6000#);
   GLOBAL_UARTE20_NS_Base : constant System.Address := System'To_Address (16#400C6000#);
   GLOBAL_SPIM20_S_Base : constant System.Address := System'To_Address (16#500C6000#);
   GLOBAL_SPIS20_S_Base : constant System.Address := System'To_Address (16#500C6000#);
   GLOBAL_TWIM20_S_Base : constant System.Address := System'To_Address (16#500C6000#);
   GLOBAL_TWIS20_S_Base : constant System.Address := System'To_Address (16#500C6000#);
   GLOBAL_UARTE20_S_Base : constant System.Address := System'To_Address (16#500C6000#);
   GLOBAL_SPIM21_NS_Base : constant System.Address := System'To_Address (16#400C7000#);
   GLOBAL_SPIS21_NS_Base : constant System.Address := System'To_Address (16#400C7000#);
   GLOBAL_TWIM21_NS_Base : constant System.Address := System'To_Address (16#400C7000#);
   GLOBAL_TWIS21_NS_Base : constant System.Address := System'To_Address (16#400C7000#);
   GLOBAL_UARTE21_NS_Base : constant System.Address := System'To_Address (16#400C7000#);
   GLOBAL_SPIM21_S_Base : constant System.Address := System'To_Address (16#500C7000#);
   GLOBAL_SPIS21_S_Base : constant System.Address := System'To_Address (16#500C7000#);
   GLOBAL_TWIM21_S_Base : constant System.Address := System'To_Address (16#500C7000#);
   GLOBAL_TWIS21_S_Base : constant System.Address := System'To_Address (16#500C7000#);
   GLOBAL_UARTE21_S_Base : constant System.Address := System'To_Address (16#500C7000#);
   GLOBAL_SPIM22_NS_Base : constant System.Address := System'To_Address (16#400C8000#);
   GLOBAL_SPIS22_NS_Base : constant System.Address := System'To_Address (16#400C8000#);
   GLOBAL_TWIM22_NS_Base : constant System.Address := System'To_Address (16#400C8000#);
   GLOBAL_TWIS22_NS_Base : constant System.Address := System'To_Address (16#400C8000#);
   GLOBAL_UARTE22_NS_Base : constant System.Address := System'To_Address (16#400C8000#);
   GLOBAL_SPIM22_S_Base : constant System.Address := System'To_Address (16#500C8000#);
   GLOBAL_SPIS22_S_Base : constant System.Address := System'To_Address (16#500C8000#);
   GLOBAL_TWIM22_S_Base : constant System.Address := System'To_Address (16#500C8000#);
   GLOBAL_TWIS22_S_Base : constant System.Address := System'To_Address (16#500C8000#);
   GLOBAL_UARTE22_S_Base : constant System.Address := System'To_Address (16#500C8000#);
   GLOBAL_EGU20_NS_Base : constant System.Address := System'To_Address (16#400C9000#);
   GLOBAL_EGU20_S_Base : constant System.Address := System'To_Address (16#500C9000#);
   GLOBAL_TIMER20_NS_Base : constant System.Address := System'To_Address (16#400CA000#);
   GLOBAL_TIMER20_S_Base : constant System.Address := System'To_Address (16#500CA000#);
   GLOBAL_TIMER21_NS_Base : constant System.Address := System'To_Address (16#400CB000#);
   GLOBAL_TIMER21_S_Base : constant System.Address := System'To_Address (16#500CB000#);
   GLOBAL_TIMER22_NS_Base : constant System.Address := System'To_Address (16#400CC000#);
   GLOBAL_TIMER22_S_Base : constant System.Address := System'To_Address (16#500CC000#);
   GLOBAL_TIMER23_NS_Base : constant System.Address := System'To_Address (16#400CD000#);
   GLOBAL_TIMER23_S_Base : constant System.Address := System'To_Address (16#500CD000#);
   GLOBAL_TIMER24_NS_Base : constant System.Address := System'To_Address (16#400CE000#);
   GLOBAL_TIMER24_S_Base : constant System.Address := System'To_Address (16#500CE000#);
   GLOBAL_MEMCONF_NS_Base : constant System.Address := System'To_Address (16#400CF000#);
   GLOBAL_MEMCONF_S_Base : constant System.Address := System'To_Address (16#500CF000#);
   GLOBAL_PDM20_NS_Base : constant System.Address := System'To_Address (16#400D0000#);
   GLOBAL_PDM20_S_Base : constant System.Address := System'To_Address (16#500D0000#);
   GLOBAL_PDM21_NS_Base : constant System.Address := System'To_Address (16#400D1000#);
   GLOBAL_PDM21_S_Base : constant System.Address := System'To_Address (16#500D1000#);
   GLOBAL_PWM20_NS_Base : constant System.Address := System'To_Address (16#400D2000#);
   GLOBAL_PWM20_S_Base : constant System.Address := System'To_Address (16#500D2000#);
   GLOBAL_PWM21_NS_Base : constant System.Address := System'To_Address (16#400D3000#);
   GLOBAL_PWM21_S_Base : constant System.Address := System'To_Address (16#500D3000#);
   GLOBAL_PWM22_NS_Base : constant System.Address := System'To_Address (16#400D4000#);
   GLOBAL_PWM22_S_Base : constant System.Address := System'To_Address (16#500D4000#);
   GLOBAL_SAADC_NS_Base : constant System.Address := System'To_Address (16#400D5000#);
   GLOBAL_SAADC_S_Base : constant System.Address := System'To_Address (16#500D5000#);
   GLOBAL_NFCT_NS_Base : constant System.Address := System'To_Address (16#400D6000#);
   GLOBAL_NFCT_S_Base : constant System.Address := System'To_Address (16#500D6000#);
   GLOBAL_TEMP_NS_Base : constant System.Address := System'To_Address (16#400D7000#);
   GLOBAL_TEMP_S_Base : constant System.Address := System'To_Address (16#500D7000#);
   GLOBAL_P1_NS_Base : constant System.Address := System'To_Address (16#400D8200#);
   GLOBAL_P1_S_Base : constant System.Address := System'To_Address (16#500D8200#);
   GLOBAL_GPIOTE20_NS_Base : constant System.Address := System'To_Address (16#400DA000#);
   GLOBAL_GPIOTE20_S_Base : constant System.Address := System'To_Address (16#500DA000#);
   GLOBAL_TAMPC_S_Base : constant System.Address := System'To_Address (16#500DC000#);
   GLOBAL_I2S20_NS_Base : constant System.Address := System'To_Address (16#400DD000#);
   GLOBAL_I2S20_S_Base : constant System.Address := System'To_Address (16#500DD000#);
   GLOBAL_QDEC20_NS_Base : constant System.Address := System'To_Address (16#400E0000#);
   GLOBAL_QDEC20_S_Base : constant System.Address := System'To_Address (16#500E0000#);
   GLOBAL_QDEC21_NS_Base : constant System.Address := System'To_Address (16#400E1000#);
   GLOBAL_QDEC21_S_Base : constant System.Address := System'To_Address (16#500E1000#);
   GLOBAL_GRTC_NS_Base : constant System.Address := System'To_Address (16#400E2000#);
   GLOBAL_GRTC_S_Base : constant System.Address := System'To_Address (16#500E2000#);
   GLOBAL_SPU30_S_Base : constant System.Address := System'To_Address (16#50100000#);
   GLOBAL_DPPIC30_NS_Base : constant System.Address := System'To_Address (16#40102000#);
   GLOBAL_DPPIC30_S_Base : constant System.Address := System'To_Address (16#50102000#);
   GLOBAL_PPIB30_NS_Base : constant System.Address := System'To_Address (16#40103000#);
   GLOBAL_PPIB30_S_Base : constant System.Address := System'To_Address (16#50103000#);
   GLOBAL_SPIM30_NS_Base : constant System.Address := System'To_Address (16#40104000#);
   GLOBAL_SPIS30_NS_Base : constant System.Address := System'To_Address (16#40104000#);
   GLOBAL_TWIM30_NS_Base : constant System.Address := System'To_Address (16#40104000#);
   GLOBAL_TWIS30_NS_Base : constant System.Address := System'To_Address (16#40104000#);
   GLOBAL_UARTE30_NS_Base : constant System.Address := System'To_Address (16#40104000#);
   GLOBAL_SPIM30_S_Base : constant System.Address := System'To_Address (16#50104000#);
   GLOBAL_SPIS30_S_Base : constant System.Address := System'To_Address (16#50104000#);
   GLOBAL_TWIM30_S_Base : constant System.Address := System'To_Address (16#50104000#);
   GLOBAL_TWIS30_S_Base : constant System.Address := System'To_Address (16#50104000#);
   GLOBAL_UARTE30_S_Base : constant System.Address := System'To_Address (16#50104000#);
   GLOBAL_COMP_NS_Base : constant System.Address := System'To_Address (16#40106000#);
   GLOBAL_LPCOMP_NS_Base : constant System.Address := System'To_Address (16#40106000#);
   GLOBAL_COMP_S_Base : constant System.Address := System'To_Address (16#50106000#);
   GLOBAL_LPCOMP_S_Base : constant System.Address := System'To_Address (16#50106000#);
   GLOBAL_WDT30_S_Base : constant System.Address := System'To_Address (16#50108000#);
   GLOBAL_WDT31_NS_Base : constant System.Address := System'To_Address (16#40109000#);
   GLOBAL_WDT31_S_Base : constant System.Address := System'To_Address (16#50109000#);
   GLOBAL_P0_NS_Base : constant System.Address := System'To_Address (16#4010A000#);
   GLOBAL_P0_S_Base : constant System.Address := System'To_Address (16#5010A000#);
   GLOBAL_GPIOTE30_NS_Base : constant System.Address := System'To_Address (16#4010C000#);
   GLOBAL_GPIOTE30_S_Base : constant System.Address := System'To_Address (16#5010C000#);
   GLOBAL_CLOCK_NS_Base : constant System.Address := System'To_Address (16#4010E000#);
   GLOBAL_POWER_NS_Base : constant System.Address := System'To_Address (16#4010E000#);
   GLOBAL_RESET_NS_Base : constant System.Address := System'To_Address (16#4010E000#);
   GLOBAL_CLOCK_S_Base : constant System.Address := System'To_Address (16#5010E000#);
   GLOBAL_POWER_S_Base : constant System.Address := System'To_Address (16#5010E000#);
   GLOBAL_RESET_S_Base : constant System.Address := System'To_Address (16#5010E000#);
   GLOBAL_OSCILLATORS_NS_Base : constant System.Address := System'To_Address (16#40120000#);
   GLOBAL_REGULATORS_NS_Base : constant System.Address := System'To_Address (16#40120000#);
   GLOBAL_OSCILLATORS_S_Base : constant System.Address := System'To_Address (16#50120000#);
   GLOBAL_REGULATORS_S_Base : constant System.Address := System'To_Address (16#50120000#);

end Interfaces.NRF54;
