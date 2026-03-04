--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G473.svd

--  This is a version for the STM32G473 MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   --  System tick
   Sys_Tick_Interrupt          : constant Interrupt_ID := -1;

   --  Window Watchdog interrupt
   WWDG_Interrupt              : constant Interrupt_ID := 0;

   --  PVD through EXTI line detection
   PVD_PVM_Interrupt           : constant Interrupt_ID := 1;

   --  RTC_TAMP_CSS_LSE
   RTC_TAMP_CSS_LSE_Interrupt  : constant Interrupt_ID := 2;

   --  RTC Wakeup timer
   RTC_WKUP_Interrupt          : constant Interrupt_ID := 3;

   --  FLASH
   FLASH_Interrupt             : constant Interrupt_ID := 4;

   --  RCC global interrupt
   RCC_Interrupt               : constant Interrupt_ID := 5;

   --  EXTI Line0 interrupt
   EXTI0_Interrupt             : constant Interrupt_ID := 6;

   --  EXTI Line1 interrupt
   EXTI1_Interrupt             : constant Interrupt_ID := 7;

   --  EXTI Line2 interrupt
   EXTI2_Interrupt             : constant Interrupt_ID := 8;

   --  EXTI Line3 interrupt
   EXTI3_Interrupt             : constant Interrupt_ID := 9;

   --  EXTI Line4 interrupt
   EXTI4_Interrupt             : constant Interrupt_ID := 10;

   --  DMA1 channel 1 interrupt
   DMA1_CH1_Interrupt          : constant Interrupt_ID := 11;

   --  DMA1 channel 2 interrupt
   DMA1_CH2_Interrupt          : constant Interrupt_ID := 12;

   --  DMA1 channel 3 interrupt
   DMA1_CH3_Interrupt          : constant Interrupt_ID := 13;

   --  DMA1 channel 4 interrupt
   DMA1_CH4_Interrupt          : constant Interrupt_ID := 14;

   --  DMA1 channel 5 interrupt
   DMA1_CH5_Interrupt          : constant Interrupt_ID := 15;

   --  DMA1 channel 6 interrupt
   DMA1_CH6_Interrupt          : constant Interrupt_ID := 16;

   --  DMA1 channel 7 interrupt
   DMA1_CH7_Interrupt          : constant Interrupt_ID := 17;

   --  ADC1 and ADC2 global interrupt
   ADC1_2_Interrupt            : constant Interrupt_ID := 18;

   --  USB_HP
   USB_HP_Interrupt            : constant Interrupt_ID := 19;

   --  USB_LP
   USB_LP_Interrupt            : constant Interrupt_ID := 20;

   --  FDCAN1 interrupt 0
   FDCAN1_IT0_Interrupt        : constant Interrupt_ID := 21;

   --  FDCAN1 interrupt 1
   FDCAN1_IT1_Interrupt        : constant Interrupt_ID := 22;

   --  EXTI9_5
   EXTI9_5_Interrupt           : constant Interrupt_ID := 23;

   --  TIM1_BRK_TIM15
   TIM1_BRK_TIM15_Interrupt    : constant Interrupt_ID := 24;

   --  TIM1_UP_TIM16
   TIM1_UP_TIM16_Interrupt     : constant Interrupt_ID := 25;

   --  TIM1_TRG_COM/
   TIM1_TRG_COM_Interrupt      : constant Interrupt_ID := 26;

   --  TIM1 capture compare interrupt
   TIM1_CC_Interrupt           : constant Interrupt_ID := 27;

   --  TIM2
   TIM2_Interrupt              : constant Interrupt_ID := 28;

   --  TIM3
   TIM3_Interrupt              : constant Interrupt_ID := 29;

   --  TIM4
   TIM4_Interrupt              : constant Interrupt_ID := 30;

   --  I2C1_EV
   I2C1_EV_Interrupt           : constant Interrupt_ID := 31;

   --  I2C1_ER
   I2C1_ER_Interrupt           : constant Interrupt_ID := 32;

   --  I2C2_EV
   I2C2_EV_Interrupt           : constant Interrupt_ID := 33;

   --  I2C2_ER
   I2C2_ER_Interrupt           : constant Interrupt_ID := 34;

   --  SPI1
   SPI1_Interrupt              : constant Interrupt_ID := 35;

   --  SPI2
   SPI2_Interrupt              : constant Interrupt_ID := 36;

   --  USART1
   USART1_Interrupt            : constant Interrupt_ID := 37;

   --  USART2
   USART2_Interrupt            : constant Interrupt_ID := 38;

   --  USART3
   USART3_Interrupt            : constant Interrupt_ID := 39;

   --  EXTI15_10
   EXTI15_10_Interrupt         : constant Interrupt_ID := 40;

   --  RTC_ALARM
   RTC_ALARM_Interrupt         : constant Interrupt_ID := 41;

   --  USBWakeUP
   USBWakeUP_Interrupt         : constant Interrupt_ID := 42;

   --  TIM8_BRK
   TIM8_BRK_Interrupt          : constant Interrupt_ID := 43;

   --  TIM8_UP
   TIM8_UP_Interrupt           : constant Interrupt_ID := 44;

   --  TIM8_TRG_COM
   TIM8_TRG_COM_Interrupt      : constant Interrupt_ID := 45;

   --  TIM8_CC
   TIM8_CC_Interrupt           : constant Interrupt_ID := 46;

   --  ADC3
   ADC3_Interrupt              : constant Interrupt_ID := 47;

   --  FMC
   FMC_Interrupt               : constant Interrupt_ID := 48;

   --  LPTIM1
   LPTIM1_Interrupt            : constant Interrupt_ID := 49;

   --  TIM5
   TIM5_Interrupt              : constant Interrupt_ID := 50;

   --  SPI3
   SPI3_Interrupt              : constant Interrupt_ID := 51;

   --  UART4
   UART4_Interrupt             : constant Interrupt_ID := 52;

   --  UART5
   UART5_Interrupt             : constant Interrupt_ID := 53;

   --  TIM6_DACUNDER
   TIM6_DACUNDER_Interrupt     : constant Interrupt_ID := 54;

   --  TIM7
   TIM7_Interrupt              : constant Interrupt_ID := 55;

   --  DMA2_CH1
   DMA2_CH1_Interrupt          : constant Interrupt_ID := 56;

   --  DMA2_CH2
   DMA2_CH2_Interrupt          : constant Interrupt_ID := 57;

   --  DMA2_CH3
   DMA2_CH3_Interrupt          : constant Interrupt_ID := 58;

   --  DMA2_CH4
   DMA2_CH4_Interrupt          : constant Interrupt_ID := 59;

   --  DMA2_CH5
   DMA2_CH5_Interrupt          : constant Interrupt_ID := 60;

   --  ADC4
   ADC4_Interrupt              : constant Interrupt_ID := 61;

   --  ADC5
   ADC5_Interrupt              : constant Interrupt_ID := 62;

   --  UCPD1
   UCPD1_Interrupt             : constant Interrupt_ID := 63;

   --  COMP1_2_3
   COMP1_2_3_Interrupt         : constant Interrupt_ID := 64;

   --  COMP4_5_6
   COMP4_5_6_Interrupt         : constant Interrupt_ID := 65;

   --  COMP7
   COMP7_Interrupt             : constant Interrupt_ID := 66;

   --  CRS
   CRS_Interrupt               : constant Interrupt_ID := 75;

   --  SAI
   SAI_Interrupt               : constant Interrupt_ID := 76;

   --  TIM20_BRK
   TIM20_BRK_Interrupt         : constant Interrupt_ID := 77;

   --  TIM20_UP
   TIM20_UP_Interrupt          : constant Interrupt_ID := 78;

   --  TIM20_TRG_COM
   TIM20_TRG_COM_Interrupt     : constant Interrupt_ID := 79;

   --  TIM20_CC
   TIM20_CC_Interrupt          : constant Interrupt_ID := 80;

   --  FPU global interrupt
   FPU_Interrupt               : constant Interrupt_ID := 81;

   --  I2C4_EV
   I2C4_EV_Interrupt           : constant Interrupt_ID := 82;

   --  I2C4_ER
   I2C4_ER_Interrupt           : constant Interrupt_ID := 83;

   --  SPI4
   SPI4_Interrupt              : constant Interrupt_ID := 84;

   --  AES
   AES_Interrupt               : constant Interrupt_ID := 85;

   --  FDCAN2 interrupt 0
   FDCAN2_IT0_Interrupt        : constant Interrupt_ID := 86;

   --  FDCAN2 interrupt 1
   FDCAN2_IT1_Interrupt        : constant Interrupt_ID := 87;

   --  FDCAN3 interrupt 0
   FDCAN3_IT0_Interrupt        : constant Interrupt_ID := 88;

   --  FDCAN3 interrupt 1
   FDCAN3_IT1_Interrupt        : constant Interrupt_ID := 89;

   --  RNG
   RNG_Interrupt               : constant Interrupt_ID := 90;

   --  LPUART
   LPUART_Interrupt            : constant Interrupt_ID := 91;

   --  I2C3_EV
   I2C3_EV_Interrupt           : constant Interrupt_ID := 92;

   --  I2C3_ER
   I2C3_ER_Interrupt           : constant Interrupt_ID := 93;

   --  DMAMUX_OVR
   DMAMUX_OVR_Interrupt        : constant Interrupt_ID := 94;

   --  QUADSPI
   QUADSPI_Interrupt           : constant Interrupt_ID := 95;

   --  DMA1_CH8
   DMA1_CH8_Interrupt          : constant Interrupt_ID := 96;

   --  DMA2_CH6
   DMA2_CH6_Interrupt          : constant Interrupt_ID := 97;

   --  DMA2_CH7
   DMA2_CH7_Interrupt          : constant Interrupt_ID := 98;

   --  DMA2_CH8
   DMA2_CH8_Interrupt          : constant Interrupt_ID := 99;

   --  Cordic
   Cordic_Interrupt            : constant Interrupt_ID := 100;

   --  FMAC
   FMAC_Interrupt              : constant Interrupt_ID := 101;

end Ada.Interrupts.Names;
