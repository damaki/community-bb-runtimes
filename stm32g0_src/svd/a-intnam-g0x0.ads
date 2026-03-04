--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32G0B0.svd

--  This is a version for the STM32G0B0 MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   --  System tick
   Sys_Tick_Interrupt                                          : constant Interrupt_ID := -1;

   --  Window watchdog interrupt
   WWDG_Interrupt                                              : constant Interrupt_ID := 0;

   --  RTC and TAMP interrupts
   RTC_STAMP_Interrupt                                         : constant Interrupt_ID := 2;

   --  Flash global interrupt
   FLASH_Interrupt                                             : constant Interrupt_ID := 3;

   --  RCC global interrupt
   RCC_Interrupt                                               : constant Interrupt_ID := 4;

   --  EXTI line 0 and 1 interrupt
   EXTI0_1_Interrupt                                           : constant Interrupt_ID := 5;

   --  EXTI line 2 and 3 interrupt
   EXTI2_3_Interrupt                                           : constant Interrupt_ID := 6;

   --  EXTI line 4 to 15 interrupt
   EXTI4_15_Interrupt                                          : constant Interrupt_ID := 7;

   --  DMA channel 1 interrupt
   DMA1_Channel1_Interrupt                                     : constant Interrupt_ID := 9;

   --  DMA channel 2 and 3 interrupts
   DMA1_Channel2_3_Interrupt                                   : constant Interrupt_ID := 10;

   --  DMA channel 2 and 3 interrupts
   DMA1_Channel4_5_6_7_DMAMUX_DMA2_Channel1_2_3_4_5_Interrupt  : constant Interrupt_ID := 11;

   --  ADC interrupt (ADC combined with EXTI 17 and 18)
   ADC_Interrupt                                               : constant Interrupt_ID := 12;

   --  TIM1 break, update, trigger
   TIM1_BRK_UP_TRG_COM_Interrupt                               : constant Interrupt_ID := 13;

   --  TIM1 Capture Compare interrupt
   TIM1_CC_Interrupt                                           : constant Interrupt_ID := 14;

   --  TIM3 global interrupt
   TIM3_TIM4_Interrupt                                         : constant Interrupt_ID := 16;

   --  TIM6 + LPTIM1 and DAC global interrupt
   TIM6_DAC_Interrupt                                          : constant Interrupt_ID := 17;

   --  TIM7 + LPTIM2 global interrupt
   TIM7_Interrupt                                              : constant Interrupt_ID := 18;

   --  TIM14 global interrupt
   TIM14_Interrupt                                             : constant Interrupt_ID := 19;

   --  Timer 15 global interrupt
   TIM15_Interrupt                                             : constant Interrupt_ID := 20;

   --  TIM16 global interrupt
   TIM16_Interrupt                                             : constant Interrupt_ID := 21;

   --  TIM17 global interrupt
   TIM17_Interrupt                                             : constant Interrupt_ID := 22;

   --  I2C1 global interrupt
   I2C1_Interrupt                                              : constant Interrupt_ID := 23;

   --  I2C2/I2C3 global interrupt
   I2C2_Interrupt                                              : constant Interrupt_ID := 24;

   --  SPI1 global interrupt
   SPI1_Interrupt                                              : constant Interrupt_ID := 25;

   --  SPI2/SPI3 global interrupt
   SPI2_SPI3_Interrupt                                         : constant Interrupt_ID := 26;

   --  USART1 global interrupt
   USART1_Interrupt                                            : constant Interrupt_ID := 27;

   --  USART2 global interrupt
   USART2_Interrupt                                            : constant Interrupt_ID := 28;

   --  USART3,4,5,6 global interrupt
   USART3_USART4_USART5_USART6_LPUART1_Interrupt               : constant Interrupt_ID := 29;

   --  FPU global interrupt
   FPU_Interrupt                                               : constant Interrupt_ID := 81;

end Ada.Interrupts.Names;
