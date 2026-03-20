--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G484xx.svd


with System;

package Interfaces.STM32.RCC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  HSI16 clock enable Set and cleared by software. Cleared by hardware to
   --  stop the HSI16 oscillator when entering Stop, Standby or Shutdown mode.
   --  Set by hardware to force the HSI16 oscillator ON when STOPWUCK=1 or
   --  HSIASFS = 1 when leaving Stop modes, or in case of failure of the HSE
   --  crystal oscillator. This bit is set by hardware if the HSI16 is used
   --  directly or indirectly as system clock.
   type RCC_CR_HSION_Field is
     (--  HSI16 oscillator OFF
      B_0x0,
      --  HSI16 oscillator ON
      B_0x1)
     with Size => 1;
   for RCC_CR_HSION_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSI16 always enable for peripheral kernels. Set and cleared by software
   --  to force HSI16 ON even in Stop modes. The HSI16 can only feed USARTs and
   --  I<sup>2</sup>Cs peripherals configured with HSI16 as kernel clock.
   --  Keeping the HSI16 ON in Stop mode allows to avoid slowing down the
   --  communication speed because of the HSI16 startup time. This bit has no
   --  effect on HSION value.
   type RCC_CR_HSIKERON_Field is
     (--  No effect on HSI16 oscillator.
      B_0x0,
      --  HSI16 oscillator is forced ON even in Stop mode.
      B_0x1)
     with Size => 1;
   for RCC_CR_HSIKERON_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSI16 clock ready flag Set by hardware to indicate that HSI16 oscillator
   --  is stable. This bit is set only when HSI16 is enabled by software by
   --  setting HSION. Note: Once the HSION bit is cleared, HSIRDY goes low
   --  after 6 HSI16 clock cycles.
   type RCC_CR_HSIRDY_Field is
     (--  HSI16 oscillator not ready
      B_0x0,
      --  HSI16 oscillator ready
      B_0x1)
     with Size => 1;
   for RCC_CR_HSIRDY_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSE clock enable Set and cleared by software. Cleared by hardware to
   --  stop the HSE oscillator when entering Stop, Standby or Shutdown mode.
   --  This bit cannot be reset if the HSE oscillator is used directly or
   --  indirectly as the system clock.
   type RCC_CR_HSEON_Field is
     (--  HSE oscillator OFF
      B_0x0,
      --  HSE oscillator ON
      B_0x1)
     with Size => 1;
   for RCC_CR_HSEON_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSE clock ready flag Set by hardware to indicate that the HSE oscillator
   --  is stable. Note: Once the HSEON bit is cleared, HSERDY goes low after 6
   --  HSE clock cycles.
   type RCC_CR_HSERDY_Field is
     (--  HSE oscillator not ready
      B_0x0,
      --  HSE oscillator ready
      B_0x1)
     with Size => 1;
   for RCC_CR_HSERDY_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSE crystal oscillator bypass Set and cleared by software to bypass the
   --  oscillator with an external clock. The external clock must be enabled
   --  with the HSEON bit set, to be used by the device. The HSEBYP bit can be
   --  written only if the HSE oscillator is disabled.
   type RCC_CR_HSEBYP_Field is
     (--  HSE crystal oscillator not bypassed
      B_0x0,
      --  HSE crystal oscillator bypassed with external clock
      B_0x1)
     with Size => 1;
   for RCC_CR_HSEBYP_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Clock security system enable Set by software to enable the clock
   --  security system. When CSSON is set, the clock detector is enabled by
   --  hardware when the HSE oscillator is ready, and disabled by hardware if a
   --  HSE clock failure is detected. This bit is set only and is cleared by
   --  reset.
   type RCC_CR_CSSON_Field is
     (--  Clock security system OFF (clock detector OFF)
      B_0x0,
      --  Clock security system ON (Clock detector ON if the HSE oscillator is
--  stable, OFF if not).
      B_0x1)
     with Size => 1;
   for RCC_CR_CSSON_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Main PLL enable Set and cleared by software to enable the main PLL.
   --  Cleared by hardware when entering Stop, Standby or Shutdown mode. This
   --  bit cannot be reset if the PLL clock is used as the system clock.
   type RCC_CR_PLLON_Field is
     (--  PLL OFF
      B_0x0,
      --  PLL ON
      B_0x1)
     with Size => 1;
   for RCC_CR_PLLON_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Main PLL clock ready flag Set by hardware to indicate that the main PLL
   --  is locked.
   type RCC_CR_PLLRDY_Field is
     (--  PLL unlocked
      B_0x0,
      --  PLL locked
      B_0x1)
     with Size => 1;
   for RCC_CR_PLLRDY_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Clock control register
   type RCC_CR_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.STM32.Byte := 16#63#;
      --  HSI16 clock enable Set and cleared by software. Cleared by hardware
      --  to stop the HSI16 oscillator when entering Stop, Standby or Shutdown
      --  mode. Set by hardware to force the HSI16 oscillator ON when
      --  STOPWUCK=1 or HSIASFS = 1 when leaving Stop modes, or in case of
      --  failure of the HSE crystal oscillator. This bit is set by hardware if
      --  the HSI16 is used directly or indirectly as system clock.
      HSION          : RCC_CR_HSION_Field := Interfaces.STM32.RCC.B_0x0;
      --  HSI16 always enable for peripheral kernels. Set and cleared by
      --  software to force HSI16 ON even in Stop modes. The HSI16 can only
      --  feed USARTs and I<sup>2</sup>Cs peripherals configured with HSI16 as
      --  kernel clock. Keeping the HSI16 ON in Stop mode allows to avoid
      --  slowing down the communication speed because of the HSI16 startup
      --  time. This bit has no effect on HSION value.
      HSIKERON       : RCC_CR_HSIKERON_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. HSI16 clock ready flag Set by hardware to indicate that
      --  HSI16 oscillator is stable. This bit is set only when HSI16 is
      --  enabled by software by setting HSION. Note: Once the HSION bit is
      --  cleared, HSIRDY goes low after 6 HSI16 clock cycles.
      HSIRDY         : RCC_CR_HSIRDY_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_11_15 : Interfaces.STM32.UInt5 := 16#0#;
      --  HSE clock enable Set and cleared by software. Cleared by hardware to
      --  stop the HSE oscillator when entering Stop, Standby or Shutdown mode.
      --  This bit cannot be reset if the HSE oscillator is used directly or
      --  indirectly as the system clock.
      HSEON          : RCC_CR_HSEON_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. HSE clock ready flag Set by hardware to indicate that the
      --  HSE oscillator is stable. Note: Once the HSEON bit is cleared, HSERDY
      --  goes low after 6 HSE clock cycles.
      HSERDY         : RCC_CR_HSERDY_Field := Interfaces.STM32.RCC.B_0x0;
      --  HSE crystal oscillator bypass Set and cleared by software to bypass
      --  the oscillator with an external clock. The external clock must be
      --  enabled with the HSEON bit set, to be used by the device. The HSEBYP
      --  bit can be written only if the HSE oscillator is disabled.
      HSEBYP         : RCC_CR_HSEBYP_Field := Interfaces.STM32.RCC.B_0x0;
      --  Clock security system enable Set by software to enable the clock
      --  security system. When CSSON is set, the clock detector is enabled by
      --  hardware when the HSE oscillator is ready, and disabled by hardware
      --  if a HSE clock failure is detected. This bit is set only and is
      --  cleared by reset.
      CSSON          : RCC_CR_CSSON_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_20_23 : Interfaces.STM32.UInt4 := 16#0#;
      --  Main PLL enable Set and cleared by software to enable the main PLL.
      --  Cleared by hardware when entering Stop, Standby or Shutdown mode.
      --  This bit cannot be reset if the PLL clock is used as the system
      --  clock.
      PLLON          : RCC_CR_PLLON_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. Main PLL clock ready flag Set by hardware to indicate that
      --  the main PLL is locked.
      PLLRDY         : RCC_CR_PLLRDY_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_26_31 : Interfaces.STM32.UInt6 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_CR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      HSION          at 0 range 8 .. 8;
      HSIKERON       at 0 range 9 .. 9;
      HSIRDY         at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      HSEON          at 0 range 16 .. 16;
      HSERDY         at 0 range 17 .. 17;
      HSEBYP         at 0 range 18 .. 18;
      CSSON          at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      PLLON          at 0 range 24 .. 24;
      PLLRDY         at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype RCC_ICSCR_HSICAL_Field is Interfaces.STM32.Byte;
   subtype RCC_ICSCR_HSITRIM_Field is Interfaces.STM32.UInt7;

   --  Internal clock sources calibration register
   type RCC_ICSCR_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.STM32.UInt16 := 16#0#;
      --  Read-only. HSI16 clock calibration These bits are initialized at
      --  startup with the factory-programmed HSI16 calibration trim value.
      --  When HSITRIM is written, HSICAL is updated with the sum of HSITRIM
      --  and the factory trim value.
      HSICAL         : RCC_ICSCR_HSICAL_Field := 16#0#;
      --  HSI16 clock trimming These bits provide an additional
      --  user-programmable trimming value that is added to the HSICAL[7:0]
      --  bits. It can be programmed to adjust to variations in voltage and
      --  temperature that influence the frequency of the HSI16. The default
      --  value is 16, which, when added to the HSICAL value, should trim the
      --  HSI16 to 16 MHz 1 %.
      HSITRIM        : RCC_ICSCR_HSITRIM_Field := 16#40#;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_ICSCR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      HSICAL         at 0 range 16 .. 23;
      HSITRIM        at 0 range 24 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  System clock switch Set and cleared by software to select system clock
   --  source (SYSCLK). Configured by hardware to force HSI16 oscillator
   --  selection when exiting stop and standby modes or in case of failure of
   --  the HSE oscillator.
   type RCC_CFGR_SW_Field is
     (--  Reserved, must be kept at reset value
      B_0x0,
      --  HSI16 selected as system clock
      B_0x1,
      --  HSE selected as system clock
      B_0x2,
      --  PLL selected as system clock
      B_0x3)
     with Size => 2;
   for RCC_CFGR_SW_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  System clock switch status Set and cleared by hardware to indicate which
   --  clock source is used as system clock.
   type RCC_CFGR_SWS_Field is
     (--  Reserved, must be kept at reset value
      B_0x0,
      --  HSI16 oscillator used as system clock
      B_0x1,
      --  HSE used as system clock
      B_0x2,
      --  PLL used as system clock
      B_0x3)
     with Size => 2;
   for RCC_CFGR_SWS_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  AHB prescaler Set and cleared by software to control the division factor
   --  of the AHB clock. Note: Depending on the device voltage range, the
   --  software has to set correctly these bits to ensure that the system
   --  frequency does not exceed the maximum allowed frequency (for more
   --  details please refer to Section 6.1.5: Dynamic voltage scaling
   --  management). After a write operation to these bits and before decreasing
   --  the voltage range, this register must be read to be sure that the new
   --  value has been taken into account. 0xxx: SYSCLK not divided
   type RCC_CFGR_HPRE_Field is
     (--  Reset value for the field
      RCC_CFGR_HPRE_Field_Reset,
      --  SYSCLK divided by 2
      B_0x8,
      --  SYSCLK divided by 4
      B_0x9,
      --  SYSCLK divided by 8
      B_0xA,
      --  SYSCLK divided by 16
      B_0xB,
      --  SYSCLK divided by 64
      B_0xC,
      --  SYSCLK divided by 128
      B_0xD,
      --  SYSCLK divided by 256
      B_0xE,
      --  SYSCLK divided by 512
      B_0xF)
     with Size => 4;
   for RCC_CFGR_HPRE_Field use
     (RCC_CFGR_HPRE_Field_Reset => 0,
      B_0x8 => 8,
      B_0x9 => 9,
      B_0xA => 10,
      B_0xB => 11,
      B_0xC => 12,
      B_0xD => 13,
      B_0xE => 14,
      B_0xF => 15);

   --  APB1 prescaler Set and cleared by software to control the division
   --  factor of the APB1 clock (PCLK1). 0xx: HCLK not divided
   type RCC_CFGR_PPRE1_Field is
     (--  Reset value for the field
      RCC_CFGR_PPRE1_Field_Reset,
      --  HCLK divided by 2
      B_0x4,
      --  HCLK divided by 4
      B_0x5,
      --  HCLK divided by 8
      B_0x6,
      --  HCLK divided by 16
      B_0x7)
     with Size => 3;
   for RCC_CFGR_PPRE1_Field use
     (RCC_CFGR_PPRE1_Field_Reset => 0,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7);

   --  RCC_CFGR_PPRE array
   type RCC_CFGR_PPRE_Field_Array is array (1 .. 2) of RCC_CFGR_PPRE1_Field
     with Component_Size => 3, Size => 6;

   --  Type definition for RCC_CFGR_PPRE
   type RCC_CFGR_PPRE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PPRE as a value
            Val : Interfaces.STM32.UInt6;
         when True =>
            --  PPRE as an array
            Arr : RCC_CFGR_PPRE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for RCC_CFGR_PPRE_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Microcontroller clock output Set and cleared by software. Others:
   --  Reserved Note: This clock output may have some truncated cycles at
   --  startup or during MCO clock source switching.
   type RCC_CFGR_MCOSEL_Field is
     (--  MCO output disabled, no clock on MCO
      B_0x0,
      --  SYSCLK system clock selected
      B_0x1,
      --  Reserved, must be kept at reset value
      B_0x2,
      --  HSI16 clock selected
      B_0x3,
      --  HSE clock selected
      B_0x4,
      --  Main PLL clock selected
      B_0x5,
      --  LSI clock selected
      B_0x6,
      --  LSE clock selected
      B_0x7,
      --  Internal HSI48 clock selected
      B_0x8)
     with Size => 4;
   for RCC_CFGR_MCOSEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7,
      B_0x8 => 8);

   --  Microcontroller clock output prescaler These bits are set and cleared by
   --  software. It is highly recommended to change this prescaler before MCO
   --  output is enabled. Others: not allowed
   type RCC_CFGR_MCOPRE_Field is
     (--  MCO is divided by 1
      B_0x0,
      --  MCO is divided by 2
      B_0x1,
      --  MCO is divided by 4
      B_0x2,
      --  MCO is divided by 8
      B_0x3,
      --  MCO is divided by 16
      B_0x4)
     with Size => 3;
   for RCC_CFGR_MCOPRE_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4);

   --  Clock configuration register
   type RCC_CFGR_Register is record
      --  System clock switch Set and cleared by software to select system
      --  clock source (SYSCLK). Configured by hardware to force HSI16
      --  oscillator selection when exiting stop and standby modes or in case
      --  of failure of the HSE oscillator.
      SW             : RCC_CFGR_SW_Field := Interfaces.STM32.RCC.B_0x1;
      --  Read-only. System clock switch status Set and cleared by hardware to
      --  indicate which clock source is used as system clock.
      SWS            : RCC_CFGR_SWS_Field := Interfaces.STM32.RCC.B_0x1;
      --  AHB prescaler Set and cleared by software to control the division
      --  factor of the AHB clock. Note: Depending on the device voltage range,
      --  the software has to set correctly these bits to ensure that the
      --  system frequency does not exceed the maximum allowed frequency (for
      --  more details please refer to Section 6.1.5: Dynamic voltage scaling
      --  management). After a write operation to these bits and before
      --  decreasing the voltage range, this register must be read to be sure
      --  that the new value has been taken into account. 0xxx: SYSCLK not
      --  divided
      HPRE           : RCC_CFGR_HPRE_Field := RCC_CFGR_HPRE_Field_Reset;
      --  APB1 prescaler Set and cleared by software to control the division
      --  factor of the APB1 clock (PCLK1). 0xx: HCLK not divided
      PPRE           : RCC_CFGR_PPRE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_23 : Interfaces.STM32.UInt10 := 16#0#;
      --  Microcontroller clock output Set and cleared by software. Others:
      --  Reserved Note: This clock output may have some truncated cycles at
      --  startup or during MCO clock source switching.
      MCOSEL         : RCC_CFGR_MCOSEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  Microcontroller clock output prescaler These bits are set and cleared
      --  by software. It is highly recommended to change this prescaler before
      --  MCO output is enabled. Others: not allowed
      MCOPRE         : RCC_CFGR_MCOPRE_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_CFGR_Register use record
      SW             at 0 range 0 .. 1;
      SWS            at 0 range 2 .. 3;
      HPRE           at 0 range 4 .. 7;
      PPRE           at 0 range 8 .. 13;
      Reserved_14_23 at 0 range 14 .. 23;
      MCOSEL         at 0 range 24 .. 27;
      MCOPRE         at 0 range 28 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype RCC_PLLCFGR_PLLSRC_Field is Interfaces.STM32.UInt2;
   subtype RCC_PLLCFGR_PLLM_Field is Interfaces.STM32.UInt4;
   subtype RCC_PLLCFGR_PLLN_Field is Interfaces.STM32.UInt7;
   subtype RCC_PLLCFGR_PLLPEN_Field is Interfaces.STM32.Bit;
   subtype RCC_PLLCFGR_PLLP_Field is Interfaces.STM32.Bit;
   subtype RCC_PLLCFGR_PLLQEN_Field is Interfaces.STM32.Bit;
   subtype RCC_PLLCFGR_PLLQ_Field is Interfaces.STM32.UInt2;
   subtype RCC_PLLCFGR_PLLREN_Field is Interfaces.STM32.Bit;
   subtype RCC_PLLCFGR_PLLR_Field is Interfaces.STM32.UInt2;
   subtype RCC_PLLCFGR_PLLPDIV_Field is Interfaces.STM32.UInt5;

   --  PLL configuration register
   type RCC_PLLCFGR_Register is record
      --  Main PLL entry clock source Set and cleared by software to select PLL
      --  clock source. These bits can be written only when PLL is disabled. In
      --  order to save power, when no PLL is used, the value of PLLSRC should
      --  be 00.
      PLLSRC         : RCC_PLLCFGR_PLLSRC_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  Division factor for the main PLL input clock Set and cleared by
      --  software to divide the PLL input clock before the VCO. These bits can
      --  be written only when all PLLs are disabled. VCO input frequency = PLL
      --  input clock frequency / PLLM with 1 <= PLLM <= 16 ... Note: The
      --  software has to set these bits correctly to ensure that the VCO input
      --  frequency is within the range defined in the device datasheet.
      PLLM           : RCC_PLLCFGR_PLLM_Field := 16#0#;
      --  Main PLL multiplication factor for VCO Set and cleared by software to
      --  control the multiplication factor of the VCO. These bits can be
      --  written only when the PLL is disabled. VCO output frequency = VCO
      --  input frequency x PLLN with 8 =< PLLN =< 127 ... ... Note: The
      --  software has to set correctly these bits to assure that the VCO
      --  output frequency is within the range defined in the device datasheet.
      PLLN           : RCC_PLLCFGR_PLLN_Field := 16#10#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  Main PLL PLL P clock output enable Set and reset by software to
      --  enable the PLL P clock output of the PLL. In order to save power,
      --  when the PLL P clock output of the PLL is not used, the value of
      --  PLLPEN should be 0.
      PLLPEN         : RCC_PLLCFGR_PLLPEN_Field := 16#0#;
      --  Main PLL division factor for PLL P clock. Set and cleared by software
      --  to control the frequency of the main PLL output clock PLL P clock.
      --  These bits can be written only if PLL is disabled. When the
      --  PLLPDIV[4:0] is set to 00000PLL P output clock frequency = VCO
      --  frequency / PLLP with PLLP =7, or 17 Note: The software has to set
      --  these bits correctly not to exceed 170 MHz on this domain.
      PLLP           : RCC_PLLCFGR_PLLP_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : Interfaces.STM32.UInt2 := 16#0#;
      --  Main PLL Q clock output enable Set and reset by software to enable
      --  the PLL Q clock output of the PLL. In order to save power, when the
      --  PLL Q clock output of the PLL is not used, the value of PLLQEN should
      --  be 0.
      PLLQEN         : RCC_PLLCFGR_PLLQEN_Field := 16#0#;
      --  Main PLL division factor for PLL Q clock. Set and cleared by software
      --  to control the frequency of the main PLL output clock PLL Q clock.
      --  This output can be selected for USB, RNG, SAI (48 MHz clock). These
      --  bits can be written only if PLL is disabled. PLL Q output clock
      --  frequency = VCO frequency / PLLQ with PLLQ = 2, 4, 6, or 8 Note: The
      --  software has to set these bits correctly not to exceed 170 MHz on
      --  this domain.
      PLLQ           : RCC_PLLCFGR_PLLQ_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : Interfaces.STM32.Bit := 16#0#;
      --  PLL R clock output enable Set and reset by software to enable the PLL
      --  R clock output of the PLL (used as system clock). This bit cannot be
      --  written when PLL R clock output of the PLL is used as System Clock.
      --  In order to save power, when the PLL R clock output of the PLL is not
      --  used, the value of PLLREN should be 0.
      PLLREN         : RCC_PLLCFGR_PLLREN_Field := 16#0#;
      --  Main PLL division factor for PLL R clock (system clock) Set and
      --  cleared by software to control the frequency of the main PLL output
      --  clock PLLCLK. This output can be selected as system clock. These bits
      --  can be written only if PLL is disabled. PLL R output clock frequency
      --  = VCO frequency / PLLR with PLLR = 2, 4, 6, or 8 Note: The software
      --  has to set these bits correctly not to exceed 170 MHz on this domain.
      PLLR           : RCC_PLLCFGR_PLLR_Field := 16#0#;
      --  Main PLLP division factor Set and cleared by software to control the
      --  PLL P frequency. PLL P output clock frequency = VCO frequency /
      --  PLLPDIV. ....
      PLLPDIV        : RCC_PLLCFGR_PLLPDIV_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_PLLCFGR_Register use record
      PLLSRC         at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      PLLM           at 0 range 4 .. 7;
      PLLN           at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      PLLPEN         at 0 range 16 .. 16;
      PLLP           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      PLLQEN         at 0 range 20 .. 20;
      PLLQ           at 0 range 21 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      PLLREN         at 0 range 24 .. 24;
      PLLR           at 0 range 25 .. 26;
      PLLPDIV        at 0 range 27 .. 31;
   end record;

   --  LSI ready interrupt enable Set and cleared by software to enable/disable
   --  interrupt caused by the LSI oscillator stabilization.
   type RCC_CIER_LSIRDYIE_Field is
     (--  LSI ready interrupt disabled
      B_0x0,
      --  LSI ready interrupt enabled
      B_0x1)
     with Size => 1;
   for RCC_CIER_LSIRDYIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSE ready interrupt enable Set and cleared by software to enable/disable
   --  interrupt caused by the LSE oscillator stabilization.
   type RCC_CIER_LSERDYIE_Field is
     (--  LSE ready interrupt disabled
      B_0x0,
      --  LSE ready interrupt enabled
      B_0x1)
     with Size => 1;
   for RCC_CIER_LSERDYIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSI16 ready interrupt enable Set and cleared by software to
   --  enable/disable interrupt caused by the HSI16 oscillator stabilization.
   type RCC_CIER_HSIRDYIE_Field is
     (--  HSI16 ready interrupt disabled
      B_0x0,
      --  HSI16 ready interrupt enabled
      B_0x1)
     with Size => 1;
   for RCC_CIER_HSIRDYIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSE ready interrupt enable Set and cleared by software to enable/disable
   --  interrupt caused by the HSE oscillator stabilization.
   type RCC_CIER_HSERDYIE_Field is
     (--  HSE ready interrupt disabled
      B_0x0,
      --  HSE ready interrupt enabled
      B_0x1)
     with Size => 1;
   for RCC_CIER_HSERDYIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  PLL ready interrupt enable Set and cleared by software to enable/disable
   --  interrupt caused by PLL lock.
   type RCC_CIER_PLLRDYIE_Field is
     (--  PLL lock interrupt disabled
      B_0x0,
      --  PLL lock interrupt enabled
      B_0x1)
     with Size => 1;
   for RCC_CIER_PLLRDYIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSE clock security system interrupt enable Set and cleared by software
   --  to enable/disable interrupt caused by the clock security system on LSE.
   type RCC_CIER_LSECSSIE_Field is
     (--  Clock security interrupt caused by LSE clock failure disabled
      B_0x0,
      --  Clock security interrupt caused by LSE clock failure enabled
      B_0x1)
     with Size => 1;
   for RCC_CIER_LSECSSIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSI48 ready interrupt enable Set and cleared by software to
   --  enable/disable interrupt caused by the internal HSI48 oscillator.
   type RCC_CIER_HSI48RDYIE_Field is
     (--  HSI48 ready interrupt disabled
      B_0x0,
      --  HSI48 ready interrupt enabled
      B_0x1)
     with Size => 1;
   for RCC_CIER_HSI48RDYIE_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Clock interrupt enable register
   type RCC_CIER_Register is record
      --  LSI ready interrupt enable Set and cleared by software to
      --  enable/disable interrupt caused by the LSI oscillator stabilization.
      LSIRDYIE       : RCC_CIER_LSIRDYIE_Field := Interfaces.STM32.RCC.B_0x0;
      --  LSE ready interrupt enable Set and cleared by software to
      --  enable/disable interrupt caused by the LSE oscillator stabilization.
      LSERDYIE       : RCC_CIER_LSERDYIE_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit := 16#0#;
      --  HSI16 ready interrupt enable Set and cleared by software to
      --  enable/disable interrupt caused by the HSI16 oscillator
      --  stabilization.
      HSIRDYIE       : RCC_CIER_HSIRDYIE_Field := Interfaces.STM32.RCC.B_0x0;
      --  HSE ready interrupt enable Set and cleared by software to
      --  enable/disable interrupt caused by the HSE oscillator stabilization.
      HSERDYIE       : RCC_CIER_HSERDYIE_Field := Interfaces.STM32.RCC.B_0x0;
      --  PLL ready interrupt enable Set and cleared by software to
      --  enable/disable interrupt caused by PLL lock.
      PLLRDYIE       : RCC_CIER_PLLRDYIE_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_6_8   : Interfaces.STM32.UInt3 := 16#0#;
      --  LSE clock security system interrupt enable Set and cleared by
      --  software to enable/disable interrupt caused by the clock security
      --  system on LSE.
      LSECSSIE       : RCC_CIER_LSECSSIE_Field := Interfaces.STM32.RCC.B_0x0;
      --  HSI48 ready interrupt enable Set and cleared by software to
      --  enable/disable interrupt caused by the internal HSI48 oscillator.
      HSI48RDYIE     : RCC_CIER_HSI48RDYIE_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_11_31 : Interfaces.STM32.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_CIER_Register use record
      LSIRDYIE       at 0 range 0 .. 0;
      LSERDYIE       at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      HSIRDYIE       at 0 range 3 .. 3;
      HSERDYIE       at 0 range 4 .. 4;
      PLLRDYIE       at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      LSECSSIE       at 0 range 9 .. 9;
      HSI48RDYIE     at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  LSI ready interrupt flag Set by hardware when the LSI clock becomes
   --  stable and LSIRDYDIE is set. Cleared by software setting the LSIRDYC
   --  bit.
   type RCC_CIFR_LSIRDYF_Field is
     (--  No clock ready interrupt caused by the LSI oscillator
      B_0x0,
      --  Clock ready interrupt caused by the LSI oscillator
      B_0x1)
     with Size => 1;
   for RCC_CIFR_LSIRDYF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSE ready interrupt flag Set by hardware when the LSE clock becomes
   --  stable and LSERDYDIE is set. Cleared by software setting the LSERDYC
   --  bit.
   type RCC_CIFR_LSERDYF_Field is
     (--  No clock ready interrupt caused by the LSE oscillator
      B_0x0,
      --  Clock ready interrupt caused by the LSE oscillator
      B_0x1)
     with Size => 1;
   for RCC_CIFR_LSERDYF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSI16 ready interrupt flag Set by hardware when the HSI16 clock becomes
   --  stable and HSIRDYDIE is set in a response to setting the HSION (refer to
   --  Clock control register (RCC_CR)). When HSION is not set but the HSI16
   --  oscillator is enabled by the peripheral through a clock request, this
   --  bit is not set and no interrupt is generated. Cleared by software
   --  setting the HSIRDYC bit.
   type RCC_CIFR_HSIRDYF_Field is
     (--  No clock ready interrupt caused by the HSI16 oscillator
      B_0x0,
      --  Clock ready interrupt caused by the HSI16 oscillator
      B_0x1)
     with Size => 1;
   for RCC_CIFR_HSIRDYF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSE ready interrupt flag Set by hardware when the HSE clock becomes
   --  stable and HSERDYDIE is set. Cleared by software setting the HSERDYC
   --  bit.
   type RCC_CIFR_HSERDYF_Field is
     (--  No clock ready interrupt caused by the HSE oscillator
      B_0x0,
      --  Clock ready interrupt caused by the HSE oscillator
      B_0x1)
     with Size => 1;
   for RCC_CIFR_HSERDYF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  PLL ready interrupt flag Set by hardware when the PLL locks and
   --  PLLRDYDIE is set. Cleared by software setting the PLLRDYC bit.
   type RCC_CIFR_PLLRDYF_Field is
     (--  No clock ready interrupt caused by PLL lock
      B_0x0,
      --  Clock ready interrupt caused by PLL lock
      B_0x1)
     with Size => 1;
   for RCC_CIFR_PLLRDYF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Clock security system interrupt flag Set by hardware when a failure is
   --  detected in the HSE oscillator. Cleared by software setting the CSSC
   --  bit.
   type RCC_CIFR_CSSF_Field is
     (--  No clock security interrupt caused by HSE clock failure
      B_0x0,
      --  Clock security interrupt caused by HSE clock failure
      B_0x1)
     with Size => 1;
   for RCC_CIFR_CSSF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSE Clock security system interrupt flag Set by hardware when a failure
   --  is detected in the LSE oscillator. Cleared by software setting the
   --  LSECSSC bit.
   type RCC_CIFR_LSECSSF_Field is
     (--  No clock security interrupt caused by LSE clock failure
      B_0x0,
      --  Clock security interrupt caused by LSE clock failure
      B_0x1)
     with Size => 1;
   for RCC_CIFR_LSECSSF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSI48 ready interrupt flag Set by hardware when the HSI48 clock becomes
   --  stable and HSI48RDYIE is set in a response to setting the HSI48ON (refer
   --  to Clock recovery RC register (RCC_CRRCR)). Cleared by software setting
   --  the HSI48RDYC bit.
   type RCC_CIFR_HSI48RDYF_Field is
     (--  No clock ready interrupt caused by the HSI48 oscillator
      B_0x0,
      --  Clock ready interrupt caused by the HSI48 oscillator
      B_0x1)
     with Size => 1;
   for RCC_CIFR_HSI48RDYF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Clock interrupt flag register
   type RCC_CIFR_Register is record
      --  Read-only. LSI ready interrupt flag Set by hardware when the LSI
      --  clock becomes stable and LSIRDYDIE is set. Cleared by software
      --  setting the LSIRDYC bit.
      LSIRDYF        : RCC_CIFR_LSIRDYF_Field;
      --  Read-only. LSE ready interrupt flag Set by hardware when the LSE
      --  clock becomes stable and LSERDYDIE is set. Cleared by software
      --  setting the LSERDYC bit.
      LSERDYF        : RCC_CIFR_LSERDYF_Field;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit;
      --  Read-only. HSI16 ready interrupt flag Set by hardware when the HSI16
      --  clock becomes stable and HSIRDYDIE is set in a response to setting
      --  the HSION (refer to Clock control register (RCC_CR)). When HSION is
      --  not set but the HSI16 oscillator is enabled by the peripheral through
      --  a clock request, this bit is not set and no interrupt is generated.
      --  Cleared by software setting the HSIRDYC bit.
      HSIRDYF        : RCC_CIFR_HSIRDYF_Field;
      --  Read-only. HSE ready interrupt flag Set by hardware when the HSE
      --  clock becomes stable and HSERDYDIE is set. Cleared by software
      --  setting the HSERDYC bit.
      HSERDYF        : RCC_CIFR_HSERDYF_Field;
      --  Read-only. PLL ready interrupt flag Set by hardware when the PLL
      --  locks and PLLRDYDIE is set. Cleared by software setting the PLLRDYC
      --  bit.
      PLLRDYF        : RCC_CIFR_PLLRDYF_Field;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2;
      --  Read-only. Clock security system interrupt flag Set by hardware when
      --  a failure is detected in the HSE oscillator. Cleared by software
      --  setting the CSSC bit.
      CSSF           : RCC_CIFR_CSSF_Field;
      --  Read-only. LSE Clock security system interrupt flag Set by hardware
      --  when a failure is detected in the LSE oscillator. Cleared by software
      --  setting the LSECSSC bit.
      LSECSSF        : RCC_CIFR_LSECSSF_Field;
      --  Read-only. HSI48 ready interrupt flag Set by hardware when the HSI48
      --  clock becomes stable and HSI48RDYIE is set in a response to setting
      --  the HSI48ON (refer to Clock recovery RC register (RCC_CRRCR)).
      --  Cleared by software setting the HSI48RDYC bit.
      HSI48RDYF      : RCC_CIFR_HSI48RDYF_Field;
      --  unspecified
      Reserved_11_31 : Interfaces.STM32.UInt21;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_CIFR_Register use record
      LSIRDYF        at 0 range 0 .. 0;
      LSERDYF        at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      HSIRDYF        at 0 range 3 .. 3;
      HSERDYF        at 0 range 4 .. 4;
      PLLRDYF        at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CSSF           at 0 range 8 .. 8;
      LSECSSF        at 0 range 9 .. 9;
      HSI48RDYF      at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  LSI ready interrupt clear This bit is set by software to clear the
   --  LSIRDYF flag.
   type RCC_CICR_LSIRDYC_Field is
     (--  No effect
      B_0x0,
      --  LSIRDYF cleared
      B_0x1)
     with Size => 1;
   for RCC_CICR_LSIRDYC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSE ready interrupt clear This bit is set by software to clear the
   --  LSERDYF flag.
   type RCC_CICR_LSERDYC_Field is
     (--  No effect
      B_0x0,
      --  LSERDYF cleared
      B_0x1)
     with Size => 1;
   for RCC_CICR_LSERDYC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSI16 ready interrupt clear This bit is set software to clear the
   --  HSIRDYF flag.
   type RCC_CICR_HSIRDYC_Field is
     (--  No effect
      B_0x0,
      --  Clear HSIRDYF flag
      B_0x1)
     with Size => 1;
   for RCC_CICR_HSIRDYC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSE ready interrupt clear This bit is set by software to clear the
   --  HSERDYF flag.
   type RCC_CICR_HSERDYC_Field is
     (--  No effect
      B_0x0,
      --  Clear HSERDYF flag
      B_0x1)
     with Size => 1;
   for RCC_CICR_HSERDYC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  PLL ready interrupt clear This bit is set by software to clear the
   --  PLLRDYF flag.
   type RCC_CICR_PLLRDYC_Field is
     (--  No effect
      B_0x0,
      --  Clear PLLRDYF flag
      B_0x1)
     with Size => 1;
   for RCC_CICR_PLLRDYC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Clock security system interrupt clear This bit is set by software to
   --  clear the CSSF flag.
   type RCC_CICR_CSSC_Field is
     (--  No effect
      B_0x0,
      --  Clear CSSF flag
      B_0x1)
     with Size => 1;
   for RCC_CICR_CSSC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSE Clock security system interrupt clear This bit is set by software to
   --  clear the LSECSSF flag.
   type RCC_CICR_LSECSSC_Field is
     (--  No effect
      B_0x0,
      --  Clear LSECSSF flag
      B_0x1)
     with Size => 1;
   for RCC_CICR_LSECSSC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSI48 oscillator ready interrupt clear This bit is set by software to
   --  clear the HSI48RDYF flag.
   type RCC_CICR_HSI48RDYC_Field is
     (--  No effect
      B_0x0,
      --  Clear the HSI48RDYC flag
      B_0x1)
     with Size => 1;
   for RCC_CICR_HSI48RDYC_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Clock interrupt clear register
   type RCC_CICR_Register is record
      --  Write-only. LSI ready interrupt clear This bit is set by software to
      --  clear the LSIRDYF flag.
      LSIRDYC        : RCC_CICR_LSIRDYC_Field := Interfaces.STM32.RCC.B_0x0;
      --  Write-only. LSE ready interrupt clear This bit is set by software to
      --  clear the LSERDYF flag.
      LSERDYC        : RCC_CICR_LSERDYC_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit := 16#0#;
      --  Write-only. HSI16 ready interrupt clear This bit is set software to
      --  clear the HSIRDYF flag.
      HSIRDYC        : RCC_CICR_HSIRDYC_Field := Interfaces.STM32.RCC.B_0x0;
      --  Write-only. HSE ready interrupt clear This bit is set by software to
      --  clear the HSERDYF flag.
      HSERDYC        : RCC_CICR_HSERDYC_Field := Interfaces.STM32.RCC.B_0x0;
      --  Write-only. PLL ready interrupt clear This bit is set by software to
      --  clear the PLLRDYF flag.
      PLLRDYC        : RCC_CICR_PLLRDYC_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  Write-only. Clock security system interrupt clear This bit is set by
      --  software to clear the CSSF flag.
      CSSC           : RCC_CICR_CSSC_Field := Interfaces.STM32.RCC.B_0x0;
      --  Write-only. LSE Clock security system interrupt clear This bit is set
      --  by software to clear the LSECSSF flag.
      LSECSSC        : RCC_CICR_LSECSSC_Field := Interfaces.STM32.RCC.B_0x0;
      --  Write-only. HSI48 oscillator ready interrupt clear This bit is set by
      --  software to clear the HSI48RDYF flag.
      HSI48RDYC      : RCC_CICR_HSI48RDYC_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_11_31 : Interfaces.STM32.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_CICR_Register use record
      LSIRDYC        at 0 range 0 .. 0;
      LSERDYC        at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      HSIRDYC        at 0 range 3 .. 3;
      HSERDYC        at 0 range 4 .. 4;
      PLLRDYC        at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CSSC           at 0 range 8 .. 8;
      LSECSSC        at 0 range 9 .. 9;
      HSI48RDYC      at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  DMA1 reset Set and cleared by software.
   type RCC_AHB1RSTR_DMA1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset DMA1
      B_0x1)
     with Size => 1;
   for RCC_AHB1RSTR_DMA1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DMA2 reset Set and cleared by software.
   type RCC_AHB1RSTR_DMA2RST_Field is
     (--  No effect
      B_0x0,
      --  Reset DMA2
      B_0x1)
     with Size => 1;
   for RCC_AHB1RSTR_DMA2RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Set and cleared by software.
   type RCC_AHB1RSTR_DMAMUX1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset DMAMUX1
      B_0x1)
     with Size => 1;
   for RCC_AHB1RSTR_DMAMUX1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Set and cleared by software
   type RCC_AHB1RSTR_CORDICRST_Field is
     (--  No effect
      B_0x0,
      --  Reset CORDIC
      B_0x1)
     with Size => 1;
   for RCC_AHB1RSTR_CORDICRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Set and cleared by software
   type RCC_AHB1RSTR_FMACRST_Field is
     (--  No effect
      B_0x0,
      --  Reset FMAC
      B_0x1)
     with Size => 1;
   for RCC_AHB1RSTR_FMACRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Flash memory interface reset Set and cleared by software. This bit can
   --  be activated only when the Flash memory is in power down mode.
   type RCC_AHB1RSTR_FLASHRST_Field is
     (--  No effect
      B_0x0,
      --  Reset Flash memory interface
      B_0x1)
     with Size => 1;
   for RCC_AHB1RSTR_FLASHRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CRC reset Set and cleared by software.
   type RCC_AHB1RSTR_CRCRST_Field is
     (--  No effect
      B_0x0,
      --  Reset CRC
      B_0x1)
     with Size => 1;
   for RCC_AHB1RSTR_CRCRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AHB1 peripheral reset register
   type RCC_AHB1RSTR_Register is record
      --  DMA1 reset Set and cleared by software.
      DMA1RST        : RCC_AHB1RSTR_DMA1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  DMA2 reset Set and cleared by software.
      DMA2RST        : RCC_AHB1RSTR_DMA2RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  Set and cleared by software.
      DMAMUX1RST     : RCC_AHB1RSTR_DMAMUX1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  Set and cleared by software
      CORDICRST      : RCC_AHB1RSTR_CORDICRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  Set and cleared by software
      FMACRST        : RCC_AHB1RSTR_FMACRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_5_7   : Interfaces.STM32.UInt3 := 16#0#;
      --  Flash memory interface reset Set and cleared by software. This bit
      --  can be activated only when the Flash memory is in power down mode.
      FLASHRST       : RCC_AHB1RSTR_FLASHRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_9_11  : Interfaces.STM32.UInt3 := 16#0#;
      --  CRC reset Set and cleared by software.
      CRCRST         : RCC_AHB1RSTR_CRCRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_13_31 : Interfaces.STM32.UInt19 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_AHB1RSTR_Register use record
      DMA1RST        at 0 range 0 .. 0;
      DMA2RST        at 0 range 1 .. 1;
      DMAMUX1RST     at 0 range 2 .. 2;
      CORDICRST      at 0 range 3 .. 3;
      FMACRST        at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      FLASHRST       at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      CRCRST         at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  IO port A reset Set and cleared by software.
   type RCC_AHB2RSTR_GPIOARST_Field is
     (--  No effect
      B_0x0,
      --  Reset IO port A
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_GPIOARST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port B reset Set and cleared by software.
   type RCC_AHB2RSTR_GPIOBRST_Field is
     (--  No effect
      B_0x0,
      --  Reset IO port B
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_GPIOBRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port C reset Set and cleared by software.
   type RCC_AHB2RSTR_GPIOCRST_Field is
     (--  No effect
      B_0x0,
      --  Reset IO port C
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_GPIOCRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port D reset Set and cleared by software.
   type RCC_AHB2RSTR_GPIODRST_Field is
     (--  No effect
      B_0x0,
      --  Reset IO port D
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_GPIODRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port E reset Set and cleared by software.
   type RCC_AHB2RSTR_GPIOERST_Field is
     (--  No effect
      B_0x0,
      --  Reset IO port E
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_GPIOERST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port F reset Set and cleared by software.
   type RCC_AHB2RSTR_GPIOFRST_Field is
     (--  No effect
      B_0x0,
      --  Reset IO port F
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_GPIOFRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port G reset Set and cleared by software.
   type RCC_AHB2RSTR_GPIOGRST_Field is
     (--  No effect
      B_0x0,
      --  Reset IO port G
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_GPIOGRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  ADC12 reset Set and cleared by software.
   type RCC_AHB2RSTR_ADC12RST_Field is
     (--  No effect
      B_0x0,
      --  Reset ADC12 interface
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_ADC12RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  ADC345 reset Set and cleared by software.
   type RCC_AHB2RSTR_ADC345RST_Field is
     (--  No effect
      B_0x0,
      --  Reset ADC345
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_ADC345RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC1 reset Set and cleared by software.
   type RCC_AHB2RSTR_DAC1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset DAC1
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_DAC1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC2 reset Set and cleared by software.
   type RCC_AHB2RSTR_DAC2RST_Field is
     (--  No effect
      B_0x0,
      --  Reset DAC2
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_DAC2RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC3 reset Set and cleared by software.
   type RCC_AHB2RSTR_DAC3RST_Field is
     (--  No effect
      B_0x0,
      --  Reset DAC3
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_DAC3RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC4 reset Set and cleared by software.
   type RCC_AHB2RSTR_DAC4RST_Field is
     (--  No effect
      B_0x0,
      --  Reset DAC4
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_DAC4RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AESRST reset Set and cleared by software.
   type RCC_AHB2RSTR_AESRST_Field is
     (--  No effect
      B_0x0,
      --  Reset AES
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_AESRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  RNG reset Set and cleared by software.
   type RCC_AHB2RSTR_RNGRST_Field is
     (--  No effect
      B_0x0,
      --  Reset RNG
      B_0x1)
     with Size => 1;
   for RCC_AHB2RSTR_RNGRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AHB2 peripheral reset register
   type RCC_AHB2RSTR_Register is record
      --  IO port A reset Set and cleared by software.
      GPIOARST       : RCC_AHB2RSTR_GPIOARST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port B reset Set and cleared by software.
      GPIOBRST       : RCC_AHB2RSTR_GPIOBRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port C reset Set and cleared by software.
      GPIOCRST       : RCC_AHB2RSTR_GPIOCRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port D reset Set and cleared by software.
      GPIODRST       : RCC_AHB2RSTR_GPIODRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port E reset Set and cleared by software.
      GPIOERST       : RCC_AHB2RSTR_GPIOERST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port F reset Set and cleared by software.
      GPIOFRST       : RCC_AHB2RSTR_GPIOFRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port G reset Set and cleared by software.
      GPIOGRST       : RCC_AHB2RSTR_GPIOGRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_7_12  : Interfaces.STM32.UInt6 := 16#0#;
      --  ADC12 reset Set and cleared by software.
      ADC12RST       : RCC_AHB2RSTR_ADC12RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  ADC345 reset Set and cleared by software.
      ADC345RST      : RCC_AHB2RSTR_ADC345RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  DAC1 reset Set and cleared by software.
      DAC1RST        : RCC_AHB2RSTR_DAC1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  DAC2 reset Set and cleared by software.
      DAC2RST        : RCC_AHB2RSTR_DAC2RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  DAC3 reset Set and cleared by software.
      DAC3RST        : RCC_AHB2RSTR_DAC3RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  DAC4 reset Set and cleared by software.
      DAC4RST        : RCC_AHB2RSTR_DAC4RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_20_23 : Interfaces.STM32.UInt4 := 16#0#;
      --  AESRST reset Set and cleared by software.
      AESRST         : RCC_AHB2RSTR_AESRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_25_25 : Interfaces.STM32.Bit := 16#0#;
      --  RNG reset Set and cleared by software.
      RNGRST         : RCC_AHB2RSTR_RNGRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_27_31 : Interfaces.STM32.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_AHB2RSTR_Register use record
      GPIOARST       at 0 range 0 .. 0;
      GPIOBRST       at 0 range 1 .. 1;
      GPIOCRST       at 0 range 2 .. 2;
      GPIODRST       at 0 range 3 .. 3;
      GPIOERST       at 0 range 4 .. 4;
      GPIOFRST       at 0 range 5 .. 5;
      GPIOGRST       at 0 range 6 .. 6;
      Reserved_7_12  at 0 range 7 .. 12;
      ADC12RST       at 0 range 13 .. 13;
      ADC345RST      at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      DAC1RST        at 0 range 16 .. 16;
      DAC2RST        at 0 range 17 .. 17;
      DAC3RST        at 0 range 18 .. 18;
      DAC4RST        at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      AESRST         at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      RNGRST         at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  Flexible static memory controller reset Set and cleared by software.
   type RCC_AHB3RSTR_FMCRST_Field is
     (--  No effect
      B_0x0,
      --  Reset FSMC
      B_0x1)
     with Size => 1;
   for RCC_AHB3RSTR_FMCRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  QUADSPI reset Set and cleared by software.
   type RCC_AHB3RSTR_QSPIRST_Field is
     (--  No effect
      B_0x0,
      --  Reset QUADSPI
      B_0x1)
     with Size => 1;
   for RCC_AHB3RSTR_QSPIRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AHB3 peripheral reset register
   type RCC_AHB3RSTR_Register is record
      --  Flexible static memory controller reset Set and cleared by software.
      FMCRST        : RCC_AHB3RSTR_FMCRST_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_1_7  : Interfaces.STM32.UInt7 := 16#0#;
      --  QUADSPI reset Set and cleared by software.
      QSPIRST       : RCC_AHB3RSTR_QSPIRST_Field :=
                       Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_AHB3RSTR_Register use record
      FMCRST        at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      QSPIRST       at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  TIM2 timer reset Set and cleared by software.
   type RCC_APB1RSTR1_TIM2RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM2
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_TIM2RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM3 timer reset Set and cleared by software.
   type RCC_APB1RSTR1_TIM3RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM3
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_TIM3RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM3 timer reset Set and cleared by software.
   type RCC_APB1RSTR1_TIM4RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM3
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_TIM4RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM5 timer reset Set and cleared by software.
   type RCC_APB1RSTR1_TIM5RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM5
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_TIM5RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM6 timer reset Set and cleared by software.
   type RCC_APB1RSTR1_TIM6RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM7
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_TIM6RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM7 timer reset Set and cleared by software.
   type RCC_APB1RSTR1_TIM7RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM7
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_TIM7RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CRS reset Set and cleared by software.
   type RCC_APB1RSTR1_CRSRST_Field is
     (--  No effect
      B_0x0,
      --  Reset CRS
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_CRSRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI2 reset Set and cleared by software.
   type RCC_APB1RSTR1_SPI2RST_Field is
     (--  No effect
      B_0x0,
      --  Reset SPI2
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_SPI2RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI3 reset Set and cleared by software.
   type RCC_APB1RSTR1_SPI3RST_Field is
     (--  No effect
      B_0x0,
      --  Reset SPI3
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_SPI3RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USART2 reset Set and cleared by software.
   type RCC_APB1RSTR1_USART2RST_Field is
     (--  No effect
      B_0x0,
      --  Reset USART2
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_USART2RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USART3 reset Set and cleared by software.
   type RCC_APB1RSTR1_USART3RST_Field is
     (--  No effect
      B_0x0,
      --  Reset USART3
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_USART3RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  UART4 reset Set and cleared by software.
   type RCC_APB1RSTR1_UART4RST_Field is
     (--  No effect
      B_0x0,
      --  Reset UART4
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_UART4RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  UART5 reset Set and cleared by software.
   type RCC_APB1RSTR1_UART5RST_Field is
     (--  No effect
      B_0x0,
      --  Reset UART5
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_UART5RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C1 reset Set and cleared by software.
   type RCC_APB1RSTR1_I2C1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset I2C1
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_I2C1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C2 reset Set and cleared by software.
   type RCC_APB1RSTR1_I2C2RST_Field is
     (--  No effect
      B_0x0,
      --  Reset I2C2
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_I2C2RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USB device reset Set and reset by software.
   type RCC_APB1RSTR1_USBRST_Field is
     (--  No effect
      B_0x0,
      --  Reset USB device
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_USBRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN reset Set and reset by software.
   type RCC_APB1RSTR1_FDCANRST_Field is
     (--  No effect
      B_0x0,
      --  Reset the FDCAN
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_FDCANRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Power interface reset Set and cleared by software.
   type RCC_APB1RSTR1_PWRRST_Field is
     (--  No effect
      B_0x0,
      --  Reset PWR
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_PWRRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C3 reset Set and cleared by software.
   type RCC_APB1RSTR1_I2C3RST_Field is
     (--  No effect
      B_0x0,
      --  Reset I2C3 interface
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_I2C3RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Low Power Timer 1 reset Set and cleared by software.
   type RCC_APB1RSTR1_LPTIM1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset LPTIM1
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR1_LPTIM1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  APB1 peripheral reset register 1
   type RCC_APB1RSTR1_Register is record
      --  TIM2 timer reset Set and cleared by software.
      TIM2RST        : RCC_APB1RSTR1_TIM2RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM3 timer reset Set and cleared by software.
      TIM3RST        : RCC_APB1RSTR1_TIM3RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM3 timer reset Set and cleared by software.
      TIM4RST        : RCC_APB1RSTR1_TIM4RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM5 timer reset Set and cleared by software.
      TIM5RST        : RCC_APB1RSTR1_TIM5RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM6 timer reset Set and cleared by software.
      TIM6RST        : RCC_APB1RSTR1_TIM6RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM7 timer reset Set and cleared by software.
      TIM7RST        : RCC_APB1RSTR1_TIM7RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  CRS reset Set and cleared by software.
      CRSRST         : RCC_APB1RSTR1_CRSRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_9_13  : Interfaces.STM32.UInt5 := 16#0#;
      --  SPI2 reset Set and cleared by software.
      SPI2RST        : RCC_APB1RSTR1_SPI2RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  SPI3 reset Set and cleared by software.
      SPI3RST        : RCC_APB1RSTR1_SPI3RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_16_16 : Interfaces.STM32.Bit := 16#0#;
      --  USART2 reset Set and cleared by software.
      USART2RST      : RCC_APB1RSTR1_USART2RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  USART3 reset Set and cleared by software.
      USART3RST      : RCC_APB1RSTR1_USART3RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  UART4 reset Set and cleared by software.
      UART4RST       : RCC_APB1RSTR1_UART4RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  UART5 reset Set and cleared by software.
      UART5RST       : RCC_APB1RSTR1_UART5RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  I2C1 reset Set and cleared by software.
      I2C1RST        : RCC_APB1RSTR1_I2C1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  I2C2 reset Set and cleared by software.
      I2C2RST        : RCC_APB1RSTR1_I2C2RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  USB device reset Set and reset by software.
      USBRST         : RCC_APB1RSTR1_USBRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_24_24 : Interfaces.STM32.Bit := 16#0#;
      --  FDCAN reset Set and reset by software.
      FDCANRST       : RCC_APB1RSTR1_FDCANRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_26_27 : Interfaces.STM32.UInt2 := 16#0#;
      --  Power interface reset Set and cleared by software.
      PWRRST         : RCC_APB1RSTR1_PWRRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_29_29 : Interfaces.STM32.Bit := 16#0#;
      --  I2C3 reset Set and cleared by software.
      I2C3RST        : RCC_APB1RSTR1_I2C3RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  Low Power Timer 1 reset Set and cleared by software.
      LPTIM1RST      : RCC_APB1RSTR1_LPTIM1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_APB1RSTR1_Register use record
      TIM2RST        at 0 range 0 .. 0;
      TIM3RST        at 0 range 1 .. 1;
      TIM4RST        at 0 range 2 .. 2;
      TIM5RST        at 0 range 3 .. 3;
      TIM6RST        at 0 range 4 .. 4;
      TIM7RST        at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CRSRST         at 0 range 8 .. 8;
      Reserved_9_13  at 0 range 9 .. 13;
      SPI2RST        at 0 range 14 .. 14;
      SPI3RST        at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      USART2RST      at 0 range 17 .. 17;
      USART3RST      at 0 range 18 .. 18;
      UART4RST       at 0 range 19 .. 19;
      UART5RST       at 0 range 20 .. 20;
      I2C1RST        at 0 range 21 .. 21;
      I2C2RST        at 0 range 22 .. 22;
      USBRST         at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      FDCANRST       at 0 range 25 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      PWRRST         at 0 range 28 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      I2C3RST        at 0 range 30 .. 30;
      LPTIM1RST      at 0 range 31 .. 31;
   end record;

   --  Low-power UART 1 reset Set and cleared by software.
   type RCC_APB1RSTR2_LPUART1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset LPUART1
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR2_LPUART1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C4 reset Set and cleared by software
   type RCC_APB1RSTR2_I2C4RST_Field is
     (--  No effect
      B_0x0,
      --  Reset I2C4
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR2_I2C4RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  UCPD1 reset Set and cleared by software.
   type RCC_APB1RSTR2_UCPD1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset UCPD1
      B_0x1)
     with Size => 1;
   for RCC_APB1RSTR2_UCPD1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  APB1 peripheral reset register 2
   type RCC_APB1RSTR2_Register is record
      --  Low-power UART 1 reset Set and cleared by software.
      LPUART1RST    : RCC_APB1RSTR2_LPUART1RST_Field :=
                       Interfaces.STM32.RCC.B_0x0;
      --  I2C4 reset Set and cleared by software
      I2C4RST       : RCC_APB1RSTR2_I2C4RST_Field :=
                       Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_2_7  : Interfaces.STM32.UInt6 := 16#0#;
      --  UCPD1 reset Set and cleared by software.
      UCPD1RST      : RCC_APB1RSTR2_UCPD1RST_Field :=
                       Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_APB1RSTR2_Register use record
      LPUART1RST    at 0 range 0 .. 0;
      I2C4RST       at 0 range 1 .. 1;
      Reserved_2_7  at 0 range 2 .. 7;
      UCPD1RST      at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  SYSCFG + COMP + OPAMP + VREFBUF reset
   type RCC_APB2RSTR_SYSCFGRST_Field is
     (--  No effect
      B_0x0,
      --  Reset SYSCFG + COMP + OPAMP + VREFBUF
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_SYSCFGRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM1 timer reset Set and cleared by software.
   type RCC_APB2RSTR_TIM1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM1 timer
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_TIM1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI1 reset Set and cleared by software.
   type RCC_APB2RSTR_SPI1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset SPI1
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_SPI1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM8 timer reset Set and cleared by software.
   type RCC_APB2RSTR_TIM8RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM8 timer
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_TIM8RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USART1 reset Set and cleared by software.
   type RCC_APB2RSTR_USART1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset USART1
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_USART1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI4 reset Set and cleared by software.
   type RCC_APB2RSTR_SPI4RST_Field is
     (--  No effect
      B_0x0,
      --  Reset SPI4
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_SPI4RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM15 timer reset Set and cleared by software.
   type RCC_APB2RSTR_TIM15RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM15 timer
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_TIM15RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM16 timer reset Set and cleared by software.
   type RCC_APB2RSTR_TIM16RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM16 timer
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_TIM16RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM17 timer reset Set and cleared by software.
   type RCC_APB2RSTR_TIM17RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM17 timer
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_TIM17RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM20 reset Set and cleared by software.
   type RCC_APB2RSTR_TIM20RST_Field is
     (--  No effect
      B_0x0,
      --  Reset TIM20
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_TIM20RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Serial audio interface 1 (SAI1) reset Set and cleared by software.
   type RCC_APB2RSTR_SAI1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset SAI1
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_SAI1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HRTIM1 reset Set and cleared by software.
   type RCC_APB2RSTR_HRTIM1RST_Field is
     (--  No effect
      B_0x0,
      --  Reset HRTIM1
      B_0x1)
     with Size => 1;
   for RCC_APB2RSTR_HRTIM1RST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  APB2 peripheral reset register
   type RCC_APB2RSTR_Register is record
      --  SYSCFG + COMP + OPAMP + VREFBUF reset
      SYSCFGRST      : RCC_APB2RSTR_SYSCFGRST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_1_10  : Interfaces.STM32.UInt10 := 16#0#;
      --  TIM1 timer reset Set and cleared by software.
      TIM1RST        : RCC_APB2RSTR_TIM1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  SPI1 reset Set and cleared by software.
      SPI1RST        : RCC_APB2RSTR_SPI1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM8 timer reset Set and cleared by software.
      TIM8RST        : RCC_APB2RSTR_TIM8RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  USART1 reset Set and cleared by software.
      USART1RST      : RCC_APB2RSTR_USART1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  SPI4 reset Set and cleared by software.
      SPI4RST        : RCC_APB2RSTR_SPI4RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM15 timer reset Set and cleared by software.
      TIM15RST       : RCC_APB2RSTR_TIM15RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM16 timer reset Set and cleared by software.
      TIM16RST       : RCC_APB2RSTR_TIM16RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM17 timer reset Set and cleared by software.
      TIM17RST       : RCC_APB2RSTR_TIM17RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  TIM20 reset Set and cleared by software.
      TIM20RST       : RCC_APB2RSTR_TIM20RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  Serial audio interface 1 (SAI1) reset Set and cleared by software.
      SAI1RST        : RCC_APB2RSTR_SAI1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_22_25 : Interfaces.STM32.UInt4 := 16#0#;
      --  HRTIM1 reset Set and cleared by software.
      HRTIM1RST      : RCC_APB2RSTR_HRTIM1RST_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_27_31 : Interfaces.STM32.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_APB2RSTR_Register use record
      SYSCFGRST      at 0 range 0 .. 0;
      Reserved_1_10  at 0 range 1 .. 10;
      TIM1RST        at 0 range 11 .. 11;
      SPI1RST        at 0 range 12 .. 12;
      TIM8RST        at 0 range 13 .. 13;
      USART1RST      at 0 range 14 .. 14;
      SPI4RST        at 0 range 15 .. 15;
      TIM15RST       at 0 range 16 .. 16;
      TIM16RST       at 0 range 17 .. 17;
      TIM17RST       at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      TIM20RST       at 0 range 20 .. 20;
      SAI1RST        at 0 range 21 .. 21;
      Reserved_22_25 at 0 range 22 .. 25;
      HRTIM1RST      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  DMA1 clock enable Set and cleared by software.
   type RCC_AHB1ENR_DMA1EN_Field is
     (--  DMA1 clock disable
      B_0x0,
      --  DMA1 clock enable
      B_0x1)
     with Size => 1;
   for RCC_AHB1ENR_DMA1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DMA2 clock enable Set and cleared by software.
   type RCC_AHB1ENR_DMA2EN_Field is
     (--  DMA2 clock disable
      B_0x0,
      --  DMA2 clock enable
      B_0x1)
     with Size => 1;
   for RCC_AHB1ENR_DMA2EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DMAMUX1 clock enable Set and reset by software.
   type RCC_AHB1ENR_DMAMUX1EN_Field is
     (--  DMAMUX1 clock disabled
      B_0x0,
      --  DMAMUX1 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB1ENR_DMAMUX1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CORDIC clock enable Set and reset by software.
   type RCC_AHB1ENR_CORDICEN_Field is
     (--  CORDIC clock disabled
      B_0x0,
      --  CORDIC clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB1ENR_CORDICEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FMAC enable Set and reset by software.
   type RCC_AHB1ENR_FMACEN_Field is
     (--  FMAC clock disabled
      B_0x0,
      --  FMAC clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB1ENR_FMACEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Flash memory interface clock enable Set and cleared by software. This
   --  bit can be disabled only when the Flash is in power down mode.
   type RCC_AHB1ENR_FLASHEN_Field is
     (--  Flash memory interface clock disable
      B_0x0,
      --  Flash memory interface clock enable
      B_0x1)
     with Size => 1;
   for RCC_AHB1ENR_FLASHEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CRC clock enable Set and cleared by software.
   type RCC_AHB1ENR_CRCEN_Field is
     (--  CRC clock disable
      B_0x0,
      --  CRC clock enable
      B_0x1)
     with Size => 1;
   for RCC_AHB1ENR_CRCEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AHB1 peripheral clock enable register
   type RCC_AHB1ENR_Register is record
      --  DMA1 clock enable Set and cleared by software.
      DMA1EN         : RCC_AHB1ENR_DMA1EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  DMA2 clock enable Set and cleared by software.
      DMA2EN         : RCC_AHB1ENR_DMA2EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  DMAMUX1 clock enable Set and reset by software.
      DMAMUX1EN      : RCC_AHB1ENR_DMAMUX1EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  CORDIC clock enable Set and reset by software.
      CORDICEN       : RCC_AHB1ENR_CORDICEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  FMAC enable Set and reset by software.
      FMACEN         : RCC_AHB1ENR_FMACEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_5_7   : Interfaces.STM32.UInt3 := 16#0#;
      --  Flash memory interface clock enable Set and cleared by software. This
      --  bit can be disabled only when the Flash is in power down mode.
      FLASHEN        : RCC_AHB1ENR_FLASHEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_9_11  : Interfaces.STM32.UInt3 := 16#0#;
      --  CRC clock enable Set and cleared by software.
      CRCEN          : RCC_AHB1ENR_CRCEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_13_31 : Interfaces.STM32.UInt19 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_AHB1ENR_Register use record
      DMA1EN         at 0 range 0 .. 0;
      DMA2EN         at 0 range 1 .. 1;
      DMAMUX1EN      at 0 range 2 .. 2;
      CORDICEN       at 0 range 3 .. 3;
      FMACEN         at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      FLASHEN        at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      CRCEN          at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  IO port A clock enable Set and cleared by software.
   type RCC_AHB2ENR_GPIOAEN_Field is
     (--  IO port A clock disabled
      B_0x0,
      --  IO port A clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_GPIOAEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port B clock enable Set and cleared by software.
   type RCC_AHB2ENR_GPIOBEN_Field is
     (--  IO port B clock disabled
      B_0x0,
      --  IO port B clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_GPIOBEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port C clock enable Set and cleared by software.
   type RCC_AHB2ENR_GPIOCEN_Field is
     (--  IO port C clock disabled
      B_0x0,
      --  IO port C clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_GPIOCEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port D clock enable Set and cleared by software.
   type RCC_AHB2ENR_GPIODEN_Field is
     (--  IO port D clock disabled
      B_0x0,
      --  IO port D clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_GPIODEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port E clock enable Set and cleared by software.
   type RCC_AHB2ENR_GPIOEEN_Field is
     (--  IO port E clock disabled
      B_0x0,
      --  IO port E clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_GPIOEEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port F clock enable Set and cleared by software.
   type RCC_AHB2ENR_GPIOFEN_Field is
     (--  IO port F clock disabled
      B_0x0,
      --  IO port F clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_GPIOFEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port G clock enable Set and cleared by software.
   type RCC_AHB2ENR_GPIOGEN_Field is
     (--  IO port G clock disabled
      B_0x0,
      --  IO port G clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_GPIOGEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  ADC12 clock enable Set and cleared by software.
   type RCC_AHB2ENR_ADC12EN_Field is
     (--  ADC12 clock disabled
      B_0x0,
      --  ADC12 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_ADC12EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  ADC345 clock enable Set and cleared by software
   type RCC_AHB2ENR_ADC345EN_Field is
     (--  ADC345 clock disabled
      B_0x0,
      --  ADC345 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_ADC345EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC1 clock enable Set and cleared by software.
   type RCC_AHB2ENR_DAC1EN_Field is
     (--  DAC1 clock disabled
      B_0x0,
      --  DAC1 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_DAC1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC2 clock enable Set and cleared by software.
   type RCC_AHB2ENR_DAC2EN_Field is
     (--  DAC2 clock disabled
      B_0x0,
      --  DAC2 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_DAC2EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC3 clock enable Set and cleared by software.
   type RCC_AHB2ENR_DAC3EN_Field is
     (--  DAC3 clock disabled
      B_0x0,
      --  DAC3 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_DAC3EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC4 clock enable Set and cleared by software.
   type RCC_AHB2ENR_DAC4EN_Field is
     (--  DAC4 clock disabled
      B_0x0,
      --  DAC4 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_DAC4EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AES clock enable Set and cleared by software.
   type RCC_AHB2ENR_AESEN_Field is
     (--  AES clock disabled
      B_0x0,
      --  AES clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_AESEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  RNG enable Set and cleared by software.
   type RCC_AHB2ENR_RNGEN_Field is
     (--  RNG disabled
      B_0x0,
      --  RNG enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2ENR_RNGEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AHB2 peripheral clock enable register
   type RCC_AHB2ENR_Register is record
      --  IO port A clock enable Set and cleared by software.
      GPIOAEN        : RCC_AHB2ENR_GPIOAEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port B clock enable Set and cleared by software.
      GPIOBEN        : RCC_AHB2ENR_GPIOBEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port C clock enable Set and cleared by software.
      GPIOCEN        : RCC_AHB2ENR_GPIOCEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port D clock enable Set and cleared by software.
      GPIODEN        : RCC_AHB2ENR_GPIODEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port E clock enable Set and cleared by software.
      GPIOEEN        : RCC_AHB2ENR_GPIOEEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port F clock enable Set and cleared by software.
      GPIOFEN        : RCC_AHB2ENR_GPIOFEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  IO port G clock enable Set and cleared by software.
      GPIOGEN        : RCC_AHB2ENR_GPIOGEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_7_12  : Interfaces.STM32.UInt6 := 16#0#;
      --  ADC12 clock enable Set and cleared by software.
      ADC12EN        : RCC_AHB2ENR_ADC12EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  ADC345 clock enable Set and cleared by software
      ADC345EN       : RCC_AHB2ENR_ADC345EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  DAC1 clock enable Set and cleared by software.
      DAC1EN         : RCC_AHB2ENR_DAC1EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  DAC2 clock enable Set and cleared by software.
      DAC2EN         : RCC_AHB2ENR_DAC2EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  DAC3 clock enable Set and cleared by software.
      DAC3EN         : RCC_AHB2ENR_DAC3EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  DAC4 clock enable Set and cleared by software.
      DAC4EN         : RCC_AHB2ENR_DAC4EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_20_23 : Interfaces.STM32.UInt4 := 16#0#;
      --  AES clock enable Set and cleared by software.
      AESEN          : RCC_AHB2ENR_AESEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_25_25 : Interfaces.STM32.Bit := 16#0#;
      --  RNG enable Set and cleared by software.
      RNGEN          : RCC_AHB2ENR_RNGEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_27_31 : Interfaces.STM32.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_AHB2ENR_Register use record
      GPIOAEN        at 0 range 0 .. 0;
      GPIOBEN        at 0 range 1 .. 1;
      GPIOCEN        at 0 range 2 .. 2;
      GPIODEN        at 0 range 3 .. 3;
      GPIOEEN        at 0 range 4 .. 4;
      GPIOFEN        at 0 range 5 .. 5;
      GPIOGEN        at 0 range 6 .. 6;
      Reserved_7_12  at 0 range 7 .. 12;
      ADC12EN        at 0 range 13 .. 13;
      ADC345EN       at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      DAC1EN         at 0 range 16 .. 16;
      DAC2EN         at 0 range 17 .. 17;
      DAC3EN         at 0 range 18 .. 18;
      DAC4EN         at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      AESEN          at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      RNGEN          at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  Flexible static memory controller clock enable Set and cleared by
   --  software.
   type RCC_AHB3ENR_FMCEN_Field is
     (--  FSMC clock disable
      B_0x0,
      --  FSMC clock enable
      B_0x1)
     with Size => 1;
   for RCC_AHB3ENR_FMCEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  QUADSPI memory interface clock enable Set and cleared by software.
   type RCC_AHB3ENR_QSPIEN_Field is
     (--  QUADSPI clock disable
      B_0x0,
      --  QUADSPI clock enable
      B_0x1)
     with Size => 1;
   for RCC_AHB3ENR_QSPIEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AHB3 peripheral clock enable register
   type RCC_AHB3ENR_Register is record
      --  Flexible static memory controller clock enable Set and cleared by
      --  software.
      FMCEN         : RCC_AHB3ENR_FMCEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_1_7  : Interfaces.STM32.UInt7 := 16#0#;
      --  QUADSPI memory interface clock enable Set and cleared by software.
      QSPIEN        : RCC_AHB3ENR_QSPIEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_AHB3ENR_Register use record
      FMCEN         at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      QSPIEN        at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  TIM2 timer clock enable Set and cleared by software.
   type RCC_APB1ENR1_TIM2EN_Field is
     (--  TIM2 clock disabled
      B_0x0,
      --  TIM2 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_TIM2EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM3 timer clock enable Set and cleared by software.
   type RCC_APB1ENR1_TIM3EN_Field is
     (--  TIM3 clock disabled
      B_0x0,
      --  TIM3 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_TIM3EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM4 timer clock enable Set and cleared by software.
   type RCC_APB1ENR1_TIM4EN_Field is
     (--  TIM4 clock disabled
      B_0x0,
      --  TIM4 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_TIM4EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM5 timer clock enable Set and cleared by software.
   type RCC_APB1ENR1_TIM5EN_Field is
     (--  TIM5 clock disabled
      B_0x0,
      --  TIM5 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_TIM5EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM6 timer clock enable Set and cleared by software.
   type RCC_APB1ENR1_TIM6EN_Field is
     (--  TIM6 clock disabled
      B_0x0,
      --  TIM6 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_TIM6EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM7 timer clock enable Set and cleared by software.
   type RCC_APB1ENR1_TIM7EN_Field is
     (--  TIM7 clock disabled
      B_0x0,
      --  TIM7 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_TIM7EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CRS Recovery System clock enable Set and cleared by software.
   type RCC_APB1ENR1_CRSEN_Field is
     (--  CRS clock disabled
      B_0x0,
      --  CRS clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_CRSEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  RTC APB clock enable Set and cleared by software
   type RCC_APB1ENR1_RTCAPBEN_Field is
     (--  RTC APB clock disabled
      B_0x0,
      --  RTC APB clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_RTCAPBEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Window watchdog clock enable Set by software to enable the window
   --  watchdog clock. Reset by hardware system reset. This bit can also be set
   --  by hardware if the WWDG_SW option bit is reset.
   type RCC_APB1ENR1_WWDGEN_Field is
     (--  Window watchdog clock disabled
      B_0x0,
      --  Window watchdog clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_WWDGEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI2 clock enable Set and cleared by software.
   type RCC_APB1ENR1_SPI2EN_Field is
     (--  SPI2 clock disabled
      B_0x0,
      --  SPI2 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_SPI2EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI3 clock enable Set and cleared by software.
   type RCC_APB1ENR1_SPI3EN_Field is
     (--  SPI3 clock disabled
      B_0x0,
      --  SPI3 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_SPI3EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USART2 clock enable Set and cleared by software.
   type RCC_APB1ENR1_USART2EN_Field is
     (--  USART2 clock disabled
      B_0x0,
      --  USART2 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_USART2EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USART3 clock enable Set and cleared by software.
   type RCC_APB1ENR1_USART3EN_Field is
     (--  USART3 clock disabled
      B_0x0,
      --  USART3 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_USART3EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  UART4 clock enable Set and cleared by software.
   type RCC_APB1ENR1_UART4EN_Field is
     (--  UART4 clock disabled
      B_0x0,
      --  UART4 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_UART4EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  UART5 clock enable Set and cleared by software.
   type RCC_APB1ENR1_UART5EN_Field is
     (--  UART5 clock disabled
      B_0x0,
      --  UART5 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_UART5EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C1 clock enable Set and cleared by software.
   type RCC_APB1ENR1_I2C1EN_Field is
     (--  I2C1 clock disabled
      B_0x0,
      --  I2C1 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_I2C1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C2 clock enable Set and cleared by software.
   type RCC_APB1ENR1_I2C2EN_Field is
     (--  I2C2 clock disabled
      B_0x0,
      --  I2C2 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_I2C2EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USB device clock enable Set and cleared by software.
   type RCC_APB1ENR1_USBEN_Field is
     (--  USB device clock disabled
      B_0x0,
      --  USB device clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_USBEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN clock enable Set and cleared by software.
   type RCC_APB1ENR1_FDCANEN_Field is
     (--  FDCAN clock disabled
      B_0x0,
      --  FDCAN clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_FDCANEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Power interface clock enable Set and cleared by software.
   type RCC_APB1ENR1_PWREN_Field is
     (--  Power interface clock disabled
      B_0x0,
      --  Power interface clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_PWREN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C3 clock enable Set and cleared by software.
   type RCC_APB1ENR1_I2C3EN_Field is
     (--  I2C3 clock disabled
      B_0x0,
      --  I2C3 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_I2C3EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Low power timer 1 clock enable Set and cleared by software.
   type RCC_APB1ENR1_LPTIM1EN_Field is
     (--  LPTIM1 clock disabled
      B_0x0,
      --  LPTIM1 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR1_LPTIM1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  APB1 peripheral clock enable register 1
   type RCC_APB1ENR1_Register is record
      --  TIM2 timer clock enable Set and cleared by software.
      TIM2EN         : RCC_APB1ENR1_TIM2EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM3 timer clock enable Set and cleared by software.
      TIM3EN         : RCC_APB1ENR1_TIM3EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM4 timer clock enable Set and cleared by software.
      TIM4EN         : RCC_APB1ENR1_TIM4EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM5 timer clock enable Set and cleared by software.
      TIM5EN         : RCC_APB1ENR1_TIM5EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM6 timer clock enable Set and cleared by software.
      TIM6EN         : RCC_APB1ENR1_TIM6EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM7 timer clock enable Set and cleared by software.
      TIM7EN         : RCC_APB1ENR1_TIM7EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  CRS Recovery System clock enable Set and cleared by software.
      CRSEN          : RCC_APB1ENR1_CRSEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_9_9   : Interfaces.STM32.Bit := 16#0#;
      --  RTC APB clock enable Set and cleared by software
      RTCAPBEN       : RCC_APB1ENR1_RTCAPBEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  Window watchdog clock enable Set by software to enable the window
      --  watchdog clock. Reset by hardware system reset. This bit can also be
      --  set by hardware if the WWDG_SW option bit is reset.
      WWDGEN         : RCC_APB1ENR1_WWDGEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_12_13 : Interfaces.STM32.UInt2 := 16#0#;
      --  SPI2 clock enable Set and cleared by software.
      SPI2EN         : RCC_APB1ENR1_SPI2EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  SPI3 clock enable Set and cleared by software.
      SPI3EN         : RCC_APB1ENR1_SPI3EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_16_16 : Interfaces.STM32.Bit := 16#0#;
      --  USART2 clock enable Set and cleared by software.
      USART2EN       : RCC_APB1ENR1_USART2EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  USART3 clock enable Set and cleared by software.
      USART3EN       : RCC_APB1ENR1_USART3EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  UART4 clock enable Set and cleared by software.
      UART4EN        : RCC_APB1ENR1_UART4EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  UART5 clock enable Set and cleared by software.
      UART5EN        : RCC_APB1ENR1_UART5EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  I2C1 clock enable Set and cleared by software.
      I2C1EN         : RCC_APB1ENR1_I2C1EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  I2C2 clock enable Set and cleared by software.
      I2C2EN         : RCC_APB1ENR1_I2C2EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  USB device clock enable Set and cleared by software.
      USBEN          : RCC_APB1ENR1_USBEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_24_24 : Interfaces.STM32.Bit := 16#0#;
      --  FDCAN clock enable Set and cleared by software.
      FDCANEN        : RCC_APB1ENR1_FDCANEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_26_27 : Interfaces.STM32.UInt2 := 16#0#;
      --  Power interface clock enable Set and cleared by software.
      PWREN          : RCC_APB1ENR1_PWREN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_29_29 : Interfaces.STM32.Bit := 16#0#;
      --  I2C3 clock enable Set and cleared by software.
      I2C3EN         : RCC_APB1ENR1_I2C3EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  Low power timer 1 clock enable Set and cleared by software.
      LPTIM1EN       : RCC_APB1ENR1_LPTIM1EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_APB1ENR1_Register use record
      TIM2EN         at 0 range 0 .. 0;
      TIM3EN         at 0 range 1 .. 1;
      TIM4EN         at 0 range 2 .. 2;
      TIM5EN         at 0 range 3 .. 3;
      TIM6EN         at 0 range 4 .. 4;
      TIM7EN         at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CRSEN          at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      RTCAPBEN       at 0 range 10 .. 10;
      WWDGEN         at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      SPI2EN         at 0 range 14 .. 14;
      SPI3EN         at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      USART2EN       at 0 range 17 .. 17;
      USART3EN       at 0 range 18 .. 18;
      UART4EN        at 0 range 19 .. 19;
      UART5EN        at 0 range 20 .. 20;
      I2C1EN         at 0 range 21 .. 21;
      I2C2EN         at 0 range 22 .. 22;
      USBEN          at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      FDCANEN        at 0 range 25 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      PWREN          at 0 range 28 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      I2C3EN         at 0 range 30 .. 30;
      LPTIM1EN       at 0 range 31 .. 31;
   end record;

   --  Low power UART 1 clock enable Set and cleared by software.
   type RCC_APB1ENR2_LPUART1EN_Field is
     (--  LPUART1 clock disable
      B_0x0,
      --  LPUART1 clock enable
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR2_LPUART1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C4 clock enable Set and cleared by software
   type RCC_APB1ENR2_I2C4EN_Field is
     (--  I2C4 clock disabled
      B_0x0,
      --  I2C4 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR2_I2C4EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  UCPD1 clock enable Set and cleared by software.
   type RCC_APB1ENR2_UCPD1EN_Field is
     (--  UCPD1 clock disable
      B_0x0,
      --  UCPD1 clock enable
      B_0x1)
     with Size => 1;
   for RCC_APB1ENR2_UCPD1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  APB1 peripheral clock enable register 2
   type RCC_APB1ENR2_Register is record
      --  Low power UART 1 clock enable Set and cleared by software.
      LPUART1EN     : RCC_APB1ENR2_LPUART1EN_Field :=
                       Interfaces.STM32.RCC.B_0x0;
      --  I2C4 clock enable Set and cleared by software
      I2C4EN        : RCC_APB1ENR2_I2C4EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_2_7  : Interfaces.STM32.UInt6 := 16#0#;
      --  UCPD1 clock enable Set and cleared by software.
      UCPD1EN       : RCC_APB1ENR2_UCPD1EN_Field :=
                       Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_APB1ENR2_Register use record
      LPUART1EN     at 0 range 0 .. 0;
      I2C4EN        at 0 range 1 .. 1;
      Reserved_2_7  at 0 range 2 .. 7;
      UCPD1EN       at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  SYSCFG + COMP + VREFBUF + OPAMP clock enable Set and cleared by
   --  software.
   type RCC_APB2ENR_SYSCFGEN_Field is
     (--  SYSCFG + COMP + VREFBUF + OPAMP clock disabled
      B_0x0,
      --  SYSCFG + COMP + VREFBUF + OPAMP clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_SYSCFGEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM1 timer clock enable Set and cleared by software.
   type RCC_APB2ENR_TIM1EN_Field is
     (--  TIM1 timer clock disabled
      B_0x0,
      --  TIM1P timer clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_TIM1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI1 clock enable Set and cleared by software.
   type RCC_APB2ENR_SPI1EN_Field is
     (--  SPI1 clock disabled
      B_0x0,
      --  SPI1 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_SPI1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM8 timer clock enable Set and cleared by software.
   type RCC_APB2ENR_TIM8EN_Field is
     (--  TIM8 timer clock disabled
      B_0x0,
      --  TIM8 timer clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_TIM8EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USART1clock enable Set and cleared by software.
   type RCC_APB2ENR_USART1EN_Field is
     (--  USART1clock disabled
      B_0x0,
      --  USART1clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_USART1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI4 clock enable Set and cleared by software.
   type RCC_APB2ENR_SPI4EN_Field is
     (--  SPI4 clock disabled
      B_0x0,
      --  SPI4 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_SPI4EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM15 timer clock enable Set and cleared by software.
   type RCC_APB2ENR_TIM15EN_Field is
     (--  TIM15 timer clock disabled
      B_0x0,
      --  TIM15 timer clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_TIM15EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM16 timer clock enable Set and cleared by software.
   type RCC_APB2ENR_TIM16EN_Field is
     (--  TIM16 timer clock disabled
      B_0x0,
      --  TIM16 timer clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_TIM16EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM17 timer clock enable Set and cleared by software.
   type RCC_APB2ENR_TIM17EN_Field is
     (--  TIM17 timer clock disabled
      B_0x0,
      --  TIM17 timer clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_TIM17EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM20 timer clock enable Set and cleared by software.
   type RCC_APB2ENR_TIM20EN_Field is
     (--  TIM20 clock disabled
      B_0x0,
      --  TIM20 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_TIM20EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SAI1 clock enable Set and cleared by software.
   type RCC_APB2ENR_SAI1EN_Field is
     (--  SAI1 clock disabled
      B_0x0,
      --  SAI1 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_SAI1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HRTIM1 clock enable Set and cleared by software.
   type RCC_APB2ENR_HRTIM1EN_Field is
     (--  HRTIM1 clock disabled
      B_0x0,
      --  HRTIM1 clock enable
      B_0x1)
     with Size => 1;
   for RCC_APB2ENR_HRTIM1EN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  APB2 peripheral clock enable register
   type RCC_APB2ENR_Register is record
      --  SYSCFG + COMP + VREFBUF + OPAMP clock enable Set and cleared by
      --  software.
      SYSCFGEN       : RCC_APB2ENR_SYSCFGEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_1_10  : Interfaces.STM32.UInt10 := 16#0#;
      --  TIM1 timer clock enable Set and cleared by software.
      TIM1EN         : RCC_APB2ENR_TIM1EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  SPI1 clock enable Set and cleared by software.
      SPI1EN         : RCC_APB2ENR_SPI1EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  TIM8 timer clock enable Set and cleared by software.
      TIM8EN         : RCC_APB2ENR_TIM8EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  USART1clock enable Set and cleared by software.
      USART1EN       : RCC_APB2ENR_USART1EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  SPI4 clock enable Set and cleared by software.
      SPI4EN         : RCC_APB2ENR_SPI4EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  TIM15 timer clock enable Set and cleared by software.
      TIM15EN        : RCC_APB2ENR_TIM15EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM16 timer clock enable Set and cleared by software.
      TIM16EN        : RCC_APB2ENR_TIM16EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  TIM17 timer clock enable Set and cleared by software.
      TIM17EN        : RCC_APB2ENR_TIM17EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  TIM20 timer clock enable Set and cleared by software.
      TIM20EN        : RCC_APB2ENR_TIM20EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  SAI1 clock enable Set and cleared by software.
      SAI1EN         : RCC_APB2ENR_SAI1EN_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_22_25 : Interfaces.STM32.UInt4 := 16#0#;
      --  HRTIM1 clock enable Set and cleared by software.
      HRTIM1EN       : RCC_APB2ENR_HRTIM1EN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_27_31 : Interfaces.STM32.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_APB2ENR_Register use record
      SYSCFGEN       at 0 range 0 .. 0;
      Reserved_1_10  at 0 range 1 .. 10;
      TIM1EN         at 0 range 11 .. 11;
      SPI1EN         at 0 range 12 .. 12;
      TIM8EN         at 0 range 13 .. 13;
      USART1EN       at 0 range 14 .. 14;
      SPI4EN         at 0 range 15 .. 15;
      TIM15EN        at 0 range 16 .. 16;
      TIM16EN        at 0 range 17 .. 17;
      TIM17EN        at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      TIM20EN        at 0 range 20 .. 20;
      SAI1EN         at 0 range 21 .. 21;
      Reserved_22_25 at 0 range 22 .. 25;
      HRTIM1EN       at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  DMA1 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB1SMENR_DMA1SMEN_Field is
     (--  DMA1 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  DMA1 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_AHB1SMENR_DMA1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DMA2 clocks enable during Sleep and Stop modes Set and cleared by
   --  software during Sleep mode.
   type RCC_AHB1SMENR_DMA2SMEN_Field is
     (--  DMA2 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  DMA2 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_AHB1SMENR_DMA2SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DMAMUX1 clock enable during Sleep and Stop modes. Set and cleared by
   --  software.
   type RCC_AHB1SMENR_DMAMUX1SMEN_Field is
     (--  DMAMUX1 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  DMAMUX1 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB1SMENR_DMAMUX1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CORDICSM clock enable. Set and cleared by software.
   type RCC_AHB1SMENR_CORDICSMEN_Field is
     (--  CORDICSM clocks disabled.
      B_0x0,
      --  CORDICSM clocks enabled.
      B_0x1)
     with Size => 1;
   for RCC_AHB1SMENR_CORDICSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FMACSM clock enable. Set and cleared by software.
   type RCC_AHB1SMENR_FMACSMEN_Field is
     (--  FMACSM clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  FMACSM clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB1SMENR_FMACSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Flash memory interface clocks enable during Sleep and Stop modes Set and
   --  cleared by software.
   type RCC_AHB1SMENR_FLASHSMEN_Field is
     (--  Flash memory interface clocks disabled by the clock gating<sup>(1)</sup>
--  during Sleep and Stop modes
      B_0x0,
      --  Flash memory interface clocks enabled by the clock gating<sup>(1)</sup>
--  during Sleep and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB1SMENR_FLASHSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SRAM1 interface clocks enable during Sleep and Stop modes Set and
   --  cleared by software.
   type RCC_AHB1SMENR_SRAM1SMEN_Field is
     (--  SRAM1 interface clocks disabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x0,
      --  SRAM1 interface clocks enabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB1SMENR_SRAM1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CRC clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB1SMENR_CRCSMEN_Field is
     (--  CRC clocks disabled by the clock gating during Sleep and Stop modes
      B_0x0,
      --  CRC clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_AHB1SMENR_CRCSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AHB1 peripheral clocks enable in Sleep and Stop modes register
   type RCC_AHB1SMENR_Register is record
      --  DMA1 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      DMA1SMEN       : RCC_AHB1SMENR_DMA1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  DMA2 clocks enable during Sleep and Stop modes Set and cleared by
      --  software during Sleep mode.
      DMA2SMEN       : RCC_AHB1SMENR_DMA2SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  DMAMUX1 clock enable during Sleep and Stop modes. Set and cleared by
      --  software.
      DMAMUX1SMEN    : RCC_AHB1SMENR_DMAMUX1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  CORDICSM clock enable. Set and cleared by software.
      CORDICSMEN     : RCC_AHB1SMENR_CORDICSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  FMACSM clock enable. Set and cleared by software.
      FMACSMEN       : RCC_AHB1SMENR_FMACSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_5_7   : Interfaces.STM32.UInt3 := 16#0#;
      --  Flash memory interface clocks enable during Sleep and Stop modes Set
      --  and cleared by software.
      FLASHSMEN      : RCC_AHB1SMENR_FLASHSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  SRAM1 interface clocks enable during Sleep and Stop modes Set and
      --  cleared by software.
      SRAM1SMEN      : RCC_AHB1SMENR_SRAM1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_10_11 : Interfaces.STM32.UInt2 := 16#0#;
      --  CRC clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      CRCSMEN        : RCC_AHB1SMENR_CRCSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_13_31 : Interfaces.STM32.UInt19 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_AHB1SMENR_Register use record
      DMA1SMEN       at 0 range 0 .. 0;
      DMA2SMEN       at 0 range 1 .. 1;
      DMAMUX1SMEN    at 0 range 2 .. 2;
      CORDICSMEN     at 0 range 3 .. 3;
      FMACSMEN       at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      FLASHSMEN      at 0 range 8 .. 8;
      SRAM1SMEN      at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      CRCSMEN        at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  IO port A clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB2SMENR_GPIOASMEN_Field is
     (--  IO port A clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  IO port A clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_GPIOASMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port B clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB2SMENR_GPIOBSMEN_Field is
     (--  IO port B clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  IO port B clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_GPIOBSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port C clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB2SMENR_GPIOCSMEN_Field is
     (--  IO port C clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  IO port C clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_GPIOCSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port D clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB2SMENR_GPIODSMEN_Field is
     (--  IO port D clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  IO port D clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_GPIODSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port E clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB2SMENR_GPIOESMEN_Field is
     (--  IO port E clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  IO port E clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_GPIOESMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port F clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB2SMENR_GPIOFSMEN_Field is
     (--  IO port F clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  IO port F clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_GPIOFSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  IO port G clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB2SMENR_GPIOGSMEN_Field is
     (--  IO port G clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  IO port G clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_GPIOGSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CCM SRAM interface clocks enable during Sleep and Stop modes Set and
   --  cleared by software.
   type RCC_AHB2SMENR_CCMSRAMSMEN_Field is
     (--  CCM SRAM interface clocks disabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x0,
      --  CCM SRAM interface clocks enabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_CCMSRAMSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SRAM2 interface clocks enable during Sleep and Stop modes Set and
   --  cleared by software.
   type RCC_AHB2SMENR_SRAM2SMEN_Field is
     (--  SRAM2 interface clocks disabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x0,
      --  SRAM2 interface clocks enabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_SRAM2SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  ADC12 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_AHB2SMENR_ADC12SMEN_Field is
     (--  ADC12 clocks disabled by the clock gating during Sleep and Stop modes
      B_0x0,
      --  ADC12 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_ADC12SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  ADC345 clock enable Set and cleared by software.
   type RCC_AHB2SMENR_ADC345SMEN_Field is
     (--  ADC345 clock disabled
      B_0x0,
      --  ADC345 clock enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_ADC345SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC1 clock enable Set and cleared by software.
   type RCC_AHB2SMENR_DAC1SMEN_Field is
     (--  DAC1 clock disabled
      B_0x0,
      --  DAC1 clock enabled during sleep and stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_DAC1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC2 clock enable Set and cleared by software.
   type RCC_AHB2SMENR_DAC2SMEN_Field is
     (--  DAC2 clock disabled
      B_0x0,
      --  DAC2 clock enabled during sleep and stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_DAC2SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC3 clock enable Set and cleared by software.
   type RCC_AHB2SMENR_DAC3SMEN_Field is
     (--  DAC3 clock disabled
      B_0x0,
      --  DAC3 clock enabled during sleep and stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_DAC3SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  DAC4 clock enable Set and cleared by software.
   type RCC_AHB2SMENR_DAC4SMEN_Field is
     (--  DAC4 clock disabled
      B_0x0,
      --  DAC4 clock enabled during sleep and stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_DAC4SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AESM clocks enable Set and cleared by software.
   type RCC_AHB2SMENR_AESSMEN_Field is
     (--  AESM clocks disabled
      B_0x0,
      --  AESM clocks enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_AESSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  RNG enable Set and cleared by software.
   type RCC_AHB2SMENR_RNGEN_Field is
     (--  RNG disabled
      B_0x0,
      --  RNG enabled
      B_0x1)
     with Size => 1;
   for RCC_AHB2SMENR_RNGEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AHB2 peripheral clocks enable in Sleep and Stop modes register
   type RCC_AHB2SMENR_Register is record
      --  IO port A clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      GPIOASMEN      : RCC_AHB2SMENR_GPIOASMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  IO port B clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      GPIOBSMEN      : RCC_AHB2SMENR_GPIOBSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  IO port C clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      GPIOCSMEN      : RCC_AHB2SMENR_GPIOCSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  IO port D clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      GPIODSMEN      : RCC_AHB2SMENR_GPIODSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  IO port E clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      GPIOESMEN      : RCC_AHB2SMENR_GPIOESMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  IO port F clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      GPIOFSMEN      : RCC_AHB2SMENR_GPIOFSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  IO port G clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      GPIOGSMEN      : RCC_AHB2SMENR_GPIOGSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_7_8   : Interfaces.STM32.UInt2 := 16#0#;
      --  CCM SRAM interface clocks enable during Sleep and Stop modes Set and
      --  cleared by software.
      CCMSRAMSMEN    : RCC_AHB2SMENR_CCMSRAMSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  SRAM2 interface clocks enable during Sleep and Stop modes Set and
      --  cleared by software.
      SRAM2SMEN      : RCC_AHB2SMENR_SRAM2SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_11_12 : Interfaces.STM32.UInt2 := 16#0#;
      --  ADC12 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      ADC12SMEN      : RCC_AHB2SMENR_ADC12SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  ADC345 clock enable Set and cleared by software.
      ADC345SMEN     : RCC_AHB2SMENR_ADC345SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  DAC1 clock enable Set and cleared by software.
      DAC1SMEN       : RCC_AHB2SMENR_DAC1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  DAC2 clock enable Set and cleared by software.
      DAC2SMEN       : RCC_AHB2SMENR_DAC2SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  DAC3 clock enable Set and cleared by software.
      DAC3SMEN       : RCC_AHB2SMENR_DAC3SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  DAC4 clock enable Set and cleared by software.
      DAC4SMEN       : RCC_AHB2SMENR_DAC4SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_20_23 : Interfaces.STM32.UInt4 := 16#0#;
      --  AESM clocks enable Set and cleared by software.
      AESSMEN        : RCC_AHB2SMENR_AESSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_25_25 : Interfaces.STM32.Bit := 16#0#;
      --  RNG enable Set and cleared by software.
      RNGEN          : RCC_AHB2SMENR_RNGEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_27_31 : Interfaces.STM32.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_AHB2SMENR_Register use record
      GPIOASMEN      at 0 range 0 .. 0;
      GPIOBSMEN      at 0 range 1 .. 1;
      GPIOCSMEN      at 0 range 2 .. 2;
      GPIODSMEN      at 0 range 3 .. 3;
      GPIOESMEN      at 0 range 4 .. 4;
      GPIOFSMEN      at 0 range 5 .. 5;
      GPIOGSMEN      at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      CCMSRAMSMEN    at 0 range 9 .. 9;
      SRAM2SMEN      at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      ADC12SMEN      at 0 range 13 .. 13;
      ADC345SMEN     at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      DAC1SMEN       at 0 range 16 .. 16;
      DAC2SMEN       at 0 range 17 .. 17;
      DAC3SMEN       at 0 range 18 .. 18;
      DAC4SMEN       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      AESSMEN        at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      RNGEN          at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  Flexible static memory controller clocks enable during Sleep and Stop
   --  modes Set and cleared by software.
   type RCC_AHB3SMENR_FMCSMEN_Field is
     (--  FSMC clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  FSMC clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_AHB3SMENR_FMCSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  QUADSPI memory interface clock enable during Sleep and Stop modes Set
   --  and cleared by software.
   type RCC_AHB3SMENR_QSPISMEN_Field is
     (--  QUADSPI clock disabled by the clock gating during Sleep and Stop modes
      B_0x0,
      --  QUADSPI clock enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_AHB3SMENR_QSPISMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  AHB3 peripheral clocks enable in Sleep and Stop modes register
   type RCC_AHB3SMENR_Register is record
      --  Flexible static memory controller clocks enable during Sleep and Stop
      --  modes Set and cleared by software.
      FMCSMEN       : RCC_AHB3SMENR_FMCSMEN_Field :=
                       Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_1_7  : Interfaces.STM32.UInt7 := 16#0#;
      --  QUADSPI memory interface clock enable during Sleep and Stop modes Set
      --  and cleared by software.
      QSPISMEN      : RCC_AHB3SMENR_QSPISMEN_Field :=
                       Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_AHB3SMENR_Register use record
      FMCSMEN       at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      QSPISMEN      at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  TIM2 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_TIM2SMEN_Field is
     (--  TIM2 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  TIM2 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_TIM2SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM3 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_TIM3SMEN_Field is
     (--  TIM3 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  TIM3 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_TIM3SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM4 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_TIM4SMEN_Field is
     (--  TIM4 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  TIM4 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_TIM4SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM5 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_TIM5SMEN_Field is
     (--  TIM5 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  TIM5 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_TIM5SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM6 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_TIM6SMEN_Field is
     (--  TIM6 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  TIM6 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_TIM6SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM7 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_TIM7SMEN_Field is
     (--  TIM7 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  TIM7 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_TIM7SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CRS timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_CRSSMEN_Field is
     (--  CRS clocks disabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x0,
      --  CRS clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_CRSSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  RTC APB clock enable during Sleep and Stop modes Set and cleared by
   --  software
   type RCC_APB1SMENR1_RTCAPBSMEN_Field is
     (--  RTC APB clock disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  RTC APB clock enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_RTCAPBSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Window watchdog clocks enable during Sleep and Stop modes Set and
   --  cleared by software. This bit is forced to 1 by hardware when the
   --  hardware WWDG option is activated.
   type RCC_APB1SMENR1_WWDGSMEN_Field is
     (--  Window watchdog clocks disabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x0,
      --  Window watchdog clocks enabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_WWDGSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI2 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_SPI2SMEN_Field is
     (--  SPI2 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  SPI2 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_SPI2SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI3 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_SPI3SMEN_Field is
     (--  SPI3 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  SPI3 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_SPI3SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USART2 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_USART2SMEN_Field is
     (--  USART2 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  USART2 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_USART2SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USART3 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_USART3SMEN_Field is
     (--  USART3 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  USART3 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_USART3SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  UART4 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_UART4SMEN_Field is
     (--  UART4 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  UART4 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_UART4SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  UART5 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_UART5SMEN_Field is
     (--  UART5 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  UART5 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_UART5SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C1 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_I2C1SMEN_Field is
     (--  I2C1 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  I2C1 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_I2C1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C2 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_I2C2SMEN_Field is
     (--  I2C2 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  I2C2 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_I2C2SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USB device clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_USBSMEN_Field is
     (--  USB device clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  USB device clocks enabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_USBSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  FDCAN clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_FDCANSMEN_Field is
     (--  FDCAN clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  FDCAN clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_FDCANSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Power interface clocks enable during Sleep and Stop modes Set and
   --  cleared by software.
   type RCC_APB1SMENR1_PWRSMEN_Field is
     (--  Power interface clocks disabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x0,
      --  Power interface clocks enabled by the clock gating<sup>(1)</sup> during
--  Sleep and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_PWRSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C3 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR1_I2C3SMEN_Field is
     (--  I2C3 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  I2C3 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_I2C3SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Low power timer 1 clocks enable during Sleep and Stop modes Set and
   --  cleared by software.
   type RCC_APB1SMENR1_LPTIM1SMEN_Field is
     (--  LPTIM1 clocks disabled by the clock gating during Sleep and Stop modes
      B_0x0,
      --  LPTIM1 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR1_LPTIM1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  APB1 peripheral clocks enable in Sleep and Stop modes register 1
   type RCC_APB1SMENR1_Register is record
      --  TIM2 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM2SMEN       : RCC_APB1SMENR1_TIM2SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  TIM3 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM3SMEN       : RCC_APB1SMENR1_TIM3SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  TIM4 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM4SMEN       : RCC_APB1SMENR1_TIM4SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  TIM5 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM5SMEN       : RCC_APB1SMENR1_TIM5SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  TIM6 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM6SMEN       : RCC_APB1SMENR1_TIM6SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  TIM7 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM7SMEN       : RCC_APB1SMENR1_TIM7SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  CRS timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      CRSSMEN        : RCC_APB1SMENR1_CRSSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_9_9   : Interfaces.STM32.Bit := 16#0#;
      --  RTC APB clock enable during Sleep and Stop modes Set and cleared by
      --  software
      RTCAPBSMEN     : RCC_APB1SMENR1_RTCAPBSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  Window watchdog clocks enable during Sleep and Stop modes Set and
      --  cleared by software. This bit is forced to 1 by hardware when the
      --  hardware WWDG option is activated.
      WWDGSMEN       : RCC_APB1SMENR1_WWDGSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_12_13 : Interfaces.STM32.UInt2 := 16#0#;
      --  SPI2 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      SPI2SMEN       : RCC_APB1SMENR1_SPI2SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  SPI3 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      SPI3SMEN       : RCC_APB1SMENR1_SPI3SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_16_16 : Interfaces.STM32.Bit := 16#0#;
      --  USART2 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      USART2SMEN     : RCC_APB1SMENR1_USART2SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  USART3 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      USART3SMEN     : RCC_APB1SMENR1_USART3SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  UART4 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      UART4SMEN      : RCC_APB1SMENR1_UART4SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  UART5 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      UART5SMEN      : RCC_APB1SMENR1_UART5SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  I2C1 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      I2C1SMEN       : RCC_APB1SMENR1_I2C1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  I2C2 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      I2C2SMEN       : RCC_APB1SMENR1_I2C2SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  USB device clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      USBSMEN        : RCC_APB1SMENR1_USBSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_24_24 : Interfaces.STM32.Bit := 16#0#;
      --  FDCAN clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      FDCANSMEN      : RCC_APB1SMENR1_FDCANSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_26_27 : Interfaces.STM32.UInt2 := 16#0#;
      --  Power interface clocks enable during Sleep and Stop modes Set and
      --  cleared by software.
      PWRSMEN        : RCC_APB1SMENR1_PWRSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_29_29 : Interfaces.STM32.Bit := 16#0#;
      --  I2C3 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      I2C3SMEN       : RCC_APB1SMENR1_I2C3SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  Low power timer 1 clocks enable during Sleep and Stop modes Set and
      --  cleared by software.
      LPTIM1SMEN     : RCC_APB1SMENR1_LPTIM1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_APB1SMENR1_Register use record
      TIM2SMEN       at 0 range 0 .. 0;
      TIM3SMEN       at 0 range 1 .. 1;
      TIM4SMEN       at 0 range 2 .. 2;
      TIM5SMEN       at 0 range 3 .. 3;
      TIM6SMEN       at 0 range 4 .. 4;
      TIM7SMEN       at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CRSSMEN        at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      RTCAPBSMEN     at 0 range 10 .. 10;
      WWDGSMEN       at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      SPI2SMEN       at 0 range 14 .. 14;
      SPI3SMEN       at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      USART2SMEN     at 0 range 17 .. 17;
      USART3SMEN     at 0 range 18 .. 18;
      UART4SMEN      at 0 range 19 .. 19;
      UART5SMEN      at 0 range 20 .. 20;
      I2C1SMEN       at 0 range 21 .. 21;
      I2C2SMEN       at 0 range 22 .. 22;
      USBSMEN        at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      FDCANSMEN      at 0 range 25 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      PWRSMEN        at 0 range 28 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      I2C3SMEN       at 0 range 30 .. 30;
      LPTIM1SMEN     at 0 range 31 .. 31;
   end record;

   --  Low power UART 1 clocks enable during Sleep and Stop modes Set and
   --  cleared by software.
   type RCC_APB1SMENR2_LPUART1SMEN_Field is
     (--  LPUART1 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  LPUART1 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR2_LPUART1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  I2C4 clocks enable during Sleep and Stop modes Set and cleared by
   --  software
   type RCC_APB1SMENR2_I2C4SMEN_Field is
     (--  I2C4 clocks disabled by the clock gating during Sleep and Stop modes
      B_0x0,
      --  I2C4 clock enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR2_I2C4SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  UCPD1 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB1SMENR2_UCPD1SMEN_Field is
     (--  UCPD1 clocks disabled by the clock gating during Sleep and Stop modes
      B_0x0,
      --  UCPD1 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB1SMENR2_UCPD1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  APB1 peripheral clocks enable in Sleep and Stop modes register 2
   type RCC_APB1SMENR2_Register is record
      --  Low power UART 1 clocks enable during Sleep and Stop modes Set and
      --  cleared by software.
      LPUART1SMEN   : RCC_APB1SMENR2_LPUART1SMEN_Field :=
                       Interfaces.STM32.RCC.B_0x1;
      --  I2C4 clocks enable during Sleep and Stop modes Set and cleared by
      --  software
      I2C4SMEN      : RCC_APB1SMENR2_I2C4SMEN_Field :=
                       Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_2_7  : Interfaces.STM32.UInt6 := 16#0#;
      --  UCPD1 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      UCPD1SMEN     : RCC_APB1SMENR2_UCPD1SMEN_Field :=
                       Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_APB1SMENR2_Register use record
      LPUART1SMEN   at 0 range 0 .. 0;
      I2C4SMEN      at 0 range 1 .. 1;
      Reserved_2_7  at 0 range 2 .. 7;
      UCPD1SMEN     at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  SYSCFG + COMP + VREFBUF + OPAMP clocks enable during Sleep and Stop
   --  modes Set and cleared by software.
   type RCC_APB2SMENR_SYSCFGSMEN_Field is
     (--  SYSCFG + COMP + VREFBUF + OPAMP clocks disabled by the clock
--  gating<sup>(1)</sup> during Sleep and Stop modes
      B_0x0,
      --  SYSCFG + COMP + VREFBUF + OPAMP clocks enabled by the clock
--  gating<sup>(1)</sup> during Sleep and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_SYSCFGSMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM1 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_TIM1SMEN_Field is
     (--  TIM1 timer clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  TIM1P timer clocks enabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_TIM1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI1 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_SPI1SMEN_Field is
     (--  SPI1 clocks disabled by the clock gating during<sup>(1)</sup> Sleep and
--  Stop modes
      B_0x0,
      --  SPI1 clocks enabled by the clock gating during<sup>(1)</sup> Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_SPI1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM8 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_TIM8SMEN_Field is
     (--  TIM8 timer clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  TIM8 timer clocks enabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_TIM8SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  USART1clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_USART1SMEN_Field is
     (--  USART1clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  USART1clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_USART1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SPI4 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_SPI4SMEN_Field is
     (--  SPI4 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  SPI4 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  mode
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_SPI4SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM15 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_TIM15SMEN_Field is
     (--  TIM15 timer clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  TIM15 timer clocks enabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop mode
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_TIM15SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM16 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_TIM16SMEN_Field is
     (--  TIM16 timer clocks disabled by the clock gating during Sleep and Stop modes
      B_0x0,
      --  TIM16 timer clocks enabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_TIM16SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM17 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_TIM17SMEN_Field is
     (--  TIM17 timer clocks disabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x0,
      --  TIM17 timer clocks enabled by the clock gating<sup>(1)</sup> during Sleep
--  and Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_TIM17SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  TIM20 timer clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_TIM20SMEN_Field is
     (--  TIM20 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  TIM20 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_TIM20SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  SAI1 clocks enable during Sleep and Stop modes Set and cleared by
   --  software.
   type RCC_APB2SMENR_SAI1SMEN_Field is
     (--  SAI1 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  SAI1 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and Stop
--  modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_SAI1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HRTIM1 timer clocks enable during Sleep and Stop modes Set and cleared
   --  by software.
   type RCC_APB2SMENR_HRTIM1SMEN_Field is
     (--  HRTIM1 clocks disabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x0,
      --  HRTIM1 clocks enabled by the clock gating<sup>(1)</sup> during Sleep and
--  Stop modes
      B_0x1)
     with Size => 1;
   for RCC_APB2SMENR_HRTIM1SMEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  APB2 peripheral clocks enable in Sleep and Stop modes register
   type RCC_APB2SMENR_Register is record
      --  SYSCFG + COMP + VREFBUF + OPAMP clocks enable during Sleep and Stop
      --  modes Set and cleared by software.
      SYSCFGSMEN     : RCC_APB2SMENR_SYSCFGSMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_1_10  : Interfaces.STM32.UInt10 := 16#0#;
      --  TIM1 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM1SMEN       : RCC_APB2SMENR_TIM1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  SPI1 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      SPI1SMEN       : RCC_APB2SMENR_SPI1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  TIM8 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM8SMEN       : RCC_APB2SMENR_TIM8SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  USART1clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      USART1SMEN     : RCC_APB2SMENR_USART1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  SPI4 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      SPI4SMEN       : RCC_APB2SMENR_SPI4SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  TIM15 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM15SMEN      : RCC_APB2SMENR_TIM15SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  TIM16 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM16SMEN      : RCC_APB2SMENR_TIM16SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  TIM17 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM17SMEN      : RCC_APB2SMENR_TIM17SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  TIM20 timer clocks enable during Sleep and Stop modes Set and cleared
      --  by software.
      TIM20SMEN      : RCC_APB2SMENR_TIM20SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  SAI1 clocks enable during Sleep and Stop modes Set and cleared by
      --  software.
      SAI1SMEN       : RCC_APB2SMENR_SAI1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_22_25 : Interfaces.STM32.UInt4 := 16#0#;
      --  HRTIM1 timer clocks enable during Sleep and Stop modes Set and
      --  cleared by software.
      HRTIM1SMEN     : RCC_APB2SMENR_HRTIM1SMEN_Field :=
                        Interfaces.STM32.RCC.B_0x1;
      --  unspecified
      Reserved_27_31 : Interfaces.STM32.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_APB2SMENR_Register use record
      SYSCFGSMEN     at 0 range 0 .. 0;
      Reserved_1_10  at 0 range 1 .. 10;
      TIM1SMEN       at 0 range 11 .. 11;
      SPI1SMEN       at 0 range 12 .. 12;
      TIM8SMEN       at 0 range 13 .. 13;
      USART1SMEN     at 0 range 14 .. 14;
      SPI4SMEN       at 0 range 15 .. 15;
      TIM15SMEN      at 0 range 16 .. 16;
      TIM16SMEN      at 0 range 17 .. 17;
      TIM17SMEN      at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      TIM20SMEN      at 0 range 20 .. 20;
      SAI1SMEN       at 0 range 21 .. 21;
      Reserved_22_25 at 0 range 22 .. 25;
      HRTIM1SMEN     at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  USART1 clock source selection This bit is set and cleared by software to
   --  select the USART1 clock source.
   type RCC_CCIPR_USART1SEL_Field is
     (--  PCLK selected as USART1 clock
      B_0x0,
      --  System clock (SYSCLK) selected as USART1 clock
      B_0x1,
      --  HSI16 clock selected as USART1 clock
      B_0x2,
      --  LSE clock selected as USART1 clock
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_USART1SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  USART2 clock source selection This bit is set and cleared by software to
   --  select the USART2 clock source.
   type RCC_CCIPR_USART2SEL_Field is
     (--  PCLK selected as USART2 clock
      B_0x0,
      --  System clock (SYSCLK) selected as USART2 clock
      B_0x1,
      --  HSI16 clock selected as USART2 clock
      B_0x2,
      --  LSE clock selected as USART2 clock
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_USART2SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  USART3 clock source selection This bit is set and cleared by software to
   --  select the USART3 clock source.
   type RCC_CCIPR_USART3SEL_Field is
     (--  PCLK selected as USART3 clock
      B_0x0,
      --  System clock (SYSCLK) selected as USART3 clock
      B_0x1,
      --  HSI16 clock selected as USART3 clock
      B_0x2,
      --  LSE clock selected as USART3 clock
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_USART3SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  UART4 clock source selection This bit is set and cleared by software to
   --  select the UART4 clock source.
   type RCC_CCIPR_UART4SEL_Field is
     (--  PCLK selected as UART4 clock
      B_0x0,
      --  System clock (SYSCLK) selected as UART4 clock
      B_0x1,
      --  HSI16 clock selected as UART4 clock
      B_0x2,
      --  LSE clock selected as UART4 clock
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_UART4SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  UART5 clock source selection These bits are set and cleared by software
   --  to select the UART5 clock source.
   type RCC_CCIPR_UART5SEL_Field is
     (--  PCLK selected as UART5 clock
      B_0x0,
      --  System clock (SYSCLK) selected as UART5 clock
      B_0x1,
      --  HSI16 clock selected as UART5 clock
      B_0x2,
      --  LSE clock selected as UART5 clock
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_UART5SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  LPUART1 clock source selection These bits are set and cleared by
   --  software to select the LPUART1 clock source.
   type RCC_CCIPR_LPUART1SEL_Field is
     (--  PCLK selected as LPUART1 clock
      B_0x0,
      --  System clock (SYSCLK) selected as LPUART1 clock
      B_0x1,
      --  HSI16 clock selected as LPUART1 clock
      B_0x2,
      --  LSE clock selected as LPUART1 clock
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_LPUART1SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  I2C1 clock source selection These bits are set and cleared by software
   --  to select the I2C1 clock source.
   type RCC_CCIPR_I2C1SEL_Field is
     (--  PCLK selected as I2C1 clock
      B_0x0,
      --  System clock (SYSCLK) selected as I2C1 clock
      B_0x1,
      --  HSI16 clock selected as I2C1 clock
      B_0x2)
     with Size => 2;
   for RCC_CCIPR_I2C1SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2);

   --  I2C2 clock source selection These bits are set and cleared by software
   --  to select the I2C2 clock source.
   type RCC_CCIPR_I2C2SEL_Field is
     (--  PCLK selected as I2C2 clock
      B_0x0,
      --  System clock (SYSCLK) selected as I2C2 clock
      B_0x1,
      --  HSI16 clock selected as I2C2 clock
      B_0x2)
     with Size => 2;
   for RCC_CCIPR_I2C2SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2);

   --  I2C3 clock source selection These bits are set and cleared by software
   --  to select the I2C3 clock source.
   type RCC_CCIPR_I2C3SEL_Field is
     (--  PCLK selected as I2C3 clock
      B_0x0,
      --  System clock (SYSCLK) selected as I2C3 clock
      B_0x1,
      --  HSI16 clock selected as I2C3 clock
      B_0x2)
     with Size => 2;
   for RCC_CCIPR_I2C3SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2);

   --  Low power timer 1 clock source selection These bits are set and cleared
   --  by software to select the LPTIM1 clock source.
   type RCC_CCIPR_LPTIM1SEL_Field is
     (--  PCLK selected as LPTIM1 clock
      B_0x0,
      --  LSI clock selected as LPTIM1 clock
      B_0x1,
      --  HSI16 clock selected as LPTIM1 clock
      B_0x2,
      --  LSE clock selected as LPTIM1 clock
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_LPTIM1SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  clock source selection These bits are set and cleared by software to
   --  select the SAI clock source.
   type RCC_CCIPR_SAI1SEL_Field is
     (--  System clock selected as SAI clock
      B_0x0,
      --  PLL Q clock selected as SAI clock
      B_0x1,
      --  Clock provided on I2S_CKIN pin selected as SAI clock
      B_0x2,
      --  HSI16 clock selected as SAI clock
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_SAI1SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  clock source selection These bits are set and cleared by software to
   --  select the I2S23 clock source.
   type RCC_CCIPR_I2S23SEL_Field is
     (--  System clock selected as I2S23 clock
      B_0x0,
      --  PLL Q clock selected as I2S23 clock
      B_0x1,
      --  Clock provided on I2S_CKIN pin is selected as I2S23 clock
      B_0x2,
      --  HSI16 clock selected as I2S23 clock.
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_I2S23SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype RCC_CCIPR_FDCANSEL_Field is Interfaces.STM32.UInt2;

   --  48 MHz clock source selection These bits are set and cleared by software
   --  to select the 48 MHz clock source used by USB device FS and RNG.
   type RCC_CCIPR_CLK48SEL_Field is
     (--  HSI48 clock selected as 48 MHz clock
      B_0x0,
      --  PLL Q clock (PLL48M1CLK) selected as 48 MHz clock
      B_0x2,
      --  Reserved, must be kept at reset value
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_CLK48SEL_Field use
     (B_0x0 => 0,
      B_0x2 => 2,
      B_0x3 => 3);

   --  ADC1/2 clock source selection These bits are set and cleared by software
   --  to select the clock source used by the ADC interface.
   type RCC_CCIPR_ADC12SEL_Field is
     (--  No clock selected
      B_0x0,
      --  PLL P clock selected as ADC1/2 clock
      B_0x1,
      --  System clock selected as ADC1/2 clock
      B_0x2)
     with Size => 2;
   for RCC_CCIPR_ADC12SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2);

   --  ADC3/4/5 clock source selection These bits are set and cleared by
   --  software to select the clock source used by the ADC345 interface.
   type RCC_CCIPR_ADC345SEL_Field is
     (--  No clock selected
      B_0x0,
      --  PLL P clock selected as ADC345 clock
      B_0x1,
      --  System clock selected as ADC3/4/5 clock
      B_0x2,
      --  Reserved.
      B_0x3)
     with Size => 2;
   for RCC_CCIPR_ADC345SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  Peripherals independent clock configuration register
   type RCC_CCIPR_Register is record
      --  USART1 clock source selection This bit is set and cleared by software
      --  to select the USART1 clock source.
      USART1SEL  : RCC_CCIPR_USART1SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  USART2 clock source selection This bit is set and cleared by software
      --  to select the USART2 clock source.
      USART2SEL  : RCC_CCIPR_USART2SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  USART3 clock source selection This bit is set and cleared by software
      --  to select the USART3 clock source.
      USART3SEL  : RCC_CCIPR_USART3SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  UART4 clock source selection This bit is set and cleared by software
      --  to select the UART4 clock source.
      UART4SEL   : RCC_CCIPR_UART4SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  UART5 clock source selection These bits are set and cleared by
      --  software to select the UART5 clock source.
      UART5SEL   : RCC_CCIPR_UART5SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  LPUART1 clock source selection These bits are set and cleared by
      --  software to select the LPUART1 clock source.
      LPUART1SEL : RCC_CCIPR_LPUART1SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  I2C1 clock source selection These bits are set and cleared by
      --  software to select the I2C1 clock source.
      I2C1SEL    : RCC_CCIPR_I2C1SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  I2C2 clock source selection These bits are set and cleared by
      --  software to select the I2C2 clock source.
      I2C2SEL    : RCC_CCIPR_I2C2SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  I2C3 clock source selection These bits are set and cleared by
      --  software to select the I2C3 clock source.
      I2C3SEL    : RCC_CCIPR_I2C3SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  Low power timer 1 clock source selection These bits are set and
      --  cleared by software to select the LPTIM1 clock source.
      LPTIM1SEL  : RCC_CCIPR_LPTIM1SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  clock source selection These bits are set and cleared by software to
      --  select the SAI clock source.
      SAI1SEL    : RCC_CCIPR_SAI1SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  clock source selection These bits are set and cleared by software to
      --  select the I2S23 clock source.
      I2S23SEL   : RCC_CCIPR_I2S23SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  None
      FDCANSEL   : RCC_CCIPR_FDCANSEL_Field := 16#0#;
      --  48 MHz clock source selection These bits are set and cleared by
      --  software to select the 48 MHz clock source used by USB device FS and
      --  RNG.
      CLK48SEL   : RCC_CCIPR_CLK48SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  ADC1/2 clock source selection These bits are set and cleared by
      --  software to select the clock source used by the ADC interface.
      ADC12SEL   : RCC_CCIPR_ADC12SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  ADC3/4/5 clock source selection These bits are set and cleared by
      --  software to select the clock source used by the ADC345 interface.
      ADC345SEL  : RCC_CCIPR_ADC345SEL_Field := Interfaces.STM32.RCC.B_0x0;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_CCIPR_Register use record
      USART1SEL  at 0 range 0 .. 1;
      USART2SEL  at 0 range 2 .. 3;
      USART3SEL  at 0 range 4 .. 5;
      UART4SEL   at 0 range 6 .. 7;
      UART5SEL   at 0 range 8 .. 9;
      LPUART1SEL at 0 range 10 .. 11;
      I2C1SEL    at 0 range 12 .. 13;
      I2C2SEL    at 0 range 14 .. 15;
      I2C3SEL    at 0 range 16 .. 17;
      LPTIM1SEL  at 0 range 18 .. 19;
      SAI1SEL    at 0 range 20 .. 21;
      I2S23SEL   at 0 range 22 .. 23;
      FDCANSEL   at 0 range 24 .. 25;
      CLK48SEL   at 0 range 26 .. 27;
      ADC12SEL   at 0 range 28 .. 29;
      ADC345SEL  at 0 range 30 .. 31;
   end record;

   --  LSE oscillator enable Set and cleared by software.
   type RCC_BDCR_LSEON_Field is
     (--  LSE oscillator OFF
      B_0x0,
      --  LSE oscillator ON
      B_0x1)
     with Size => 1;
   for RCC_BDCR_LSEON_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSE oscillator ready Set and cleared by hardware to indicate when the
   --  external 32 kHz oscillator is stable. After the LSEON bit is cleared,
   --  LSERDY goes low after 6 external low-speed oscillator clock cycles.
   type RCC_BDCR_LSERDY_Field is
     (--  LSE oscillator not ready
      B_0x0,
      --  LSE oscillator ready
      B_0x1)
     with Size => 1;
   for RCC_BDCR_LSERDY_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSE oscillator bypass Set and cleared by software to bypass oscillator
   --  in debug mode. This bit can be written only when the external 32 kHz
   --  oscillator is disabled (LSEON=0 and LSERDY=0).
   type RCC_BDCR_LSEBYP_Field is
     (--  LSE oscillator not bypassed
      B_0x0,
      --  LSE oscillator bypassed
      B_0x1)
     with Size => 1;
   for RCC_BDCR_LSEBYP_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSE oscillator drive capability Set by software to modulate the LSE
   --  oscillators drive capability. The oscillator is in Xtal mode when it is
   --  not in bypass mode.
   type RCC_BDCR_LSEDRV_Field is
     (--  Xtal mode lower driving capability
      B_0x0,
      --  Xtal mode medium low driving capability
      B_0x1,
      --  Xtal mode medium high driving capability
      B_0x2,
      --  Xtal mode higher driving capability
      B_0x3)
     with Size => 2;
   for RCC_BDCR_LSEDRV_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  CSS on LSE enable Set by software to enable the Clock Security System on
   --  LSE (32 kHz oscillator). LSECSSON must be enabled after the LSE
   --  oscillator is enabled (LSEON bit enabled) and ready (LSERDY flag set by
   --  hardware), and after the RTCSEL bit is selected. Once enabled this bit
   --  cannot be disabled, except after a LSE failure detection (LSECSSD =1).
   --  In that case the software MUST disable the LSECSSON bit.
   type RCC_BDCR_LSECSSON_Field is
     (--  CSS on LSE (32 kHz external oscillator) OFF
      B_0x0,
      --  CSS on LSE (32 kHz external oscillator) ON
      B_0x1)
     with Size => 1;
   for RCC_BDCR_LSECSSON_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  CSS on LSE failure Detection Set by hardware to indicate when a failure
   --  has been detected by the Clock Security System on the external 32 kHz
   --  oscillator (LSE).
   type RCC_BDCR_LSECSSD_Field is
     (--  No failure detected on LSE (32 kHz oscillator)
      B_0x0,
      --  Failure detected on LSE (32 kHz oscillator)
      B_0x1)
     with Size => 1;
   for RCC_BDCR_LSECSSD_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  RTC clock source selection Set by software to select the clock source
   --  for the RTC. Once the RTC clock source has been selected, it cannot be
   --  changed anymore unless the RTC domain is reset, or unless a failure is
   --  detected on LSE (LSECSSD is set). The BDRST bit can be used to reset
   --  them.
   type RCC_BDCR_RTCSEL_Field is
     (--  No clock
      B_0x0,
      --  LSE oscillator clock used as RTC clock
      B_0x1,
      --  LSI oscillator clock used as RTC clock
      B_0x2,
      --  HSE oscillator clock divided by 32 used as RTC clock
      B_0x3)
     with Size => 2;
   for RCC_BDCR_RTCSEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  RTC clock enable Set and cleared by software.
   type RCC_BDCR_RTCEN_Field is
     (--  RTC clock disabled
      B_0x0,
      --  RTC clock enabled
      B_0x1)
     with Size => 1;
   for RCC_BDCR_RTCEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  RTC domain software reset Set and cleared by software.
   type RCC_BDCR_BDRST_Field is
     (--  Reset not activated
      B_0x0,
      --  Reset the entire RTC domain
      B_0x1)
     with Size => 1;
   for RCC_BDCR_BDRST_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Low speed clock output enable Set and cleared by software.
   type RCC_BDCR_LSCOEN_Field is
     (--  Low speed clock output (LSCO) disable
      B_0x0,
      --  Low speed clock output (LSCO) enable
      B_0x1)
     with Size => 1;
   for RCC_BDCR_LSCOEN_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Low speed clock output selection Set and cleared by software.
   type RCC_BDCR_LSCOSEL_Field is
     (--  LSI clock selected
      B_0x0,
      --  LSE clock selected
      B_0x1)
     with Size => 1;
   for RCC_BDCR_LSCOSEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  RTC domain control register
   type RCC_BDCR_Register is record
      --  LSE oscillator enable Set and cleared by software.
      LSEON          : RCC_BDCR_LSEON_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. LSE oscillator ready Set and cleared by hardware to
      --  indicate when the external 32 kHz oscillator is stable. After the
      --  LSEON bit is cleared, LSERDY goes low after 6 external low-speed
      --  oscillator clock cycles.
      LSERDY         : RCC_BDCR_LSERDY_Field := Interfaces.STM32.RCC.B_0x0;
      --  LSE oscillator bypass Set and cleared by software to bypass
      --  oscillator in debug mode. This bit can be written only when the
      --  external 32 kHz oscillator is disabled (LSEON=0 and LSERDY=0).
      LSEBYP         : RCC_BDCR_LSEBYP_Field := Interfaces.STM32.RCC.B_0x0;
      --  LSE oscillator drive capability Set by software to modulate the LSE
      --  oscillators drive capability. The oscillator is in Xtal mode when it
      --  is not in bypass mode.
      LSEDRV         : RCC_BDCR_LSEDRV_Field := Interfaces.STM32.RCC.B_0x0;
      --  CSS on LSE enable Set by software to enable the Clock Security System
      --  on LSE (32 kHz oscillator). LSECSSON must be enabled after the LSE
      --  oscillator is enabled (LSEON bit enabled) and ready (LSERDY flag set
      --  by hardware), and after the RTCSEL bit is selected. Once enabled this
      --  bit cannot be disabled, except after a LSE failure detection (LSECSSD
      --  =1). In that case the software MUST disable the LSECSSON bit.
      LSECSSON       : RCC_BDCR_LSECSSON_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. CSS on LSE failure Detection Set by hardware to indicate
      --  when a failure has been detected by the Clock Security System on the
      --  external 32 kHz oscillator (LSE).
      LSECSSD        : RCC_BDCR_LSECSSD_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_7_7   : Interfaces.STM32.Bit := 16#0#;
      --  RTC clock source selection Set by software to select the clock source
      --  for the RTC. Once the RTC clock source has been selected, it cannot
      --  be changed anymore unless the RTC domain is reset, or unless a
      --  failure is detected on LSE (LSECSSD is set). The BDRST bit can be
      --  used to reset them.
      RTCSEL         : RCC_BDCR_RTCSEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_10_14 : Interfaces.STM32.UInt5 := 16#0#;
      --  RTC clock enable Set and cleared by software.
      RTCEN          : RCC_BDCR_RTCEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  RTC domain software reset Set and cleared by software.
      BDRST          : RCC_BDCR_BDRST_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_17_23 : Interfaces.STM32.UInt7 := 16#0#;
      --  Low speed clock output enable Set and cleared by software.
      LSCOEN         : RCC_BDCR_LSCOEN_Field := Interfaces.STM32.RCC.B_0x0;
      --  Low speed clock output selection Set and cleared by software.
      LSCOSEL        : RCC_BDCR_LSCOSEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_26_31 : Interfaces.STM32.UInt6 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_BDCR_Register use record
      LSEON          at 0 range 0 .. 0;
      LSERDY         at 0 range 1 .. 1;
      LSEBYP         at 0 range 2 .. 2;
      LSEDRV         at 0 range 3 .. 4;
      LSECSSON       at 0 range 5 .. 5;
      LSECSSD        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      RTCSEL         at 0 range 8 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      RTCEN          at 0 range 15 .. 15;
      BDRST          at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      LSCOEN         at 0 range 24 .. 24;
      LSCOSEL        at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   --  LSI oscillator enable Set and cleared by software.
   type RCC_CSR_LSION_Field is
     (--  LSI oscillator OFF
      B_0x0,
      --  LSI oscillator ON
      B_0x1)
     with Size => 1;
   for RCC_CSR_LSION_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  LSI oscillator ready Set and cleared by hardware to indicate when the
   --  LSI oscillator is stable. After the LSION bit is cleared, LSIRDY goes
   --  low after 3 LSI oscillator clock cycles. This bit can be set even if
   --  LSION = 0 if the LSI is requested by the Clock Security System on LSE,
   --  by the Independent Watchdog or by the RTC.
   type RCC_CSR_LSIRDY_Field is
     (--  LSI oscillator not ready
      B_0x0,
      --  LSI oscillator ready
      B_0x1)
     with Size => 1;
   for RCC_CSR_LSIRDY_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Remove reset flag Set by software to clear the reset flags.
   type RCC_CSR_RMVF_Field is
     (--  No effect
      B_0x0,
      --  Clear the reset flags
      B_0x1)
     with Size => 1;
   for RCC_CSR_RMVF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Option byte loader reset flag Set by hardware when a reset from the
   --  Option Byte loading occurs. Cleared by writing to the RMVF bit.
   type RCC_CSR_OBLRSTF_Field is
     (--  No reset from Option Byte loading occurred
      B_0x0,
      --  Reset from Option Byte loading occurred
      B_0x1)
     with Size => 1;
   for RCC_CSR_OBLRSTF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Pin reset flag Set by hardware when a reset from the NRST pin occurs.
   --  Cleared by writing to the RMVF bit.
   type RCC_CSR_PINRSTF_Field is
     (--  No reset from NRST pin occurred
      B_0x0,
      --  Reset from NRST pin occurred
      B_0x1)
     with Size => 1;
   for RCC_CSR_PINRSTF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  BOR flag Set by hardware when a BOR occurs. Cleared by writing to the
   --  RMVF bit.
   type RCC_CSR_BORRSTF_Field is
     (--  No BOR occurred
      B_0x0,
      --  BOR occurred
      B_0x1)
     with Size => 1;
   for RCC_CSR_BORRSTF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Software reset flag Set by hardware when a software reset occurs.
   --  Cleared by writing to the RMVF bit.
   type RCC_CSR_SFTRSTF_Field is
     (--  No software reset occurred
      B_0x0,
      --  Software reset occurred
      B_0x1)
     with Size => 1;
   for RCC_CSR_SFTRSTF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Independent window watchdog reset flag Set by hardware when an
   --  independent watchdog reset domain occurs. Cleared by writing to the RMVF
   --  bit.
   type RCC_CSR_IWDGRSTF_Field is
     (--  No independent watchdog reset occurred
      B_0x0,
      --  Independent watchdog reset occurred
      B_0x1)
     with Size => 1;
   for RCC_CSR_IWDGRSTF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Window watchdog reset flag Set by hardware when a window watchdog reset
   --  occurs. Cleared by writing to the RMVF bit.
   type RCC_CSR_WWDGRSTF_Field is
     (--  No window watchdog reset occurred
      B_0x0,
      --  Window watchdog reset occurred
      B_0x1)
     with Size => 1;
   for RCC_CSR_WWDGRSTF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Low-power reset flag Set by hardware when a reset occurs due to illegal
   --  Stop, Standby or Shutdown mode entry. Cleared by writing to the RMVF
   --  bit.
   type RCC_CSR_LPWRRSTF_Field is
     (--  No illegal mode reset occurred
      B_0x0,
      --  Illegal mode reset occurred
      B_0x1)
     with Size => 1;
   for RCC_CSR_LPWRRSTF_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  Control/status register
   type RCC_CSR_Register is record
      --  LSI oscillator enable Set and cleared by software.
      LSION          : RCC_CSR_LSION_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. LSI oscillator ready Set and cleared by hardware to
      --  indicate when the LSI oscillator is stable. After the LSION bit is
      --  cleared, LSIRDY goes low after 3 LSI oscillator clock cycles. This
      --  bit can be set even if LSION = 0 if the LSI is requested by the Clock
      --  Security System on LSE, by the Independent Watchdog or by the RTC.
      LSIRDY         : RCC_CSR_LSIRDY_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_2_22  : Interfaces.STM32.UInt21 := 16#0#;
      --  Remove reset flag Set by software to clear the reset flags.
      RMVF           : RCC_CSR_RMVF_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_24_24 : Interfaces.STM32.Bit := 16#0#;
      --  Read-only. Option byte loader reset flag Set by hardware when a reset
      --  from the Option Byte loading occurs. Cleared by writing to the RMVF
      --  bit.
      OBLRSTF        : RCC_CSR_OBLRSTF_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. Pin reset flag Set by hardware when a reset from the NRST
      --  pin occurs. Cleared by writing to the RMVF bit.
      PINRSTF        : RCC_CSR_PINRSTF_Field := Interfaces.STM32.RCC.B_0x1;
      --  Read-only. BOR flag Set by hardware when a BOR occurs. Cleared by
      --  writing to the RMVF bit.
      BORRSTF        : RCC_CSR_BORRSTF_Field := Interfaces.STM32.RCC.B_0x1;
      --  Read-only. Software reset flag Set by hardware when a software reset
      --  occurs. Cleared by writing to the RMVF bit.
      SFTRSTF        : RCC_CSR_SFTRSTF_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. Independent window watchdog reset flag Set by hardware
      --  when an independent watchdog reset domain occurs. Cleared by writing
      --  to the RMVF bit.
      IWDGRSTF       : RCC_CSR_IWDGRSTF_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. Window watchdog reset flag Set by hardware when a window
      --  watchdog reset occurs. Cleared by writing to the RMVF bit.
      WWDGRSTF       : RCC_CSR_WWDGRSTF_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. Low-power reset flag Set by hardware when a reset occurs
      --  due to illegal Stop, Standby or Shutdown mode entry. Cleared by
      --  writing to the RMVF bit.
      LPWRRSTF       : RCC_CSR_LPWRRSTF_Field := Interfaces.STM32.RCC.B_0x0;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_CSR_Register use record
      LSION          at 0 range 0 .. 0;
      LSIRDY         at 0 range 1 .. 1;
      Reserved_2_22  at 0 range 2 .. 22;
      RMVF           at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      OBLRSTF        at 0 range 25 .. 25;
      PINRSTF        at 0 range 26 .. 26;
      BORRSTF        at 0 range 27 .. 27;
      SFTRSTF        at 0 range 28 .. 28;
      IWDGRSTF       at 0 range 29 .. 29;
      WWDGRSTF       at 0 range 30 .. 30;
      LPWRRSTF       at 0 range 31 .. 31;
   end record;

   --  HSI48 clock enable Set and cleared by software. Cleared by hardware to
   --  stop the HSI48 when entering in Stop, Standby or Shutdown modes.
   type RCC_CRRCR_HSI48ON_Field is
     (--  HSI48 oscillator OFF
      B_0x0,
      --  HSI48 oscillator ON
      B_0x1)
     with Size => 1;
   for RCC_CRRCR_HSI48ON_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   --  HSI48 clock ready flag Set by hardware to indicate that HSI48 oscillator
   --  is stable. This bit is set only when HSI48 is enabled by software by
   --  setting HSI48ON.
   type RCC_CRRCR_HSI48RDY_Field is
     (--  HSI48 oscillator not ready
      B_0x0,
      --  HSI48 oscillator ready
      B_0x1)
     with Size => 1;
   for RCC_CRRCR_HSI48RDY_Field use
     (B_0x0 => 0,
      B_0x1 => 1);

   subtype RCC_CRRCR_HSI48CAL_Field is Interfaces.STM32.UInt9;

   --  Clock recovery RC register
   type RCC_CRRCR_Register is record
      --  HSI48 clock enable Set and cleared by software. Cleared by hardware
      --  to stop the HSI48 when entering in Stop, Standby or Shutdown modes.
      HSI48ON        : RCC_CRRCR_HSI48ON_Field := Interfaces.STM32.RCC.B_0x0;
      --  Read-only. HSI48 clock ready flag Set by hardware to indicate that
      --  HSI48 oscillator is stable. This bit is set only when HSI48 is
      --  enabled by software by setting HSI48ON.
      HSI48RDY       : RCC_CRRCR_HSI48RDY_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_2_6   : Interfaces.STM32.UInt5 := 16#0#;
      --  Read-only. HSI48 clock calibration These bits are initialized at
      --  startup with the factory-programmed HSI48 calibration trim value.
      --  They are ready only.
      HSI48CAL       : RCC_CRRCR_HSI48CAL_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_CRRCR_Register use record
      HSI48ON        at 0 range 0 .. 0;
      HSI48RDY       at 0 range 1 .. 1;
      Reserved_2_6   at 0 range 2 .. 6;
      HSI48CAL       at 0 range 7 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  I2C4 clock source selection These bits are set and cleared by software
   --  to select the I2C4 clock source.
   type RCC_CCIPR2_I2C4SEL_Field is
     (--  PCLK selected as I2C4 clock
      B_0x0,
      --  System clock (SYSCLK) selected as I2C4 clock
      B_0x1,
      --  HSI16 clock selected as I2C4 clock
      B_0x2)
     with Size => 2;
   for RCC_CCIPR2_I2C4SEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2);

   --  QUADSPI clock source selection Set and reset by software.
   type RCC_CCIPR2_QSPISEL_Field is
     (--  system clock selected as QUADSPI kernel clock
      B_0x0,
      --  HSI16 clock selected as QUADSPI kernel clock
      B_0x1,
      --  PLL Q clock selected as QUADSPI kernel clock
      B_0x2)
     with Size => 2;
   for RCC_CCIPR2_QSPISEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2);

   --  Peripherals independent clock configuration register
   type RCC_CCIPR2_Register is record
      --  I2C4 clock source selection These bits are set and cleared by
      --  software to select the I2C4 clock source.
      I2C4SEL        : RCC_CCIPR2_I2C4SEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_2_19  : Interfaces.STM32.UInt18 := 16#0#;
      --  QUADSPI clock source selection Set and reset by software.
      QSPISEL        : RCC_CCIPR2_QSPISEL_Field := Interfaces.STM32.RCC.B_0x0;
      --  unspecified
      Reserved_22_31 : Interfaces.STM32.UInt10 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RCC_CCIPR2_Register use record
      I2C4SEL        at 0 range 0 .. 1;
      Reserved_2_19  at 0 range 2 .. 19;
      QSPISEL        at 0 range 20 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Reset and clock control
   type RCC_Peripheral is record
      --  Clock control register
      RCC_CR         : aliased RCC_CR_Register;
      pragma Volatile_Full_Access (RCC_CR);
      --  Internal clock sources calibration register
      RCC_ICSCR      : aliased RCC_ICSCR_Register;
      pragma Volatile_Full_Access (RCC_ICSCR);
      --  Clock configuration register
      RCC_CFGR       : aliased RCC_CFGR_Register;
      pragma Volatile_Full_Access (RCC_CFGR);
      --  PLL configuration register
      RCC_PLLCFGR    : aliased RCC_PLLCFGR_Register;
      pragma Volatile_Full_Access (RCC_PLLCFGR);
      --  Clock interrupt enable register
      RCC_CIER       : aliased RCC_CIER_Register;
      pragma Volatile_Full_Access (RCC_CIER);
      --  Clock interrupt flag register
      RCC_CIFR       : aliased RCC_CIFR_Register;
      pragma Volatile_Full_Access (RCC_CIFR);
      --  Clock interrupt clear register
      RCC_CICR       : aliased RCC_CICR_Register;
      pragma Volatile_Full_Access (RCC_CICR);
      --  AHB1 peripheral reset register
      RCC_AHB1RSTR   : aliased RCC_AHB1RSTR_Register;
      pragma Volatile_Full_Access (RCC_AHB1RSTR);
      --  AHB2 peripheral reset register
      RCC_AHB2RSTR   : aliased RCC_AHB2RSTR_Register;
      pragma Volatile_Full_Access (RCC_AHB2RSTR);
      --  AHB3 peripheral reset register
      RCC_AHB3RSTR   : aliased RCC_AHB3RSTR_Register;
      pragma Volatile_Full_Access (RCC_AHB3RSTR);
      --  APB1 peripheral reset register 1
      RCC_APB1RSTR1  : aliased RCC_APB1RSTR1_Register;
      pragma Volatile_Full_Access (RCC_APB1RSTR1);
      --  APB1 peripheral reset register 2
      RCC_APB1RSTR2  : aliased RCC_APB1RSTR2_Register;
      pragma Volatile_Full_Access (RCC_APB1RSTR2);
      --  APB2 peripheral reset register
      RCC_APB2RSTR   : aliased RCC_APB2RSTR_Register;
      pragma Volatile_Full_Access (RCC_APB2RSTR);
      --  AHB1 peripheral clock enable register
      RCC_AHB1ENR    : aliased RCC_AHB1ENR_Register;
      pragma Volatile_Full_Access (RCC_AHB1ENR);
      --  AHB2 peripheral clock enable register
      RCC_AHB2ENR    : aliased RCC_AHB2ENR_Register;
      pragma Volatile_Full_Access (RCC_AHB2ENR);
      --  AHB3 peripheral clock enable register
      RCC_AHB3ENR    : aliased RCC_AHB3ENR_Register;
      pragma Volatile_Full_Access (RCC_AHB3ENR);
      --  APB1 peripheral clock enable register 1
      RCC_APB1ENR1   : aliased RCC_APB1ENR1_Register;
      pragma Volatile_Full_Access (RCC_APB1ENR1);
      --  APB1 peripheral clock enable register 2
      RCC_APB1ENR2   : aliased RCC_APB1ENR2_Register;
      pragma Volatile_Full_Access (RCC_APB1ENR2);
      --  APB2 peripheral clock enable register
      RCC_APB2ENR    : aliased RCC_APB2ENR_Register;
      pragma Volatile_Full_Access (RCC_APB2ENR);
      --  AHB1 peripheral clocks enable in Sleep and Stop modes register
      RCC_AHB1SMENR  : aliased RCC_AHB1SMENR_Register;
      pragma Volatile_Full_Access (RCC_AHB1SMENR);
      --  AHB2 peripheral clocks enable in Sleep and Stop modes register
      RCC_AHB2SMENR  : aliased RCC_AHB2SMENR_Register;
      pragma Volatile_Full_Access (RCC_AHB2SMENR);
      --  AHB3 peripheral clocks enable in Sleep and Stop modes register
      RCC_AHB3SMENR  : aliased RCC_AHB3SMENR_Register;
      pragma Volatile_Full_Access (RCC_AHB3SMENR);
      --  APB1 peripheral clocks enable in Sleep and Stop modes register 1
      RCC_APB1SMENR1 : aliased RCC_APB1SMENR1_Register;
      pragma Volatile_Full_Access (RCC_APB1SMENR1);
      --  APB1 peripheral clocks enable in Sleep and Stop modes register 2
      RCC_APB1SMENR2 : aliased RCC_APB1SMENR2_Register;
      pragma Volatile_Full_Access (RCC_APB1SMENR2);
      --  APB2 peripheral clocks enable in Sleep and Stop modes register
      RCC_APB2SMENR  : aliased RCC_APB2SMENR_Register;
      pragma Volatile_Full_Access (RCC_APB2SMENR);
      --  Peripherals independent clock configuration register
      RCC_CCIPR      : aliased RCC_CCIPR_Register;
      pragma Volatile_Full_Access (RCC_CCIPR);
      --  RTC domain control register
      RCC_BDCR       : aliased RCC_BDCR_Register;
      pragma Volatile_Full_Access (RCC_BDCR);
      --  Control/status register
      RCC_CSR        : aliased RCC_CSR_Register;
      pragma Volatile_Full_Access (RCC_CSR);
      --  Clock recovery RC register
      RCC_CRRCR      : aliased RCC_CRRCR_Register;
      pragma Volatile_Full_Access (RCC_CRRCR);
      --  Peripherals independent clock configuration register
      RCC_CCIPR2     : aliased RCC_CCIPR2_Register;
      pragma Volatile_Full_Access (RCC_CCIPR2);
   end record
     with Volatile;

   for RCC_Peripheral use record
      RCC_CR         at 16#0# range 0 .. 31;
      RCC_ICSCR      at 16#4# range 0 .. 31;
      RCC_CFGR       at 16#8# range 0 .. 31;
      RCC_PLLCFGR    at 16#C# range 0 .. 31;
      RCC_CIER       at 16#18# range 0 .. 31;
      RCC_CIFR       at 16#1C# range 0 .. 31;
      RCC_CICR       at 16#20# range 0 .. 31;
      RCC_AHB1RSTR   at 16#28# range 0 .. 31;
      RCC_AHB2RSTR   at 16#2C# range 0 .. 31;
      RCC_AHB3RSTR   at 16#30# range 0 .. 31;
      RCC_APB1RSTR1  at 16#38# range 0 .. 31;
      RCC_APB1RSTR2  at 16#3C# range 0 .. 31;
      RCC_APB2RSTR   at 16#40# range 0 .. 31;
      RCC_AHB1ENR    at 16#48# range 0 .. 31;
      RCC_AHB2ENR    at 16#4C# range 0 .. 31;
      RCC_AHB3ENR    at 16#50# range 0 .. 31;
      RCC_APB1ENR1   at 16#58# range 0 .. 31;
      RCC_APB1ENR2   at 16#5C# range 0 .. 31;
      RCC_APB2ENR    at 16#60# range 0 .. 31;
      RCC_AHB1SMENR  at 16#68# range 0 .. 31;
      RCC_AHB2SMENR  at 16#6C# range 0 .. 31;
      RCC_AHB3SMENR  at 16#70# range 0 .. 31;
      RCC_APB1SMENR1 at 16#78# range 0 .. 31;
      RCC_APB1SMENR2 at 16#7C# range 0 .. 31;
      RCC_APB2SMENR  at 16#80# range 0 .. 31;
      RCC_CCIPR      at 16#88# range 0 .. 31;
      RCC_BDCR       at 16#90# range 0 .. 31;
      RCC_CSR        at 16#94# range 0 .. 31;
      RCC_CRRCR      at 16#98# range 0 .. 31;
      RCC_CCIPR2     at 16#9C# range 0 .. 31;
   end record;

   --  Reset and clock control
   RCC_Periph : aliased RCC_Peripheral
     with Import, Address => RCC_Base;

end Interfaces.STM32.RCC;
