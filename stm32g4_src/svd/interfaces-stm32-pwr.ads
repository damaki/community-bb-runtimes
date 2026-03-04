--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G484xx.svd


with System;

package Interfaces.STM32.PWR is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Low-power mode selection These bits select the low-power mode entered
   --  when CPU enters the deepsleep mode. 1xx: Shutdown mode Note: In Standby
   --  mode, SRAM2 can be preserved or not, depending on RRS bit configuration
   --  in PWR_CR3.
   type PWR_CR1_LPMS_Field is
     (--  Stop 0 mode
      B_0x0,
      --  Stop 1 mode
      B_0x1,
      --  Standby mode
      B_0x3)
     with Size => 3;
   for PWR_CR1_LPMS_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x3 => 3);

   subtype PWR_CR1_FPD_STOP_Field is Interfaces.STM32.Bit;

   --  Disable backup domain write protection In reset state, the RTC and
   --  backup registers are protected against parasitic write access. This bit
   --  must be set to enable write access to these registers.
   type PWR_CR1_DBP_Field is
     (--  Access to RTC and Backup registers disabled
      B_0x0,
      --  Access to RTC and Backup registers enabled
      B_0x1)
     with Size => 1;
   for PWR_CR1_DBP_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Voltage scaling range selection
   type PWR_CR1_VOS_Field is
     (--  Cannot be written (forbidden by hardware)
      B_0x0,
      --  Range 1
      B_0x1,
      --  Range 2
      B_0x2,
      --  Cannot be written (forbidden by hardware)
      B_0x3)
     with Size => 2;
   for PWR_CR1_VOS_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype PWR_CR1_LPR_Field is Interfaces.STM32.Bit;

   --  Power control register 1
   type PWR_CR1_Register is record
      --  Low-power mode selection These bits select the low-power mode entered
      --  when CPU enters the deepsleep mode. 1xx: Shutdown mode Note: In
      --  Standby mode, SRAM2 can be preserved or not, depending on RRS bit
      --  configuration in PWR_CR3.
      LPMS           : PWR_CR1_LPMS_Field := Interfaces.STM32.PWR.B_0x0;
      --  FPD_STOP
      FPD_STOP       : PWR_CR1_FPD_STOP_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : Interfaces.STM32.UInt4 := 16#0#;
      --  Disable backup domain write protection In reset state, the RTC and
      --  backup registers are protected against parasitic write access. This
      --  bit must be set to enable write access to these registers.
      DBP            : PWR_CR1_DBP_Field := Interfaces.STM32.PWR.B_0x0;
      --  Voltage scaling range selection
      VOS            : PWR_CR1_VOS_Field := Interfaces.STM32.PWR.B_0x1;
      --  unspecified
      Reserved_11_13 : Interfaces.STM32.UInt3 := 16#0#;
      --  Low-power run When this bit is set, the regulator is switched from
      --  main mode (MR) to low-power mode (LPR).
      LPR            : PWR_CR1_LPR_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.STM32.UInt17 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_CR1_Register use record
      LPMS           at 0 range 0 .. 2;
      FPD_STOP       at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      DBP            at 0 range 8 .. 8;
      VOS            at 0 range 9 .. 10;
      Reserved_11_13 at 0 range 11 .. 13;
      LPR            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  Programmable voltage detector enable Note: This bit is write-protected
   --  when the PVDL bit is set in the SYSCFG_CFGR2 register. The protection
   --  can be reset only by a system reset.
   type PWR_CR2_PVDE_Field is
     (--  Programmable voltage detector disable.
      B_0x0,
      --  Programmable voltage detector enable.
      B_0x1)
     with Size => 1;
   for PWR_CR2_PVDE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Programmable voltage detector level selection. These bits select the PVD
   --  falling threshold: Note: These bits are write-protected when the PVDL
   --  bit is set in the SYSCFG_CFGR2 register. The protection can be reset
   --  only by a system reset.
   type PWR_CR2_PVDLS_Field is
     (--  V<sub>PVD0</sub> PVD threshold 0
      B_0x0,
      --  V<sub>PVD1</sub> PVD threshold 1
      B_0x1,
      --  V<sub>PVD2</sub> PVD threshold 2
      B_0x2,
      --  V<sub>PVD3</sub> PVD threshold 3
      B_0x3,
      --  V<sub>PVD4</sub> PVD threshold 4
      B_0x4,
      --  V<sub>PVD5</sub> PVD threshold 5
      B_0x5,
      --  V<sub>PVD6</sub> PVD threshold 6
      B_0x6,
      --  External input analog voltage PVD_IN (compared internally to
--  V<sub>REFINT</sub>)
      B_0x7)
     with Size => 3;
   for PWR_CR2_PVDLS_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7);

   --  Peripheral voltage monitoring 3 enable: V<sub>DDA</sub> vs. ADC/COMP min
   --  voltage 1.62V
   type PWR_CR2_PVMEN1_Field is
     (--  PVM1 (V<sub>DDA</sub> monitoring vs. 1.62V threshold) disable.
      B_0x0,
      --  PVM1 (V<sub>DDA</sub> monitoring vs. 1.62V threshold) enable.
      B_0x1)
     with Size => 1;
   for PWR_CR2_PVMEN1_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Peripheral voltage monitoring 4 enable: V<sub>DDA</sub> vs. DAC 1MSPS
   --  /DAC 15MSPS min voltage.
   type PWR_CR2_PVMEN2_Field is
     (--  PVM2 (V<sub>DDA</sub> monitoring vs. 1.8 V threshold) disable.
      B_0x0,
      --  PVM2 (V<sub>DDA</sub> monitoring vs. 1.8 V threshold) enable.
      B_0x1)
     with Size => 1;
   for PWR_CR2_PVMEN2_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Power control register 2
   type PWR_CR2_Register is record
      --  Programmable voltage detector enable Note: This bit is
      --  write-protected when the PVDL bit is set in the SYSCFG_CFGR2
      --  register. The protection can be reset only by a system reset.
      PVDE          : PWR_CR2_PVDE_Field := Interfaces.STM32.PWR.B_0x0;
      --  Programmable voltage detector level selection. These bits select the
      --  PVD falling threshold: Note: These bits are write-protected when the
      --  PVDL bit is set in the SYSCFG_CFGR2 register. The protection can be
      --  reset only by a system reset.
      PVDLS         : PWR_CR2_PVDLS_Field := Interfaces.STM32.PWR.B_0x0;
      --  unspecified
      Reserved_4_5  : Interfaces.STM32.UInt2 := 16#0#;
      --  Peripheral voltage monitoring 3 enable: V<sub>DDA</sub> vs. ADC/COMP
      --  min voltage 1.62V
      PVMEN1        : PWR_CR2_PVMEN1_Field := Interfaces.STM32.PWR.B_0x0;
      --  Peripheral voltage monitoring 4 enable: V<sub>DDA</sub> vs. DAC 1MSPS
      --  /DAC 15MSPS min voltage.
      PVMEN2        : PWR_CR2_PVMEN2_Field := Interfaces.STM32.PWR.B_0x0;
      --  unspecified
      Reserved_8_31 : Interfaces.STM32.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_CR2_Register use record
      PVDE          at 0 range 0 .. 0;
      PVDLS         at 0 range 1 .. 3;
      Reserved_4_5  at 0 range 4 .. 5;
      PVMEN1        at 0 range 6 .. 6;
      PVMEN2        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  PWR_CR3_EWUP array element
   subtype PWR_CR3_EWUP_Element is Interfaces.STM32.Bit;

   --  PWR_CR3_EWUP array
   type PWR_CR3_EWUP_Field_Array is array (1 .. 5) of PWR_CR3_EWUP_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for PWR_CR3_EWUP
   type PWR_CR3_EWUP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EWUP as a value
            Val : Interfaces.STM32.UInt5;
         when True =>
            --  EWUP as an array
            Arr : PWR_CR3_EWUP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for PWR_CR3_EWUP_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  SRAM2 retention in Standby mode
   type PWR_CR3_RRS_Field is
     (--  SRAM2 is powered off in Standby mode (SRAM2 content is lost).
      B_0x0,
      --  SRAM2 is powered by the low-power regulator in Standby mode (SRAM2 content
--  is kept).
      B_0x1)
     with Size => 1;
   for PWR_CR3_RRS_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   subtype PWR_CR3_APC_Field is Interfaces.STM32.Bit;

   --  UCPD1_STDBY USB Type-C and Power Delivery standby mode.
   type PWR_CR3_UCPD1_STDBY_Field is
     (--  Write 0 immediately after standby exit when using UCPD1, (and before
--  writing any UCPD1 registers).
      B_0x0,
      --  Write 1 just before entering standby when using UCPD1.
      B_0x1)
     with Size => 1;
   for PWR_CR3_UCPD1_STDBY_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USB Type-C and Power Delivery Dead Battery disable. After exiting reset,
   --  the USB Type-C dead battery behavior is enabled, which may have a
   --  pull-down effect on CC1 and CC2 pins. It is recommended to disable it in
   --  all cases, either to stop this pull-down or to hand over control to the
   --  UCPD1 (which should therefore be initialized before doing the disable).
   type PWR_CR3_UCPD1_DBDIS_Field is
     (--  Enable USB Type-C dead battery pull-down behavior on UCPD1_CC1 and
--  UCPD1_CC2 pins.
      B_0x0,
      --  Disable USB Type-C dead battery pull-down behavior on UCPD1_CC1 and
--  UCPD1_CC2 pins.
      B_0x1)
     with Size => 1;
   for PWR_CR3_UCPD1_DBDIS_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Enable internal wakeup line
   type PWR_CR3_EIWUL_Field is
     (--  Internal wakeup line disable.
      B_0x0,
      --  Internal wakeup line enable.
      B_0x1)
     with Size => 1;
   for PWR_CR3_EIWUL_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Power control register 3
   type PWR_CR3_Register is record
      --  Enable Wakeup pin WKUP1 When this bit is set, the external wakeup pin
      --  WKUP1 is enabled and triggers a wakeup from Standby or Shutdown event
      --  when a rising or a falling edge occurs. The active edge is configured
      --  via the WP1 bit in the PWR_CR4 register.
      EWUP           : PWR_CR3_EWUP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_7   : Interfaces.STM32.UInt3 := 16#0#;
      --  SRAM2 retention in Standby mode
      RRS            : PWR_CR3_RRS_Field := Interfaces.STM32.PWR.B_0x0;
      --  unspecified
      Reserved_9_9   : Interfaces.STM32.Bit := 16#0#;
      --  Apply pull-up and pull-down configuration When this bit is set, the
      --  I/O pull-up and pull-down configurations defined in the PWR_PUCRx and
      --  PWR_PDCRx registers are applied. When this bit is cleared, the
      --  PWR_PUCRx and PWR_PDCRx registers are not applied to the I/Os.
      APC            : PWR_CR3_APC_Field := 16#0#;
      --  unspecified
      Reserved_11_12 : Interfaces.STM32.UInt2 := 16#0#;
      --  UCPD1_STDBY USB Type-C and Power Delivery standby mode.
      UCPD1_STDBY    : PWR_CR3_UCPD1_STDBY_Field :=
                        Interfaces.STM32.PWR.B_0x0;
      --  USB Type-C and Power Delivery Dead Battery disable. After exiting
      --  reset, the USB Type-C dead battery behavior is enabled, which may
      --  have a pull-down effect on CC1 and CC2 pins. It is recommended to
      --  disable it in all cases, either to stop this pull-down or to hand
      --  over control to the UCPD1 (which should therefore be initialized
      --  before doing the disable).
      UCPD1_DBDIS    : PWR_CR3_UCPD1_DBDIS_Field :=
                        Interfaces.STM32.PWR.B_0x0;
      --  Enable internal wakeup line
      EIWUL          : PWR_CR3_EIWUL_Field := Interfaces.STM32.PWR.B_0x1;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_CR3_Register use record
      EWUP           at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      RRS            at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      APC            at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      UCPD1_STDBY    at 0 range 13 .. 13;
      UCPD1_DBDIS    at 0 range 14 .. 14;
      EIWUL          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Wakeup pin WKUP1 polarity This bit defines the polarity used for an
   --  event detection on external wake-up pin, WKUP1
   type PWR_CR4_WP1_Field is
     (--  Detection on high level (rising edge)
      B_0x0,
      --  Detection on low level (falling edge)
      B_0x1)
     with Size => 1;
   for PWR_CR4_WP1_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  PWR_CR4_WP array
   type PWR_CR4_WP_Field_Array is array (1 .. 5) of PWR_CR4_WP1_Field
     with Component_Size => 1, Size => 5;

   --  Type definition for PWR_CR4_WP
   type PWR_CR4_WP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WP as a value
            Val : Interfaces.STM32.UInt5;
         when True =>
            --  WP as an array
            Arr : PWR_CR4_WP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for PWR_CR4_WP_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  V<sub>BAT</sub> battery charging enable
   type PWR_CR4_VBE_Field is
     (--  V<sub>BAT</sub> battery charging disable
      B_0x0,
      --  V<sub>BAT</sub> battery charging enable
      B_0x1)
     with Size => 1;
   for PWR_CR4_VBE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  V<sub>BAT</sub> battery charging resistor selection
   type PWR_CR4_VBRS_Field is
     (--  Charge V<sub>BAT</sub> through a 5 kOhms resistor
      B_0x0,
      --  Charge V<sub>BAT</sub> through a 1.5 kOhms resistor
      B_0x1)
     with Size => 1;
   for PWR_CR4_VBRS_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Power control register 4
   type PWR_CR4_Register is record
      --  Wakeup pin WKUP1 polarity This bit defines the polarity used for an
      --  event detection on external wake-up pin, WKUP1
      WP             : PWR_CR4_WP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_7   : Interfaces.STM32.UInt3 := 16#0#;
      --  V<sub>BAT</sub> battery charging enable
      VBE            : PWR_CR4_VBE_Field := Interfaces.STM32.PWR.B_0x0;
      --  V<sub>BAT</sub> battery charging resistor selection
      VBRS           : PWR_CR4_VBRS_Field := Interfaces.STM32.PWR.B_0x0;
      --  unspecified
      Reserved_10_31 : Interfaces.STM32.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_CR4_Register use record
      WP             at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      VBE            at 0 range 8 .. 8;
      VBRS           at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  PWR_SR1_WUF array element
   subtype PWR_SR1_WUF_Element is Interfaces.STM32.Bit;

   --  PWR_SR1_WUF array
   type PWR_SR1_WUF_Field_Array is array (1 .. 5) of PWR_SR1_WUF_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for PWR_SR1_WUF
   type PWR_SR1_WUF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WUF as a value
            Val : Interfaces.STM32.UInt5;
         when True =>
            --  WUF as an array
            Arr : PWR_SR1_WUF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for PWR_SR1_WUF_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  Standby flag This bit is set by hardware when the device enters the
   --  Standby mode and is cleared by setting the CSBF bit in the PWR_SCR
   --  register, or by a power-on reset. It is not cleared by the system reset.
   type PWR_SR1_SBF_Field is
     (--  The device did not enter the Standby mode
      B_0x0,
      --  The device entered the Standby mode
      B_0x1)
     with Size => 1;
   for PWR_SR1_SBF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   subtype PWR_SR1_WUFI_Field is Interfaces.STM32.Bit;

   --  Power status register 1
   type PWR_SR1_Register is record
      --  Read-only. Wakeup flag 1 This bit is set when a wakeup event is
      --  detected on wakeup pin, WKUP1. It is cleared by writing 1 in the
      --  CWUF1 bit of the PWR_SCR register.
      WUF            : PWR_SR1_WUF_Field;
      --  unspecified
      Reserved_5_7   : Interfaces.STM32.UInt3;
      --  Read-only. Standby flag This bit is set by hardware when the device
      --  enters the Standby mode and is cleared by setting the CSBF bit in the
      --  PWR_SCR register, or by a power-on reset. It is not cleared by the
      --  system reset.
      SBF            : PWR_SR1_SBF_Field;
      --  unspecified
      Reserved_9_14  : Interfaces.STM32.UInt6;
      --  Read-only. Wakeup flag internal This bit is set when a wakeup is
      --  detected on the internal wakeup line. It is cleared when all internal
      --  wakeup sources are cleared.
      WUFI           : PWR_SR1_WUFI_Field;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_SR1_Register use record
      WUF            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      SBF            at 0 range 8 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      WUFI           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Low-power regulator started This bit provides the information whether
   --  the low-power regulator is ready after a power-on reset or a
   --  Standby/Shutdown. If the Standby mode is entered while REGLPS bit is
   --  still cleared, the wakeup from Standby mode time may be increased.
   type PWR_SR2_REGLPS_Field is
     (--  The low-power regulator is not ready
      B_0x0,
      --  The low-power regulator is ready
      B_0x1)
     with Size => 1;
   for PWR_SR2_REGLPS_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Low-power regulator flag This bit is set by hardware when the MCU is in
   --  Low-power run mode. When the MCU exits the Low-power run mode, this bit
   --  remains at 1 until the regulator is ready in main mode. A polling on
   --  this bit must be done before increasing the product frequency. This bit
   --  is cleared by hardware when the regulator is ready.
   type PWR_SR2_REGLPF_Field is
     (--  The regulator is ready in main mode (MR)
      B_0x0,
      --  The regulator is in low-power mode (LPR)
      B_0x1)
     with Size => 1;
   for PWR_SR2_REGLPF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Voltage scaling flag A delay is required for the internal regulator to
   --  be ready after the voltage scaling has been changed. VOSF indicates that
   --  the regulator reached the voltage level defined with VOS bits of the
   --  PWR_CR1 register.
   type PWR_SR2_VOSF_Field is
     (--  The regulator is ready in the selected voltage range
      B_0x0,
      --  The regulator output voltage is changing to the required voltage level
      B_0x1)
     with Size => 1;
   for PWR_SR2_VOSF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Programmable voltage detector output
   type PWR_SR2_PVDO_Field is
     (--  V<sub>DD</sub> is above the selected PVD threshold
      B_0x0,
      --  V<sub>DD</sub> is below the selected PVD threshold
      B_0x1)
     with Size => 1;
   for PWR_SR2_PVDO_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Peripheral voltage monitoring output: V<sub>DDA</sub> vs. 1.62 V Note:
   --  PVMO1 is cleared when PVM1 is disabled (PVME = 0). After enabling PVM1,
   --  the PVM1 output is valid after the PVM1 wakeup time.
   type PWR_SR2_PVMO1_Field is
     (--  V<sub>DDA</sub> voltage is above PVM1 threshold (around 1.62 V).
      B_0x0,
      --  V<sub>DDA</sub> voltage is below PVM1 threshold (around 1.62 V).
      B_0x1)
     with Size => 1;
   for PWR_SR2_PVMO1_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Peripheral voltage monitoring output: V<sub>DDA</sub> vs. 1.8 V Note:
   --  PVMO2 is cleared when PVM2 is disabled (PVME = 0). After enabling PVM2,
   --  the PVM2 output is valid after the PVM2 wakeup time.
   type PWR_SR2_PVMO2_Field is
     (--  V<sub>DDA</sub> voltage is above PVM2 threshold (around 1.8 V).
      B_0x0,
      --  V<sub>DDA</sub> voltage is below PVM2 threshold (around 1.8 V).
      B_0x1)
     with Size => 1;
   for PWR_SR2_PVMO2_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Power status register 2
   type PWR_SR2_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.STM32.Byte;
      --  Read-only. Low-power regulator started This bit provides the
      --  information whether the low-power regulator is ready after a power-on
      --  reset or a Standby/Shutdown. If the Standby mode is entered while
      --  REGLPS bit is still cleared, the wakeup from Standby mode time may be
      --  increased.
      REGLPS         : PWR_SR2_REGLPS_Field;
      --  Read-only. Low-power regulator flag This bit is set by hardware when
      --  the MCU is in Low-power run mode. When the MCU exits the Low-power
      --  run mode, this bit remains at 1 until the regulator is ready in main
      --  mode. A polling on this bit must be done before increasing the
      --  product frequency. This bit is cleared by hardware when the regulator
      --  is ready.
      REGLPF         : PWR_SR2_REGLPF_Field;
      --  Read-only. Voltage scaling flag A delay is required for the internal
      --  regulator to be ready after the voltage scaling has been changed.
      --  VOSF indicates that the regulator reached the voltage level defined
      --  with VOS bits of the PWR_CR1 register.
      VOSF           : PWR_SR2_VOSF_Field;
      --  Read-only. Programmable voltage detector output
      PVDO           : PWR_SR2_PVDO_Field;
      --  unspecified
      Reserved_12_13 : Interfaces.STM32.UInt2;
      --  Read-only. Peripheral voltage monitoring output: V<sub>DDA</sub> vs.
      --  1.62 V Note: PVMO1 is cleared when PVM1 is disabled (PVME = 0). After
      --  enabling PVM1, the PVM1 output is valid after the PVM1 wakeup time.
      PVMO1          : PWR_SR2_PVMO1_Field;
      --  Read-only. Peripheral voltage monitoring output: V<sub>DDA</sub> vs.
      --  1.8 V Note: PVMO2 is cleared when PVM2 is disabled (PVME = 0). After
      --  enabling PVM2, the PVM2 output is valid after the PVM2 wakeup time.
      PVMO2          : PWR_SR2_PVMO2_Field;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_SR2_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      REGLPS         at 0 range 8 .. 8;
      REGLPF         at 0 range 9 .. 9;
      VOSF           at 0 range 10 .. 10;
      PVDO           at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      PVMO1          at 0 range 14 .. 14;
      PVMO2          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_SCR_CWUF array element
   subtype PWR_SCR_CWUF_Element is Interfaces.STM32.Bit;

   --  PWR_SCR_CWUF array
   type PWR_SCR_CWUF_Field_Array is array (1 .. 5) of PWR_SCR_CWUF_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for PWR_SCR_CWUF
   type PWR_SCR_CWUF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CWUF as a value
            Val : Interfaces.STM32.UInt5;
         when True =>
            --  CWUF as an array
            Arr : PWR_SCR_CWUF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for PWR_SCR_CWUF_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   subtype PWR_SCR_CSBF_Field is Interfaces.STM32.Bit;

   --  Power status clear register
   type PWR_SCR_Register is record
      --  Write-only. Clear wakeup flag 1 Setting this bit clears the WUF1 flag
      --  in the PWR_SR1 register.
      CWUF          : PWR_SCR_CWUF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_7  : Interfaces.STM32.UInt3 := 16#0#;
      --  Write-only. Clear standby flag Setting this bit clears the SBF flag
      --  in the PWR_SR1 register.
      CSBF          : PWR_SCR_CSBF_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_SCR_Register use record
      CWUF          at 0 range 0 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      CSBF          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  PWR_PUCRA_PU array element
   subtype PWR_PUCRA_PU_Element is Interfaces.STM32.Bit;

   --  PWR_PUCRA_PU array
   type PWR_PUCRA_PU_Field_Array is array (0 .. 13) of PWR_PUCRA_PU_Element
     with Component_Size => 1, Size => 14;

   --  Type definition for PWR_PUCRA_PU
   type PWR_PUCRA_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.STM32.UInt14;
         when True =>
            --  PU as an array
            Arr : PWR_PUCRA_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 14;

   for PWR_PUCRA_PU_Field use record
      Val at 0 range 0 .. 13;
      Arr at 0 range 0 .. 13;
   end record;

   subtype PWR_PUCRA_PU15_Field is Interfaces.STM32.Bit;

   --  Power Port A pull-up control register
   type PWR_PUCRA_Register is record
      --  Port A pull-up bit y (y=0..13) When set, this bit activates the
      --  pull-up on PA[y] when APC bit is set in PWR_CR3 register. The pull-up
      --  is not activated if the corresponding PDy bit is also set.
      PU             : PWR_PUCRA_PU_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_14 : Interfaces.STM32.Bit := 16#0#;
      --  Port A pull-up bit 15 When set, this bit activates the pull-up on
      --  PA[15] when APC bit is set in PWR_CR3 register. The pull-up is not
      --  activated if the corresponding PD15 bit is also set.
      PU15           : PWR_PUCRA_PU15_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PUCRA_Register use record
      PU             at 0 range 0 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      PU15           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PDCRA_PD array element
   subtype PWR_PDCRA_PD_Element is Interfaces.STM32.Bit;

   --  PWR_PDCRA_PD array
   type PWR_PDCRA_PD_Field_Array is array (0 .. 12) of PWR_PDCRA_PD_Element
     with Component_Size => 1, Size => 13;

   --  Type definition for PWR_PDCRA_PD
   type PWR_PDCRA_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.STM32.UInt13;
         when True =>
            --  PD as an array
            Arr : PWR_PDCRA_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 13;

   for PWR_PDCRA_PD_Field use record
      Val at 0 range 0 .. 12;
      Arr at 0 range 0 .. 12;
   end record;

   subtype PWR_PDCRA_PD14_Field is Interfaces.STM32.Bit;

   --  Power Port A pull-down control register
   type PWR_PDCRA_Register is record
      --  Port A pull-down bit y (y=0..12) When set, this bit activates the
      --  pull-down on PA[y] when APC bit is set in PWR_CR3 register.
      PD             : PWR_PDCRA_PD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  Port A pull-down bit 14 When set, this bit activates the pull-down on
      --  PA[14] when APC bit is set in PWR_CR3 register.
      PD14           : PWR_PDCRA_PD14_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.STM32.UInt17 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PDCRA_Register use record
      PD             at 0 range 0 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      PD14           at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  PWR_PUCRB_PU array element
   subtype PWR_PUCRB_PU_Element is Interfaces.STM32.Bit;

   --  PWR_PUCRB_PU array
   type PWR_PUCRB_PU_Field_Array is array (0 .. 15) of PWR_PUCRB_PU_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PWR_PUCRB_PU
   type PWR_PUCRB_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.STM32.UInt16;
         when True =>
            --  PU as an array
            Arr : PWR_PUCRB_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PWR_PUCRB_PU_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Power Port B pull-up control register
   type PWR_PUCRB_Register is record
      --  Port B pull-up bit y (y=0..15) When set, this bit activates the
      --  pull-up on PB[y] when APC bit is set in PWR_CR3 register. The pull-up
      --  is not activated if the corresponding PDy bit is also set.
      PU             : PWR_PUCRB_PU_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PUCRB_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PDCRB_PD array element
   subtype PWR_PDCRB_PD_Element is Interfaces.STM32.Bit;

   --  PWR_PDCRB_PD array
   type PWR_PDCRB_PD_Field_Array is array (0 .. 3) of PWR_PDCRB_PD_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for PWR_PDCRB_PD
   type PWR_PDCRB_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.STM32.UInt4;
         when True =>
            --  PD as an array
            Arr : PWR_PDCRB_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for PWR_PDCRB_PD_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  PWR_PDCRB_PD array
   type PWR_PDCRB_PD_Field_Array_1 is array (5 .. 15) of PWR_PDCRB_PD_Element
     with Component_Size => 1, Size => 11;

   --  Type definition for PWR_PDCRB_PD
   type PWR_PDCRB_PD_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.STM32.UInt11;
         when True =>
            --  PD as an array
            Arr : PWR_PDCRB_PD_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 11;

   for PWR_PDCRB_PD_Field_1 use record
      Val at 0 range 0 .. 10;
      Arr at 0 range 0 .. 10;
   end record;

   --  Power Port B pull-down control register
   type PWR_PDCRB_Register is record
      --  Port B pull-down bit y (y=0..3) When set, this bit activates the
      --  pull-down on PB[y] when APC bit is set in PWR_CR3 register.
      PD             : PWR_PDCRB_PD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_4   : Interfaces.STM32.Bit := 16#0#;
      --  Port B pull-down bit y (y=5..15) When set, this bit activates the
      --  pull-down on PB[y] when APC bit is set in PWR_CR3 register.
      PD_1           : PWR_PDCRB_PD_Field_1 :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PDCRB_Register use record
      PD             at 0 range 0 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      PD_1           at 0 range 5 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PUCRC_PU array element
   subtype PWR_PUCRC_PU_Element is Interfaces.STM32.Bit;

   --  PWR_PUCRC_PU array
   type PWR_PUCRC_PU_Field_Array is array (0 .. 15) of PWR_PUCRC_PU_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PWR_PUCRC_PU
   type PWR_PUCRC_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.STM32.UInt16;
         when True =>
            --  PU as an array
            Arr : PWR_PUCRC_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PWR_PUCRC_PU_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Power Port C pull-up control register
   type PWR_PUCRC_Register is record
      --  Port C pull-up bit y (y=0..15) When set, this bit activates the
      --  pull-up on PC[y] when APC bit is set in PWR_CR3 register. The pull-up
      --  is not activated if the corresponding PDy bit is also set.
      PU             : PWR_PUCRC_PU_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PUCRC_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PDCRC_PD array element
   subtype PWR_PDCRC_PD_Element is Interfaces.STM32.Bit;

   --  PWR_PDCRC_PD array
   type PWR_PDCRC_PD_Field_Array is array (0 .. 15) of PWR_PDCRC_PD_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PWR_PDCRC_PD
   type PWR_PDCRC_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.STM32.UInt16;
         when True =>
            --  PD as an array
            Arr : PWR_PDCRC_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PWR_PDCRC_PD_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Power Port C pull-down control register
   type PWR_PDCRC_Register is record
      --  Port C pull-down bit y (y=0..15) When set, this bit activates the
      --  pull-down on PC[y] when APC bit is set in PWR_CR3 register.
      PD             : PWR_PDCRC_PD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PDCRC_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PUCRD_PU array element
   subtype PWR_PUCRD_PU_Element is Interfaces.STM32.Bit;

   --  PWR_PUCRD_PU array
   type PWR_PUCRD_PU_Field_Array is array (0 .. 15) of PWR_PUCRD_PU_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PWR_PUCRD_PU
   type PWR_PUCRD_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.STM32.UInt16;
         when True =>
            --  PU as an array
            Arr : PWR_PUCRD_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PWR_PUCRD_PU_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Power Port D pull-up control register
   type PWR_PUCRD_Register is record
      --  Port D pull-up bit y (y=0..15) When set, this bit activates the
      --  pull-up on PD[y] when APC bit is set in PWR_CR3 register. The pull-up
      --  is not activated if the corresponding PDy bit is also set.
      PU             : PWR_PUCRD_PU_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PUCRD_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PDCRD_PD array element
   subtype PWR_PDCRD_PD_Element is Interfaces.STM32.Bit;

   --  PWR_PDCRD_PD array
   type PWR_PDCRD_PD_Field_Array is array (0 .. 15) of PWR_PDCRD_PD_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PWR_PDCRD_PD
   type PWR_PDCRD_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.STM32.UInt16;
         when True =>
            --  PD as an array
            Arr : PWR_PDCRD_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PWR_PDCRD_PD_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Power Port D pull-down control register
   type PWR_PDCRD_Register is record
      --  Port D pull-down bit y (y=0..15) When set, this bit activates the
      --  pull-down on PD[y] when APC bit is set in PWR_CR3 register.
      PD             : PWR_PDCRD_PD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PDCRD_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PUCRE_PU array element
   subtype PWR_PUCRE_PU_Element is Interfaces.STM32.Bit;

   --  PWR_PUCRE_PU array
   type PWR_PUCRE_PU_Field_Array is array (0 .. 15) of PWR_PUCRE_PU_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PWR_PUCRE_PU
   type PWR_PUCRE_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.STM32.UInt16;
         when True =>
            --  PU as an array
            Arr : PWR_PUCRE_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PWR_PUCRE_PU_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Power Port E pull-up control register
   type PWR_PUCRE_Register is record
      --  Port E pull-up bit y (y=0..15) When set, this bit activates the
      --  pull-up on PE[y] when APC bit is set in PWR_CR3 register. The pull-up
      --  is not activated if the corresponding PDy bit is also set.
      PU             : PWR_PUCRE_PU_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PUCRE_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PDCRE_PD array element
   subtype PWR_PDCRE_PD_Element is Interfaces.STM32.Bit;

   --  PWR_PDCRE_PD array
   type PWR_PDCRE_PD_Field_Array is array (0 .. 15) of PWR_PDCRE_PD_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PWR_PDCRE_PD
   type PWR_PDCRE_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.STM32.UInt16;
         when True =>
            --  PD as an array
            Arr : PWR_PDCRE_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PWR_PDCRE_PD_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Power Port E pull-down control register
   type PWR_PDCRE_Register is record
      --  Port E pull-down bit y (y=0..15) When set, this bit activates the
      --  pull-down on PE[y] when APC bit is set in PWR_CR3 register.
      PD             : PWR_PDCRE_PD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PDCRE_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PUCRF_PU array element
   subtype PWR_PUCRF_PU_Element is Interfaces.STM32.Bit;

   --  PWR_PUCRF_PU array
   type PWR_PUCRF_PU_Field_Array is array (0 .. 15) of PWR_PUCRF_PU_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PWR_PUCRF_PU
   type PWR_PUCRF_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.STM32.UInt16;
         when True =>
            --  PU as an array
            Arr : PWR_PUCRF_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PWR_PUCRF_PU_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Power Port F pull-up control register
   type PWR_PUCRF_Register is record
      --  Port F pull-up bit y (y=0..15) When set, this bit activates the
      --  pull-up on PF[y] when APC bit is set in PWR_CR3 register. The pull-up
      --  is not activated if the corresponding PDy bit is also set.
      PU             : PWR_PUCRF_PU_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PUCRF_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PDCRF_PD array element
   subtype PWR_PDCRF_PD_Element is Interfaces.STM32.Bit;

   --  PWR_PDCRF_PD array
   type PWR_PDCRF_PD_Field_Array is array (0 .. 15) of PWR_PDCRF_PD_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PWR_PDCRF_PD
   type PWR_PDCRF_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.STM32.UInt16;
         when True =>
            --  PD as an array
            Arr : PWR_PDCRF_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PWR_PDCRF_PD_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Power Port F pull-down control register
   type PWR_PDCRF_Register is record
      --  Port F pull-down bit y (y=0..15) When set, this bit activates the
      --  pull-down on PF[y] when APC bit is set in PWR_CR3 register.
      PD             : PWR_PDCRF_PD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PDCRF_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PWR_PUCRG_PU array element
   subtype PWR_PUCRG_PU_Element is Interfaces.STM32.Bit;

   --  PWR_PUCRG_PU array
   type PWR_PUCRG_PU_Field_Array is array (0 .. 10) of PWR_PUCRG_PU_Element
     with Component_Size => 1, Size => 11;

   --  Type definition for PWR_PUCRG_PU
   type PWR_PUCRG_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.STM32.UInt11;
         when True =>
            --  PU as an array
            Arr : PWR_PUCRG_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 11;

   for PWR_PUCRG_PU_Field use record
      Val at 0 range 0 .. 10;
      Arr at 0 range 0 .. 10;
   end record;

   --  Power Port G pull-up control register
   type PWR_PUCRG_Register is record
      --  Port G pull-up bit y (y=0..10) When set, this bit activates the
      --  pull-up on PG[y] when APC bit is set in PWR_CR3 register. The pull-up
      --  is not activated if the corresponding PDy bit is also set.
      PU             : PWR_PUCRG_PU_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_11_31 : Interfaces.STM32.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PUCRG_Register use record
      PU             at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  PWR_PDCRG_PD array element
   subtype PWR_PDCRG_PD_Element is Interfaces.STM32.Bit;

   --  PWR_PDCRG_PD array
   type PWR_PDCRG_PD_Field_Array is array (0 .. 10) of PWR_PDCRG_PD_Element
     with Component_Size => 1, Size => 11;

   --  Type definition for PWR_PDCRG_PD
   type PWR_PDCRG_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.STM32.UInt11;
         when True =>
            --  PD as an array
            Arr : PWR_PDCRG_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 11;

   for PWR_PDCRG_PD_Field use record
      Val at 0 range 0 .. 10;
      Arr at 0 range 0 .. 10;
   end record;

   --  Power Port G pull-down control register
   type PWR_PDCRG_Register is record
      --  Port G pull-down bit y (y=0..10) When set, this bit activates the
      --  pull-down on PG[y] when APC bit is set in PWR_CR3 register.
      PD             : PWR_PDCRG_PD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_11_31 : Interfaces.STM32.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_PDCRG_Register use record
      PD             at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Main regular range 1 mode This bit is only valid for the main regulator
   --  in range 1 and has no effect on range 2. It is recommended to reset this
   --  bit when the system frequency is greater than 150 MHz. Refer to
   type PWR_CR5_R1MODE_Field is
     (--  Main regulator in range 1 boost mode.
      B_0x0,
      --  Main regulator in range 1 normal mode.
      B_0x1)
     with Size => 1;
   for PWR_CR5_R1MODE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Power control register
   type PWR_CR5_Register is record
      --  unspecified
      Reserved_0_7  : Interfaces.STM32.Byte := 16#0#;
      --  Main regular range 1 mode This bit is only valid for the main
      --  regulator in range 1 and has no effect on range 2. It is recommended
      --  to reset this bit when the system frequency is greater than 150 MHz.
      --  Refer to
      R1MODE        : PWR_CR5_R1MODE_Field := Interfaces.STM32.PWR.B_0x1;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWR_CR5_Register use record
      Reserved_0_7  at 0 range 0 .. 7;
      R1MODE        at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Power control
   type PWR_Peripheral is record
      --  Power control register 1
      PWR_CR1   : aliased PWR_CR1_Register;
      pragma Volatile_Full_Access (PWR_CR1);
      --  Power control register 2
      PWR_CR2   : aliased PWR_CR2_Register;
      pragma Volatile_Full_Access (PWR_CR2);
      --  Power control register 3
      PWR_CR3   : aliased PWR_CR3_Register;
      pragma Volatile_Full_Access (PWR_CR3);
      --  Power control register 4
      PWR_CR4   : aliased PWR_CR4_Register;
      pragma Volatile_Full_Access (PWR_CR4);
      --  Power status register 1
      PWR_SR1   : aliased PWR_SR1_Register;
      pragma Volatile_Full_Access (PWR_SR1);
      --  Power status register 2
      PWR_SR2   : aliased PWR_SR2_Register;
      pragma Volatile_Full_Access (PWR_SR2);
      --  Power status clear register
      PWR_SCR   : aliased PWR_SCR_Register;
      pragma Volatile_Full_Access (PWR_SCR);
      --  Power Port A pull-up control register
      PWR_PUCRA : aliased PWR_PUCRA_Register;
      pragma Volatile_Full_Access (PWR_PUCRA);
      --  Power Port A pull-down control register
      PWR_PDCRA : aliased PWR_PDCRA_Register;
      pragma Volatile_Full_Access (PWR_PDCRA);
      --  Power Port B pull-up control register
      PWR_PUCRB : aliased PWR_PUCRB_Register;
      pragma Volatile_Full_Access (PWR_PUCRB);
      --  Power Port B pull-down control register
      PWR_PDCRB : aliased PWR_PDCRB_Register;
      pragma Volatile_Full_Access (PWR_PDCRB);
      --  Power Port C pull-up control register
      PWR_PUCRC : aliased PWR_PUCRC_Register;
      pragma Volatile_Full_Access (PWR_PUCRC);
      --  Power Port C pull-down control register
      PWR_PDCRC : aliased PWR_PDCRC_Register;
      pragma Volatile_Full_Access (PWR_PDCRC);
      --  Power Port D pull-up control register
      PWR_PUCRD : aliased PWR_PUCRD_Register;
      pragma Volatile_Full_Access (PWR_PUCRD);
      --  Power Port D pull-down control register
      PWR_PDCRD : aliased PWR_PDCRD_Register;
      pragma Volatile_Full_Access (PWR_PDCRD);
      --  Power Port E pull-up control register
      PWR_PUCRE : aliased PWR_PUCRE_Register;
      pragma Volatile_Full_Access (PWR_PUCRE);
      --  Power Port E pull-down control register
      PWR_PDCRE : aliased PWR_PDCRE_Register;
      pragma Volatile_Full_Access (PWR_PDCRE);
      --  Power Port F pull-up control register
      PWR_PUCRF : aliased PWR_PUCRF_Register;
      pragma Volatile_Full_Access (PWR_PUCRF);
      --  Power Port F pull-down control register
      PWR_PDCRF : aliased PWR_PDCRF_Register;
      pragma Volatile_Full_Access (PWR_PDCRF);
      --  Power Port G pull-up control register
      PWR_PUCRG : aliased PWR_PUCRG_Register;
      pragma Volatile_Full_Access (PWR_PUCRG);
      --  Power Port G pull-down control register
      PWR_PDCRG : aliased PWR_PDCRG_Register;
      pragma Volatile_Full_Access (PWR_PDCRG);
      --  Power control register
      PWR_CR5   : aliased PWR_CR5_Register;
      pragma Volatile_Full_Access (PWR_CR5);
   end record
     with Volatile;

   for PWR_Peripheral use record
      PWR_CR1   at 16#0# range 0 .. 31;
      PWR_CR2   at 16#4# range 0 .. 31;
      PWR_CR3   at 16#8# range 0 .. 31;
      PWR_CR4   at 16#C# range 0 .. 31;
      PWR_SR1   at 16#10# range 0 .. 31;
      PWR_SR2   at 16#14# range 0 .. 31;
      PWR_SCR   at 16#18# range 0 .. 31;
      PWR_PUCRA at 16#20# range 0 .. 31;
      PWR_PDCRA at 16#24# range 0 .. 31;
      PWR_PUCRB at 16#28# range 0 .. 31;
      PWR_PDCRB at 16#2C# range 0 .. 31;
      PWR_PUCRC at 16#30# range 0 .. 31;
      PWR_PDCRC at 16#34# range 0 .. 31;
      PWR_PUCRD at 16#38# range 0 .. 31;
      PWR_PDCRD at 16#3C# range 0 .. 31;
      PWR_PUCRE at 16#40# range 0 .. 31;
      PWR_PDCRE at 16#44# range 0 .. 31;
      PWR_PUCRF at 16#48# range 0 .. 31;
      PWR_PDCRF at 16#4C# range 0 .. 31;
      PWR_PUCRG at 16#50# range 0 .. 31;
      PWR_PDCRG at 16#54# range 0 .. 31;
      PWR_CR5   at 16#80# range 0 .. 31;
   end record;

   --  Power control
   PWR_Periph : aliased PWR_Peripheral
     with Import, Address => PWR_Base;

end Interfaces.STM32.PWR;
