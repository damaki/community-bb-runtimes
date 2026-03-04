--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G0B0.svd


with System;

package Interfaces.STM32.RCC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR_HSION_Field is Interfaces.STM32.Bit;
   subtype CR_HSIKERON_Field is Interfaces.STM32.Bit;
   subtype CR_HSIRDY_Field is Interfaces.STM32.Bit;
   subtype CR_HSIDIV_Field is Interfaces.STM32.UInt3;
   subtype CR_HSEON_Field is Interfaces.STM32.Bit;
   subtype CR_HSERDY_Field is Interfaces.STM32.Bit;
   subtype CR_HSEBYP_Field is Interfaces.STM32.Bit;
   subtype CR_CSSON_Field is Interfaces.STM32.Bit;
   subtype CR_PLLON_Field is Interfaces.STM32.Bit;
   subtype CR_PLLRDY_Field is Interfaces.STM32.Bit;

   --  Clock control register
   type CR_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.STM32.Byte := 16#63#;
      --  HSI16 clock enable
      HSION          : CR_HSION_Field := 16#0#;
      --  HSI16 always enable for peripheral kernels
      HSIKERON       : CR_HSIKERON_Field := 16#0#;
      --  HSI16 clock ready flag
      HSIRDY         : CR_HSIRDY_Field := 16#0#;
      --  HSI16 clock division factor
      HSIDIV         : CR_HSIDIV_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.STM32.UInt2 := 16#0#;
      --  HSE clock enable
      HSEON          : CR_HSEON_Field := 16#0#;
      --  HSE clock ready flag
      HSERDY         : CR_HSERDY_Field := 16#0#;
      --  HSE crystal oscillator bypass
      HSEBYP         : CR_HSEBYP_Field := 16#0#;
      --  Clock security system enable
      CSSON          : CR_CSSON_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : Interfaces.STM32.UInt4 := 16#0#;
      --  PLL enable
      PLLON          : CR_PLLON_Field := 16#0#;
      --  PLL clock ready flag
      PLLRDY         : CR_PLLRDY_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.STM32.UInt6 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      HSION          at 0 range 8 .. 8;
      HSIKERON       at 0 range 9 .. 9;
      HSIRDY         at 0 range 10 .. 10;
      HSIDIV         at 0 range 11 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      HSEON          at 0 range 16 .. 16;
      HSERDY         at 0 range 17 .. 17;
      HSEBYP         at 0 range 18 .. 18;
      CSSON          at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      PLLON          at 0 range 24 .. 24;
      PLLRDY         at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype ICSCR_HSICAL_Field is Interfaces.STM32.Byte;
   subtype ICSCR_HSITRIM_Field is Interfaces.STM32.UInt7;

   --  Internal clock sources calibration register
   type ICSCR_Register is record
      --  Read-only. HSI16 clock calibration
      HSICAL         : ICSCR_HSICAL_Field := 16#0#;
      --  HSI16 clock trimming
      HSITRIM        : ICSCR_HSITRIM_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.STM32.UInt17 := 16#2000#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ICSCR_Register use record
      HSICAL         at 0 range 0 .. 7;
      HSITRIM        at 0 range 8 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype CFGR_SW_Field is Interfaces.STM32.UInt3;
   subtype CFGR_SWS_Field is Interfaces.STM32.UInt3;
   subtype CFGR_HPRE_Field is Interfaces.STM32.UInt4;
   subtype CFGR_PPRE_Field is Interfaces.STM32.UInt3;
   subtype CFGR_MCO2SEL_Field is Interfaces.STM32.UInt4;
   subtype CFGR_MCO2PRE_Field is Interfaces.STM32.UInt4;
   subtype CFGR_MCOSEL_Field is Interfaces.STM32.UInt4;
   subtype CFGR_MCOPRE_Field is Interfaces.STM32.UInt4;

   --  Clock configuration register
   type CFGR_Register is record
      --  System clock switch
      SW             : CFGR_SW_Field := 16#0#;
      --  Read-only. System clock switch status
      SWS            : CFGR_SWS_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  AHB prescaler
      HPRE           : CFGR_HPRE_Field := 16#0#;
      --  APB prescaler
      PPRE           : CFGR_PPRE_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  MCO2SEL
      MCO2SEL        : CFGR_MCO2SEL_Field := 16#0#;
      --  MCO2PRE
      MCO2PRE        : CFGR_MCO2PRE_Field := 16#0#;
      --  Microcontroller clock output
      MCOSEL         : CFGR_MCOSEL_Field := 16#0#;
      --  Read-only. Microcontroller clock output prescaler
      MCOPRE         : CFGR_MCOPRE_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      SW             at 0 range 0 .. 2;
      SWS            at 0 range 3 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      HPRE           at 0 range 8 .. 11;
      PPRE           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      MCO2SEL        at 0 range 16 .. 19;
      MCO2PRE        at 0 range 20 .. 23;
      MCOSEL         at 0 range 24 .. 27;
      MCOPRE         at 0 range 28 .. 31;
   end record;

   subtype PLLSYSCFGR_PLLSRC_Field is Interfaces.STM32.UInt2;
   subtype PLLSYSCFGR_PLLM_Field is Interfaces.STM32.UInt3;
   subtype PLLSYSCFGR_PLLN_Field is Interfaces.STM32.Byte;
   subtype PLLSYSCFGR_PLLPEN_Field is Interfaces.STM32.Bit;
   subtype PLLSYSCFGR_PLLP_Field is Interfaces.STM32.UInt5;
   subtype PLLSYSCFGR_PLLQEN_Field is Interfaces.STM32.Bit;
   subtype PLLSYSCFGR_PLLQ_Field is Interfaces.STM32.UInt3;
   subtype PLLSYSCFGR_PLLREN_Field is Interfaces.STM32.Bit;
   subtype PLLSYSCFGR_PLLR_Field is Interfaces.STM32.UInt3;

   --  PLL configuration register
   type PLLSYSCFGR_Register is record
      --  PLL input clock source
      PLLSRC         : PLLSYSCFGR_PLLSRC_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  Division factor M of the PLL input clock divider
      PLLM           : PLLSYSCFGR_PLLM_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.STM32.Bit := 16#0#;
      --  PLL frequency multiplication factor N
      PLLN           : PLLSYSCFGR_PLLN_Field := 16#10#;
      --  PLLPCLK clock output enable
      PLLPEN         : PLLSYSCFGR_PLLPEN_Field := 16#0#;
      --  PLL VCO division factor P for PLLPCLK clock output
      PLLP           : PLLSYSCFGR_PLLP_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.STM32.UInt2 := 16#0#;
      --  PLLQCLK clock output enable
      PLLQEN         : PLLSYSCFGR_PLLQEN_Field := 16#0#;
      --  PLL VCO division factor Q for PLLQCLK clock output
      PLLQ           : PLLSYSCFGR_PLLQ_Field := 16#0#;
      --  PLLRCLK clock output enable
      PLLREN         : PLLSYSCFGR_PLLREN_Field := 16#0#;
      --  PLL VCO division factor R for PLLRCLK clock output
      PLLR           : PLLSYSCFGR_PLLR_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PLLSYSCFGR_Register use record
      PLLSRC         at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      PLLM           at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PLLN           at 0 range 8 .. 15;
      PLLPEN         at 0 range 16 .. 16;
      PLLP           at 0 range 17 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      PLLQEN         at 0 range 24 .. 24;
      PLLQ           at 0 range 25 .. 27;
      PLLREN         at 0 range 28 .. 28;
      PLLR           at 0 range 29 .. 31;
   end record;

   subtype CIER_LSIRDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_LSERDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_HSIRDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_HSERDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_PLLSYSRDYIE_Field is Interfaces.STM32.Bit;

   --  Clock interrupt enable register
   type CIER_Register is record
      --  LSI ready interrupt enable
      LSIRDYIE      : CIER_LSIRDYIE_Field := 16#0#;
      --  LSE ready interrupt enable
      LSERDYIE      : CIER_LSERDYIE_Field := 16#0#;
      --  unspecified
      Reserved_2_2  : Interfaces.STM32.Bit := 16#0#;
      --  HSI ready interrupt enable
      HSIRDYIE      : CIER_HSIRDYIE_Field := 16#0#;
      --  HSE ready interrupt enable
      HSERDYIE      : CIER_HSERDYIE_Field := 16#0#;
      --  PLL ready interrupt enable
      PLLSYSRDYIE   : CIER_PLLSYSRDYIE_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.STM32.UInt26 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CIER_Register use record
      LSIRDYIE      at 0 range 0 .. 0;
      LSERDYIE      at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      HSIRDYIE      at 0 range 3 .. 3;
      HSERDYIE      at 0 range 4 .. 4;
      PLLSYSRDYIE   at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype CIFR_LSIRDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_LSERDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_HSIRDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_HSERDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_PLLSYSRDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_CSSF_Field is Interfaces.STM32.Bit;
   subtype CIFR_LSECSSF_Field is Interfaces.STM32.Bit;

   --  Clock interrupt flag register
   type CIFR_Register is record
      --  Read-only. LSI ready interrupt flag
      LSIRDYF        : CIFR_LSIRDYF_Field;
      --  Read-only. LSE ready interrupt flag
      LSERDYF        : CIFR_LSERDYF_Field;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit;
      --  Read-only. HSI ready interrupt flag
      HSIRDYF        : CIFR_HSIRDYF_Field;
      --  Read-only. HSE ready interrupt flag
      HSERDYF        : CIFR_HSERDYF_Field;
      --  Read-only. PLL ready interrupt flag
      PLLSYSRDYF     : CIFR_PLLSYSRDYF_Field;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2;
      --  Read-only. Clock security system interrupt flag
      CSSF           : CIFR_CSSF_Field;
      --  Read-only. LSE Clock security system interrupt flag
      LSECSSF        : CIFR_LSECSSF_Field;
      --  unspecified
      Reserved_10_31 : Interfaces.STM32.UInt22;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CIFR_Register use record
      LSIRDYF        at 0 range 0 .. 0;
      LSERDYF        at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      HSIRDYF        at 0 range 3 .. 3;
      HSERDYF        at 0 range 4 .. 4;
      PLLSYSRDYF     at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CSSF           at 0 range 8 .. 8;
      LSECSSF        at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype CICR_LSIRDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_LSERDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_HSIRDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_HSERDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_PLLSYSRDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_CSSC_Field is Interfaces.STM32.Bit;
   subtype CICR_LSECSSC_Field is Interfaces.STM32.Bit;

   --  Clock interrupt clear register
   type CICR_Register is record
      --  Write-only. LSI ready interrupt clear
      LSIRDYC        : CICR_LSIRDYC_Field := 16#0#;
      --  Write-only. LSE ready interrupt clear
      LSERDYC        : CICR_LSERDYC_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit := 16#0#;
      --  Write-only. HSI ready interrupt clear
      HSIRDYC        : CICR_HSIRDYC_Field := 16#0#;
      --  Write-only. HSE ready interrupt clear
      HSERDYC        : CICR_HSERDYC_Field := 16#0#;
      --  Write-only. PLL ready interrupt clear
      PLLSYSRDYC     : CICR_PLLSYSRDYC_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  Write-only. Clock security system interrupt clear
      CSSC           : CICR_CSSC_Field := 16#0#;
      --  Write-only. LSE Clock security system interrupt clear
      LSECSSC        : CICR_LSECSSC_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.STM32.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CICR_Register use record
      LSIRDYC        at 0 range 0 .. 0;
      LSERDYC        at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      HSIRDYC        at 0 range 3 .. 3;
      HSERDYC        at 0 range 4 .. 4;
      PLLSYSRDYC     at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CSSC           at 0 range 8 .. 8;
      LSECSSC        at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype IOPRSTR_GPIOARST_Field is Interfaces.STM32.Bit;
   subtype IOPRSTR_GPIOBRST_Field is Interfaces.STM32.Bit;
   subtype IOPRSTR_GPIOCRST_Field is Interfaces.STM32.Bit;
   subtype IOPRSTR_GPIODRST_Field is Interfaces.STM32.Bit;
   subtype IOPRSTR_GPIOERST_Field is Interfaces.STM32.Bit;
   subtype IOPRSTR_GPIOFRST_Field is Interfaces.STM32.Bit;

   --  I/O port reset register
   type IOPRSTR_Register is record
      --  GPIOARST
      GPIOARST      : IOPRSTR_GPIOARST_Field := 16#0#;
      --  GPIOBRST
      GPIOBRST      : IOPRSTR_GPIOBRST_Field := 16#0#;
      --  GPIOCRST
      GPIOCRST      : IOPRSTR_GPIOCRST_Field := 16#0#;
      --  GPIODRST
      GPIODRST      : IOPRSTR_GPIODRST_Field := 16#0#;
      --  GPIOERST
      GPIOERST      : IOPRSTR_GPIOERST_Field := 16#0#;
      --  GPIOFRST
      GPIOFRST      : IOPRSTR_GPIOFRST_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.STM32.UInt26 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for IOPRSTR_Register use record
      GPIOARST      at 0 range 0 .. 0;
      GPIOBRST      at 0 range 1 .. 1;
      GPIOCRST      at 0 range 2 .. 2;
      GPIODRST      at 0 range 3 .. 3;
      GPIOERST      at 0 range 4 .. 4;
      GPIOFRST      at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype AHBRSTR_DMA1RST_Field is Interfaces.STM32.Bit;
   subtype AHBRSTR_DMA2RST_Field is Interfaces.STM32.Bit;
   subtype AHBRSTR_FLASHRST_Field is Interfaces.STM32.Bit;
   subtype AHBRSTR_CRCRST_Field is Interfaces.STM32.Bit;

   --  AHB peripheral reset register
   type AHBRSTR_Register is record
      --  DMA1 reset
      DMA1RST        : AHBRSTR_DMA1RST_Field := 16#0#;
      --  DMA1 reset
      DMA2RST        : AHBRSTR_DMA2RST_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.STM32.UInt6 := 16#0#;
      --  FLITF reset
      FLASHRST       : AHBRSTR_FLASHRST_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : Interfaces.STM32.UInt3 := 16#0#;
      --  CRC reset
      CRCRST         : AHBRSTR_CRCRST_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : Interfaces.STM32.UInt19 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for AHBRSTR_Register use record
      DMA1RST        at 0 range 0 .. 0;
      DMA2RST        at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      FLASHRST       at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      CRCRST         at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype APBRSTR1_TIM3RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_TIM4RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_TIM6RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_TIM7RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_USART5RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_USART6RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_USBRST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_SPI2RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_SPI3RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_USART2RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_USART3RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_USART4RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_I2C1RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_I2C2RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_I2C3RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_DBGRST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR1_PWRRST_Field is Interfaces.STM32.Bit;

   --  APB peripheral reset register 1
   type APBRSTR1_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.STM32.Bit := 16#0#;
      --  TIM3 timer reset
      TIM3RST        : APBRSTR1_TIM3RST_Field := 16#0#;
      --  TIM4 timer reset
      TIM4RST        : APBRSTR1_TIM4RST_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Interfaces.STM32.Bit := 16#0#;
      --  TIM6 timer reset
      TIM6RST        : APBRSTR1_TIM6RST_Field := 16#0#;
      --  TIM7 timer reset
      TIM7RST        : APBRSTR1_TIM7RST_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  USART5RST
      USART5RST      : APBRSTR1_USART5RST_Field := 16#0#;
      --  USART6RST
      USART6RST      : APBRSTR1_USART6RST_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : Interfaces.STM32.UInt3 := 16#0#;
      --  USBRST
      USBRST         : APBRSTR1_USBRST_Field := 16#0#;
      --  SPI2 reset
      SPI2RST        : APBRSTR1_SPI2RST_Field := 16#0#;
      --  SPI3 reset
      SPI3RST        : APBRSTR1_SPI3RST_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Interfaces.STM32.Bit := 16#0#;
      --  USART2 reset
      USART2RST      : APBRSTR1_USART2RST_Field := 16#0#;
      --  USART3 reset
      USART3RST      : APBRSTR1_USART3RST_Field := 16#0#;
      --  USART4 reset
      USART4RST      : APBRSTR1_USART4RST_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  I2C1 reset
      I2C1RST        : APBRSTR1_I2C1RST_Field := 16#0#;
      --  I2C2 reset
      I2C2RST        : APBRSTR1_I2C2RST_Field := 16#0#;
      --  I2C3RST reset
      I2C3RST        : APBRSTR1_I2C3RST_Field := 16#0#;
      --  unspecified
      Reserved_24_26 : Interfaces.STM32.UInt3 := 16#0#;
      --  Debug support reset
      DBGRST         : APBRSTR1_DBGRST_Field := 16#0#;
      --  Power interface reset
      PWRRST         : APBRSTR1_PWRRST_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.STM32.UInt3 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for APBRSTR1_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      TIM3RST        at 0 range 1 .. 1;
      TIM4RST        at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TIM6RST        at 0 range 4 .. 4;
      TIM7RST        at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      USART5RST      at 0 range 8 .. 8;
      USART6RST      at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      USBRST         at 0 range 13 .. 13;
      SPI2RST        at 0 range 14 .. 14;
      SPI3RST        at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      USART2RST      at 0 range 17 .. 17;
      USART3RST      at 0 range 18 .. 18;
      USART4RST      at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      I2C1RST        at 0 range 21 .. 21;
      I2C2RST        at 0 range 22 .. 22;
      I2C3RST        at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      DBGRST         at 0 range 27 .. 27;
      PWRRST         at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype APBRSTR2_SYSCFGRST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR2_TIM1RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR2_SPI1RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR2_USART1RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR2_TIM14RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR2_TIM15RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR2_TIM16RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR2_TIM17RST_Field is Interfaces.STM32.Bit;
   subtype APBRSTR2_ADCRST_Field is Interfaces.STM32.Bit;

   --  APB peripheral reset register 2
   type APBRSTR2_Register is record
      --  SYSCFG, COMP and VREFBUF reset
      SYSCFGRST      : APBRSTR2_SYSCFGRST_Field := 16#0#;
      --  unspecified
      Reserved_1_10  : Interfaces.STM32.UInt10 := 16#0#;
      --  TIM1 timer reset
      TIM1RST        : APBRSTR2_TIM1RST_Field := 16#0#;
      --  SPI1 reset
      SPI1RST        : APBRSTR2_SPI1RST_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  USART1 reset
      USART1RST      : APBRSTR2_USART1RST_Field := 16#0#;
      --  TIM14 timer reset
      TIM14RST       : APBRSTR2_TIM14RST_Field := 16#0#;
      --  TIM15 timer reset
      TIM15RST       : APBRSTR2_TIM15RST_Field := 16#0#;
      --  TIM16 timer reset
      TIM16RST       : APBRSTR2_TIM16RST_Field := 16#0#;
      --  TIM17 timer reset
      TIM17RST       : APBRSTR2_TIM17RST_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  ADC reset
      ADCRST         : APBRSTR2_ADCRST_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : Interfaces.STM32.UInt11 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for APBRSTR2_Register use record
      SYSCFGRST      at 0 range 0 .. 0;
      Reserved_1_10  at 0 range 1 .. 10;
      TIM1RST        at 0 range 11 .. 11;
      SPI1RST        at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1RST      at 0 range 14 .. 14;
      TIM14RST       at 0 range 15 .. 15;
      TIM15RST       at 0 range 16 .. 16;
      TIM16RST       at 0 range 17 .. 17;
      TIM17RST       at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      ADCRST         at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype IOPENR_GPIOAEN_Field is Interfaces.STM32.Bit;
   subtype IOPENR_GPIOBEN_Field is Interfaces.STM32.Bit;
   subtype IOPENR_GPIOCEN_Field is Interfaces.STM32.Bit;
   subtype IOPENR_GPIODEN_Field is Interfaces.STM32.Bit;
   subtype IOPENR_GPIOEEN_Field is Interfaces.STM32.Bit;
   subtype IOPENR_GPIOFEN_Field is Interfaces.STM32.Bit;

   --  GPIO clock enable register
   type IOPENR_Register is record
      --  I/O port A clock enable during Sleep mode
      GPIOAEN       : IOPENR_GPIOAEN_Field := 16#0#;
      --  I/O port B clock enable during Sleep mode
      GPIOBEN       : IOPENR_GPIOBEN_Field := 16#0#;
      --  I/O port C clock enable during Sleep mode
      GPIOCEN       : IOPENR_GPIOCEN_Field := 16#0#;
      --  I/O port D clock enable during Sleep mode
      GPIODEN       : IOPENR_GPIODEN_Field := 16#0#;
      --  I/O port E clock enable during Sleep mode
      GPIOEEN       : IOPENR_GPIOEEN_Field := 16#0#;
      --  I/O port F clock enable during Sleep mode
      GPIOFEN       : IOPENR_GPIOFEN_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.STM32.UInt26 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for IOPENR_Register use record
      GPIOAEN       at 0 range 0 .. 0;
      GPIOBEN       at 0 range 1 .. 1;
      GPIOCEN       at 0 range 2 .. 2;
      GPIODEN       at 0 range 3 .. 3;
      GPIOEEN       at 0 range 4 .. 4;
      GPIOFEN       at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype AHBENR_DMA1EN_Field is Interfaces.STM32.Bit;
   subtype AHBENR_DMA2EN_Field is Interfaces.STM32.Bit;
   subtype AHBENR_FLASHEN_Field is Interfaces.STM32.Bit;
   subtype AHBENR_CRCEN_Field is Interfaces.STM32.Bit;

   --  AHB peripheral clock enable register
   type AHBENR_Register is record
      --  DMA1 clock enable
      DMA1EN         : AHBENR_DMA1EN_Field := 16#0#;
      --  DMA2 clock enable
      DMA2EN         : AHBENR_DMA2EN_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.STM32.UInt6 := 16#0#;
      --  Flash memory interface clock enable
      FLASHEN        : AHBENR_FLASHEN_Field := 16#1#;
      --  unspecified
      Reserved_9_11  : Interfaces.STM32.UInt3 := 16#0#;
      --  CRC clock enable
      CRCEN          : AHBENR_CRCEN_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : Interfaces.STM32.UInt19 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for AHBENR_Register use record
      DMA1EN         at 0 range 0 .. 0;
      DMA2EN         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      FLASHEN        at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      CRCEN          at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype APBENR1_TIM3EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_TIM4EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_TIM6EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_TIM7EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_USART5EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_USART6EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_RTCAPBEN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_WWDGEN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_USBEN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_SPI2EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_SPI3EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_USART2EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_USART3EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_USART4EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_I2C1EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_I2C2EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_I2C3EN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_DBGEN_Field is Interfaces.STM32.Bit;
   subtype APBENR1_PWREN_Field is Interfaces.STM32.Bit;

   --  APB peripheral clock enable register 1
   type APBENR1_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.STM32.Bit := 16#0#;
      --  TIM3 timer clock enable
      TIM3EN         : APBENR1_TIM3EN_Field := 16#0#;
      --  TIM4 timer clock enable
      TIM4EN         : APBENR1_TIM4EN_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Interfaces.STM32.Bit := 16#0#;
      --  TIM6 timer clock enable
      TIM6EN         : APBENR1_TIM6EN_Field := 16#0#;
      --  TIM7 timer clock enable
      TIM7EN         : APBENR1_TIM7EN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  USART5EN
      USART5EN       : APBENR1_USART5EN_Field := 16#0#;
      --  USART6EN
      USART6EN       : APBENR1_USART6EN_Field := 16#0#;
      --  RTC APB clock enable
      RTCAPBEN       : APBENR1_RTCAPBEN_Field := 16#0#;
      --  WWDG clock enable
      WWDGEN         : APBENR1_WWDGEN_Field := 16#0#;
      --  unspecified
      Reserved_12_12 : Interfaces.STM32.Bit := 16#0#;
      --  USBEN
      USBEN          : APBENR1_USBEN_Field := 16#0#;
      --  SPI2 clock enable
      SPI2EN         : APBENR1_SPI2EN_Field := 16#0#;
      --  SPI3 clock enable
      SPI3EN         : APBENR1_SPI3EN_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Interfaces.STM32.Bit := 16#0#;
      --  USART2 clock enable
      USART2EN       : APBENR1_USART2EN_Field := 16#0#;
      --  USART3 clock enable
      USART3EN       : APBENR1_USART3EN_Field := 16#0#;
      --  USART4 clock enable
      USART4EN       : APBENR1_USART4EN_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  I2C1 clock enable
      I2C1EN         : APBENR1_I2C1EN_Field := 16#0#;
      --  I2C2 clock enable
      I2C2EN         : APBENR1_I2C2EN_Field := 16#0#;
      --  I2C3 clock enable
      I2C3EN         : APBENR1_I2C3EN_Field := 16#0#;
      --  unspecified
      Reserved_24_26 : Interfaces.STM32.UInt3 := 16#0#;
      --  Debug support clock enable
      DBGEN          : APBENR1_DBGEN_Field := 16#0#;
      --  Power interface clock enable
      PWREN          : APBENR1_PWREN_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.STM32.UInt3 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for APBENR1_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      TIM3EN         at 0 range 1 .. 1;
      TIM4EN         at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TIM6EN         at 0 range 4 .. 4;
      TIM7EN         at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      USART5EN       at 0 range 8 .. 8;
      USART6EN       at 0 range 9 .. 9;
      RTCAPBEN       at 0 range 10 .. 10;
      WWDGEN         at 0 range 11 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      USBEN          at 0 range 13 .. 13;
      SPI2EN         at 0 range 14 .. 14;
      SPI3EN         at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      USART2EN       at 0 range 17 .. 17;
      USART3EN       at 0 range 18 .. 18;
      USART4EN       at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      I2C1EN         at 0 range 21 .. 21;
      I2C2EN         at 0 range 22 .. 22;
      I2C3EN         at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      DBGEN          at 0 range 27 .. 27;
      PWREN          at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype APBENR2_SYSCFGEN_Field is Interfaces.STM32.Bit;
   subtype APBENR2_TIM1EN_Field is Interfaces.STM32.Bit;
   subtype APBENR2_SPI1EN_Field is Interfaces.STM32.Bit;
   subtype APBENR2_USART1EN_Field is Interfaces.STM32.Bit;
   subtype APBENR2_TIM14EN_Field is Interfaces.STM32.Bit;
   subtype APBENR2_TIM15EN_Field is Interfaces.STM32.Bit;
   subtype APBENR2_TIM16EN_Field is Interfaces.STM32.Bit;
   subtype APBENR2_TIM17EN_Field is Interfaces.STM32.Bit;
   subtype APBENR2_ADCEN_Field is Interfaces.STM32.Bit;

   --  APB peripheral clock enable register 2
   type APBENR2_Register is record
      --  SYSCFG, COMP and VREFBUF clock enable
      SYSCFGEN       : APBENR2_SYSCFGEN_Field := 16#0#;
      --  unspecified
      Reserved_1_10  : Interfaces.STM32.UInt10 := 16#0#;
      --  TIM1 timer clock enable
      TIM1EN         : APBENR2_TIM1EN_Field := 16#0#;
      --  SPI1 clock enable
      SPI1EN         : APBENR2_SPI1EN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  USART1 clock enable
      USART1EN       : APBENR2_USART1EN_Field := 16#0#;
      --  TIM14 timer clock enable
      TIM14EN        : APBENR2_TIM14EN_Field := 16#0#;
      --  TIM15 timer clock enable
      TIM15EN        : APBENR2_TIM15EN_Field := 16#0#;
      --  TIM16 timer clock enable
      TIM16EN        : APBENR2_TIM16EN_Field := 16#0#;
      --  TIM16 timer clock enable
      TIM17EN        : APBENR2_TIM17EN_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  ADC clock enable
      ADCEN          : APBENR2_ADCEN_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : Interfaces.STM32.UInt11 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for APBENR2_Register use record
      SYSCFGEN       at 0 range 0 .. 0;
      Reserved_1_10  at 0 range 1 .. 10;
      TIM1EN         at 0 range 11 .. 11;
      SPI1EN         at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1EN       at 0 range 14 .. 14;
      TIM14EN        at 0 range 15 .. 15;
      TIM15EN        at 0 range 16 .. 16;
      TIM16EN        at 0 range 17 .. 17;
      TIM17EN        at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      ADCEN          at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype IOPSMENR_GPIOASMEN_Field is Interfaces.STM32.Bit;
   subtype IOPSMENR_GPIOBSMEN_Field is Interfaces.STM32.Bit;
   subtype IOPSMENR_GPIOCSMEN_Field is Interfaces.STM32.Bit;
   subtype IOPSMENR_GPIODSMEN_Field is Interfaces.STM32.Bit;
   subtype IOPSMENR_GPIOESMEN_Field is Interfaces.STM32.Bit;
   subtype IOPSMENR_GPIOFSMEN_Field is Interfaces.STM32.Bit;

   --  GPIO in Sleep mode clock enable register
   type IOPSMENR_Register is record
      --  I/O port A clock enable during Sleep mode
      GPIOASMEN     : IOPSMENR_GPIOASMEN_Field := 16#1#;
      --  I/O port B clock enable during Sleep mode
      GPIOBSMEN     : IOPSMENR_GPIOBSMEN_Field := 16#1#;
      --  I/O port C clock enable during Sleep mode
      GPIOCSMEN     : IOPSMENR_GPIOCSMEN_Field := 16#1#;
      --  I/O port D clock enable during Sleep mode
      GPIODSMEN     : IOPSMENR_GPIODSMEN_Field := 16#1#;
      --  I/O port E clock enable during Sleep mode
      GPIOESMEN     : IOPSMENR_GPIOESMEN_Field := 16#1#;
      --  I/O port F clock enable during Sleep mode
      GPIOFSMEN     : IOPSMENR_GPIOFSMEN_Field := 16#1#;
      --  unspecified
      Reserved_6_31 : Interfaces.STM32.UInt26 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for IOPSMENR_Register use record
      GPIOASMEN     at 0 range 0 .. 0;
      GPIOBSMEN     at 0 range 1 .. 1;
      GPIOCSMEN     at 0 range 2 .. 2;
      GPIODSMEN     at 0 range 3 .. 3;
      GPIOESMEN     at 0 range 4 .. 4;
      GPIOFSMEN     at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype AHBSMENR_DMA1SMEN_Field is Interfaces.STM32.Bit;
   subtype AHBSMENR_DMA2SMEN_Field is Interfaces.STM32.Bit;
   subtype AHBSMENR_FLASHSMEN_Field is Interfaces.STM32.Bit;
   subtype AHBSMENR_SRAMSMEN_Field is Interfaces.STM32.Bit;
   subtype AHBSMENR_CRCSMEN_Field is Interfaces.STM32.Bit;

   --  AHB peripheral clock enable in Sleep mode register
   type AHBSMENR_Register is record
      --  DMA1 clock enable during Sleep mode
      DMA1SMEN       : AHBSMENR_DMA1SMEN_Field := 16#1#;
      --  DMA2 clock enable during Sleep mode
      DMA2SMEN       : AHBSMENR_DMA2SMEN_Field := 16#1#;
      --  unspecified
      Reserved_2_7   : Interfaces.STM32.UInt6 := 16#0#;
      --  Flash memory interface clock enable during Sleep mode
      FLASHSMEN      : AHBSMENR_FLASHSMEN_Field := 16#1#;
      --  SRAM clock enable during Sleep mode
      SRAMSMEN       : AHBSMENR_SRAMSMEN_Field := 16#1#;
      --  unspecified
      Reserved_10_11 : Interfaces.STM32.UInt2 := 16#0#;
      --  CRC clock enable during Sleep mode
      CRCSMEN        : AHBSMENR_CRCSMEN_Field := 16#1#;
      --  unspecified
      Reserved_13_31 : Interfaces.STM32.UInt19 := 16#28#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for AHBSMENR_Register use record
      DMA1SMEN       at 0 range 0 .. 0;
      DMA2SMEN       at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      FLASHSMEN      at 0 range 8 .. 8;
      SRAMSMEN       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      CRCSMEN        at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype APBSMENR1_TIM3SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_TIM4SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_TIM6SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_TIM7SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_USART5SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_USART6SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_RTCAPBSMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_WWDGSMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_USBSMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_SPI2SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_SPI3SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_USART2SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_USART3SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_USART4SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_I2C1SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_I2C2SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_I2C3SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_DBGSMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR1_PWRSMEN_Field is Interfaces.STM32.Bit;

   --  APB peripheral clock enable in Sleep mode register 1
   type APBSMENR1_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.STM32.Bit := 16#1#;
      --  TIM3 timer clock enable during Sleep mode
      TIM3SMEN       : APBSMENR1_TIM3SMEN_Field := 16#1#;
      --  TIM4 timer clock enable during Sleep mode
      TIM4SMEN       : APBSMENR1_TIM4SMEN_Field := 16#1#;
      --  unspecified
      Reserved_3_3   : Interfaces.STM32.Bit := 16#0#;
      --  TIM6 timer clock enable during Sleep mode
      TIM6SMEN       : APBSMENR1_TIM6SMEN_Field := 16#1#;
      --  TIM7 timer clock enable during Sleep mode
      TIM7SMEN       : APBSMENR1_TIM7SMEN_Field := 16#1#;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#2#;
      --  USART5 clock enable
      USART5SMEN     : APBSMENR1_USART5SMEN_Field := 16#1#;
      --  USART6 clock enable
      USART6SMEN     : APBSMENR1_USART6SMEN_Field := 16#1#;
      --  RTC APB clock enable during Sleep mode
      RTCAPBSMEN     : APBSMENR1_RTCAPBSMEN_Field := 16#1#;
      --  WWDG clock enable during Sleep mode
      WWDGSMEN       : APBSMENR1_WWDGSMEN_Field := 16#1#;
      --  unspecified
      Reserved_12_12 : Interfaces.STM32.Bit := 16#1#;
      --  USB clock enable during Sleep mode
      USBSMEN        : APBSMENR1_USBSMEN_Field := 16#1#;
      --  SPI2 clock enable during Sleep mode
      SPI2SMEN       : APBSMENR1_SPI2SMEN_Field := 16#1#;
      --  SPI3 clock enable during Sleep mode
      SPI3SMEN       : APBSMENR1_SPI3SMEN_Field := 16#1#;
      --  unspecified
      Reserved_16_16 : Interfaces.STM32.Bit := 16#1#;
      --  USART2 clock enable during Sleep mode
      USART2SMEN     : APBSMENR1_USART2SMEN_Field := 16#1#;
      --  USART3 clock enable during Sleep mode
      USART3SMEN     : APBSMENR1_USART3SMEN_Field := 16#1#;
      --  USART4 clock enable during Sleep mode
      USART4SMEN     : APBSMENR1_USART4SMEN_Field := 16#1#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#1#;
      --  I2C1 clock enable during Sleep mode
      I2C1SMEN       : APBSMENR1_I2C1SMEN_Field := 16#1#;
      --  I2C2 clock enable during Sleep mode
      I2C2SMEN       : APBSMENR1_I2C2SMEN_Field := 16#1#;
      --  I2C3 clock enable during Sleep mode
      I2C3SMEN       : APBSMENR1_I2C3SMEN_Field := 16#1#;
      --  unspecified
      Reserved_24_26 : Interfaces.STM32.UInt3 := 16#7#;
      --  Debug support clock enable during Sleep mode
      DBGSMEN        : APBSMENR1_DBGSMEN_Field := 16#1#;
      --  Power interface clock enable during Sleep mode
      PWRSMEN        : APBSMENR1_PWRSMEN_Field := 16#1#;
      --  unspecified
      Reserved_29_31 : Interfaces.STM32.UInt3 := 16#7#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for APBSMENR1_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      TIM3SMEN       at 0 range 1 .. 1;
      TIM4SMEN       at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TIM6SMEN       at 0 range 4 .. 4;
      TIM7SMEN       at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      USART5SMEN     at 0 range 8 .. 8;
      USART6SMEN     at 0 range 9 .. 9;
      RTCAPBSMEN     at 0 range 10 .. 10;
      WWDGSMEN       at 0 range 11 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      USBSMEN        at 0 range 13 .. 13;
      SPI2SMEN       at 0 range 14 .. 14;
      SPI3SMEN       at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      USART2SMEN     at 0 range 17 .. 17;
      USART3SMEN     at 0 range 18 .. 18;
      USART4SMEN     at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      I2C1SMEN       at 0 range 21 .. 21;
      I2C2SMEN       at 0 range 22 .. 22;
      I2C3SMEN       at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      DBGSMEN        at 0 range 27 .. 27;
      PWRSMEN        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype APBSMENR2_SYSCFGSMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR2_TIM1SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR2_SPI1SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR2_USART1SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR2_TIM14SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR2_TIM15SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR2_TIM16SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR2_TIM17SMEN_Field is Interfaces.STM32.Bit;
   subtype APBSMENR2_ADCSMEN_Field is Interfaces.STM32.Bit;

   --  APB peripheral clock enable in Sleep mode register 2
   type APBSMENR2_Register is record
      --  SYSCFG, COMP and VREFBUF clock enable during Sleep mode
      SYSCFGSMEN     : APBSMENR2_SYSCFGSMEN_Field := 16#1#;
      --  unspecified
      Reserved_1_10  : Interfaces.STM32.UInt10 := 16#0#;
      --  TIM1 timer clock enable during Sleep mode
      TIM1SMEN       : APBSMENR2_TIM1SMEN_Field := 16#1#;
      --  SPI1 clock enable during Sleep mode
      SPI1SMEN       : APBSMENR2_SPI1SMEN_Field := 16#1#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  USART1 clock enable during Sleep mode
      USART1SMEN     : APBSMENR2_USART1SMEN_Field := 16#1#;
      --  TIM14 timer clock enable during Sleep mode
      TIM14SMEN      : APBSMENR2_TIM14SMEN_Field := 16#1#;
      --  TIM15 timer clock enable during Sleep mode
      TIM15SMEN      : APBSMENR2_TIM15SMEN_Field := 16#1#;
      --  TIM16 timer clock enable during Sleep mode
      TIM16SMEN      : APBSMENR2_TIM16SMEN_Field := 16#1#;
      --  TIM16 timer clock enable during Sleep mode
      TIM17SMEN      : APBSMENR2_TIM17SMEN_Field := 16#1#;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  ADC clock enable during Sleep mode
      ADCSMEN        : APBSMENR2_ADCSMEN_Field := 16#1#;
      --  unspecified
      Reserved_21_31 : Interfaces.STM32.UInt11 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for APBSMENR2_Register use record
      SYSCFGSMEN     at 0 range 0 .. 0;
      Reserved_1_10  at 0 range 1 .. 10;
      TIM1SMEN       at 0 range 11 .. 11;
      SPI1SMEN       at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1SMEN     at 0 range 14 .. 14;
      TIM14SMEN      at 0 range 15 .. 15;
      TIM15SMEN      at 0 range 16 .. 16;
      TIM16SMEN      at 0 range 17 .. 17;
      TIM17SMEN      at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      ADCSMEN        at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype CCIPR_USART1SEL_Field is Interfaces.STM32.UInt2;
   subtype CCIPR_USART2SEL_Field is Interfaces.STM32.UInt2;
   subtype CCIPR_USART3SEL_Field is Interfaces.STM32.UInt2;
   subtype CCIPR_I2C1SEL_Field is Interfaces.STM32.UInt2;
   subtype CCIPR_I2S2SEL_Field is Interfaces.STM32.UInt2;
   subtype CCIPR_TIM1SEL_Field is Interfaces.STM32.Bit;
   subtype CCIPR_TIM15SEL_Field is Interfaces.STM32.Bit;
   subtype CCIPR_ADCSEL_Field is Interfaces.STM32.UInt2;

   --  Peripherals independent clock configuration register
   type CCIPR_Register is record
      --  USART1 clock source selection
      USART1SEL      : CCIPR_USART1SEL_Field := 16#0#;
      --  USART2 clock source selection
      USART2SEL      : CCIPR_USART2SEL_Field := 16#0#;
      --  USART3 clock source selection
      USART3SEL      : CCIPR_USART3SEL_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : Interfaces.STM32.UInt6 := 16#0#;
      --  I2C1 clock source selection
      I2C1SEL        : CCIPR_I2C1SEL_Field := 16#0#;
      --  I2S1 clock source selection
      I2S2SEL        : CCIPR_I2S2SEL_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : Interfaces.STM32.UInt6 := 16#0#;
      --  TIM1 clock source selection
      TIM1SEL        : CCIPR_TIM1SEL_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : Interfaces.STM32.Bit := 16#0#;
      --  TIM15 clock source selection
      TIM15SEL       : CCIPR_TIM15SEL_Field := 16#0#;
      --  unspecified
      Reserved_25_29 : Interfaces.STM32.UInt5 := 16#0#;
      --  ADCs clock source selection
      ADCSEL         : CCIPR_ADCSEL_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CCIPR_Register use record
      USART1SEL      at 0 range 0 .. 1;
      USART2SEL      at 0 range 2 .. 3;
      USART3SEL      at 0 range 4 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      I2C1SEL        at 0 range 12 .. 13;
      I2S2SEL        at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      TIM1SEL        at 0 range 22 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      TIM15SEL       at 0 range 24 .. 24;
      Reserved_25_29 at 0 range 25 .. 29;
      ADCSEL         at 0 range 30 .. 31;
   end record;

   subtype CCIPR2_I2S1SEL_Field is Interfaces.STM32.UInt2;
   subtype CCIPR2_I2S2SEL_Field is Interfaces.STM32.UInt2;
   subtype CCIPR2_USBSEL_Field is Interfaces.STM32.UInt2;

   --  Peripherals independent clock configuration register 2
   type CCIPR2_Register is record
      --  2S1SEL
      I2S1SEL        : CCIPR2_I2S1SEL_Field := 16#0#;
      --  I2S2SEL
      I2S2SEL        : CCIPR2_I2S2SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_11  : Interfaces.STM32.Byte := 16#0#;
      --  USBSEL
      USBSEL         : CCIPR2_USBSEL_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : Interfaces.STM32.UInt18 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CCIPR2_Register use record
      I2S1SEL        at 0 range 0 .. 1;
      I2S2SEL        at 0 range 2 .. 3;
      Reserved_4_11  at 0 range 4 .. 11;
      USBSEL         at 0 range 12 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype BDCR_LSEON_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSERDY_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSEBYP_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSEDRV_Field is Interfaces.STM32.UInt2;
   subtype BDCR_LSECSSON_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSECSSD_Field is Interfaces.STM32.Bit;
   subtype BDCR_RTCSEL_Field is Interfaces.STM32.UInt2;
   subtype BDCR_RTCEN_Field is Interfaces.STM32.Bit;
   subtype BDCR_BDRST_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSCOEN_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSCOSEL_Field is Interfaces.STM32.Bit;

   --  RTC domain control register
   type BDCR_Register is record
      --  LSE oscillator enable
      LSEON          : BDCR_LSEON_Field := 16#0#;
      --  Read-only. LSE oscillator ready
      LSERDY         : BDCR_LSERDY_Field := 16#0#;
      --  LSE oscillator bypass
      LSEBYP         : BDCR_LSEBYP_Field := 16#0#;
      --  LSE oscillator drive capability
      LSEDRV         : BDCR_LSEDRV_Field := 16#0#;
      --  CSS on LSE enable
      LSECSSON       : BDCR_LSECSSON_Field := 16#0#;
      --  Read-only. CSS on LSE failure Detection
      LSECSSD        : BDCR_LSECSSD_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.STM32.Bit := 16#0#;
      --  RTC clock source selection
      RTCSEL         : BDCR_RTCSEL_Field := 16#0#;
      --  unspecified
      Reserved_10_14 : Interfaces.STM32.UInt5 := 16#0#;
      --  RTC clock enable
      RTCEN          : BDCR_RTCEN_Field := 16#0#;
      --  RTC domain software reset
      BDRST          : BDCR_BDRST_Field := 16#0#;
      --  unspecified
      Reserved_17_23 : Interfaces.STM32.UInt7 := 16#0#;
      --  Low-speed clock output (LSCO) enable
      LSCOEN         : BDCR_LSCOEN_Field := 16#0#;
      --  Low-speed clock output selection
      LSCOSEL        : BDCR_LSCOSEL_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.STM32.UInt6 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for BDCR_Register use record
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

   subtype CSR_LSION_Field is Interfaces.STM32.Bit;
   subtype CSR_LSIRDY_Field is Interfaces.STM32.Bit;
   subtype CSR_RMVF_Field is Interfaces.STM32.Bit;
   subtype CSR_OBLRSTF_Field is Interfaces.STM32.Bit;
   subtype CSR_PINRSTF_Field is Interfaces.STM32.Bit;
   subtype CSR_PWRRSTF_Field is Interfaces.STM32.Bit;
   subtype CSR_SFTRSTF_Field is Interfaces.STM32.Bit;
   subtype CSR_IWDGRSTF_Field is Interfaces.STM32.Bit;
   subtype CSR_WWDGRSTF_Field is Interfaces.STM32.Bit;
   subtype CSR_LPWRRSTF_Field is Interfaces.STM32.Bit;

   --  Control/status register
   type CSR_Register is record
      --  LSI oscillator enable
      LSION          : CSR_LSION_Field := 16#0#;
      --  Read-only. LSI oscillator ready
      LSIRDY         : CSR_LSIRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_22  : Interfaces.STM32.UInt21 := 16#0#;
      --  Remove reset flags
      RMVF           : CSR_RMVF_Field := 16#0#;
      --  unspecified
      Reserved_24_24 : Interfaces.STM32.Bit := 16#0#;
      --  Read-only. Option byte loader reset flag
      OBLRSTF        : CSR_OBLRSTF_Field := 16#0#;
      --  Read-only. Pin reset flag
      PINRSTF        : CSR_PINRSTF_Field := 16#0#;
      --  Read-only. BOR or POR/PDR flag
      PWRRSTF        : CSR_PWRRSTF_Field := 16#0#;
      --  Read-only. Software reset flag
      SFTRSTF        : CSR_SFTRSTF_Field := 16#0#;
      --  Read-only. Independent window watchdog reset flag
      IWDGRSTF       : CSR_IWDGRSTF_Field := 16#0#;
      --  Read-only. Window watchdog reset flag
      WWDGRSTF       : CSR_WWDGRSTF_Field := 16#0#;
      --  Read-only. Low-power reset flag
      LPWRRSTF       : CSR_LPWRRSTF_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      LSION          at 0 range 0 .. 0;
      LSIRDY         at 0 range 1 .. 1;
      Reserved_2_22  at 0 range 2 .. 22;
      RMVF           at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      OBLRSTF        at 0 range 25 .. 25;
      PINRSTF        at 0 range 26 .. 26;
      PWRRSTF        at 0 range 27 .. 27;
      SFTRSTF        at 0 range 28 .. 28;
      IWDGRSTF       at 0 range 29 .. 29;
      WWDGRSTF       at 0 range 30 .. 30;
      LPWRRSTF       at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Reset and clock control
   type RCC_Peripheral is record
      --  Clock control register
      CR         : aliased CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Internal clock sources calibration register
      ICSCR      : aliased ICSCR_Register;
      pragma Volatile_Full_Access (ICSCR);
      --  Clock configuration register
      CFGR       : aliased CFGR_Register;
      pragma Volatile_Full_Access (CFGR);
      --  PLL configuration register
      PLLSYSCFGR : aliased PLLSYSCFGR_Register;
      pragma Volatile_Full_Access (PLLSYSCFGR);
      --  Clock interrupt enable register
      CIER       : aliased CIER_Register;
      pragma Volatile_Full_Access (CIER);
      --  Clock interrupt flag register
      CIFR       : aliased CIFR_Register;
      pragma Volatile_Full_Access (CIFR);
      --  Clock interrupt clear register
      CICR       : aliased CICR_Register;
      pragma Volatile_Full_Access (CICR);
      --  I/O port reset register
      IOPRSTR    : aliased IOPRSTR_Register;
      pragma Volatile_Full_Access (IOPRSTR);
      --  AHB peripheral reset register
      AHBRSTR    : aliased AHBRSTR_Register;
      pragma Volatile_Full_Access (AHBRSTR);
      --  APB peripheral reset register 1
      APBRSTR1   : aliased APBRSTR1_Register;
      pragma Volatile_Full_Access (APBRSTR1);
      --  APB peripheral reset register 2
      APBRSTR2   : aliased APBRSTR2_Register;
      pragma Volatile_Full_Access (APBRSTR2);
      --  GPIO clock enable register
      IOPENR     : aliased IOPENR_Register;
      pragma Volatile_Full_Access (IOPENR);
      --  AHB peripheral clock enable register
      AHBENR     : aliased AHBENR_Register;
      pragma Volatile_Full_Access (AHBENR);
      --  APB peripheral clock enable register 1
      APBENR1    : aliased APBENR1_Register;
      pragma Volatile_Full_Access (APBENR1);
      --  APB peripheral clock enable register 2
      APBENR2    : aliased APBENR2_Register;
      pragma Volatile_Full_Access (APBENR2);
      --  GPIO in Sleep mode clock enable register
      IOPSMENR   : aliased IOPSMENR_Register;
      pragma Volatile_Full_Access (IOPSMENR);
      --  AHB peripheral clock enable in Sleep mode register
      AHBSMENR   : aliased AHBSMENR_Register;
      pragma Volatile_Full_Access (AHBSMENR);
      --  APB peripheral clock enable in Sleep mode register 1
      APBSMENR1  : aliased APBSMENR1_Register;
      pragma Volatile_Full_Access (APBSMENR1);
      --  APB peripheral clock enable in Sleep mode register 2
      APBSMENR2  : aliased APBSMENR2_Register;
      pragma Volatile_Full_Access (APBSMENR2);
      --  Peripherals independent clock configuration register
      CCIPR      : aliased CCIPR_Register;
      pragma Volatile_Full_Access (CCIPR);
      --  Peripherals independent clock configuration register 2
      CCIPR2     : aliased CCIPR2_Register;
      pragma Volatile_Full_Access (CCIPR2);
      --  RTC domain control register
      BDCR       : aliased BDCR_Register;
      pragma Volatile_Full_Access (BDCR);
      --  Control/status register
      CSR        : aliased CSR_Register;
      pragma Volatile_Full_Access (CSR);
   end record
     with Volatile;

   for RCC_Peripheral use record
      CR         at 16#0# range 0 .. 31;
      ICSCR      at 16#4# range 0 .. 31;
      CFGR       at 16#8# range 0 .. 31;
      PLLSYSCFGR at 16#C# range 0 .. 31;
      CIER       at 16#18# range 0 .. 31;
      CIFR       at 16#1C# range 0 .. 31;
      CICR       at 16#20# range 0 .. 31;
      IOPRSTR    at 16#24# range 0 .. 31;
      AHBRSTR    at 16#28# range 0 .. 31;
      APBRSTR1   at 16#2C# range 0 .. 31;
      APBRSTR2   at 16#30# range 0 .. 31;
      IOPENR     at 16#34# range 0 .. 31;
      AHBENR     at 16#38# range 0 .. 31;
      APBENR1    at 16#3C# range 0 .. 31;
      APBENR2    at 16#40# range 0 .. 31;
      IOPSMENR   at 16#44# range 0 .. 31;
      AHBSMENR   at 16#48# range 0 .. 31;
      APBSMENR1  at 16#4C# range 0 .. 31;
      APBSMENR2  at 16#50# range 0 .. 31;
      CCIPR      at 16#54# range 0 .. 31;
      CCIPR2     at 16#58# range 0 .. 31;
      BDCR       at 16#5C# range 0 .. 31;
      CSR        at 16#60# range 0 .. 31;
   end record;

   --  Reset and clock control
   RCC_Periph : aliased RCC_Peripheral
     with Import, Address => RCC_Base;

end Interfaces.STM32.RCC;
