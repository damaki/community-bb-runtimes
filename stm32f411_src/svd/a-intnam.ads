--  pragma Style_Checks (Off);

--  Definition of the device's interrupts
package Ada.Interrupts.Names is

   ----------------
   -- Interrupts --
   ----------------

   --  Window Watchdog interrupt
   WWDG_Interrupt                : constant Interrupt_ID := 0;

   --  EXTI Line 16 interrupt / PVD through EXTI
   PVD_Interrupt                 : constant Interrupt_ID := 1;

   --  Tamper and TimeStamp interrupts through
   TAMP_STAMP_Interrupt          : constant Interrupt_ID := 2;

   --  RTC Wakeup interrupt through the EXTI line
   RTC_WKUP_Interrupt            : constant Interrupt_ID := 3;

   --  FLASH global interrupt
   FLASH_Interrupt               : constant Interrupt_ID := 4;

   --  RCC global interrupt
   RCC_Interrupt                 : constant Interrupt_ID := 5;

   --  EXTI Line0 interrupt
   EXTI0_Interrupt               : constant Interrupt_ID := 6;

   --  EXTI Line1 interrupt
   EXTI1_Interrupt               : constant Interrupt_ID := 7;

   --  EXTI Line2 interrupt
   EXTI2_Interrupt               : constant Interrupt_ID := 8;

   --  EXTI Line3 interrupt
   EXTI3_Interrupt               : constant Interrupt_ID := 9;

   --  EXTI Line4 interrupt
   EXTI4_Interrupt               : constant Interrupt_ID := 10;

   --  DMA1 Stream0 global interrupt
   DMA1_Stream0_Interrupt        : constant Interrupt_ID := 11;

   --  DMA1 Stream1 global interrupt
   DMA1_Stream1_Interrupt        : constant Interrupt_ID := 12;

   --  DMA1 Stream2 global interrupt
   DMA1_Stream2_Interrupt        : constant Interrupt_ID := 13;

   --  DMA1 Stream3 global interrupt
   DMA1_Stream3_Interrupt        : constant Interrupt_ID := 14;

   --  DMA1 Stream4 global interrupt
   DMA1_Stream4_Interrupt        : constant Interrupt_ID := 15;

   --  DMA1 Stream5 global interrupt
   DMA1_Stream5_Interrupt        : constant Interrupt_ID := 16;

   --  DMA1 Stream6 global interrupt
   DMA1_Stream6_Interrupt        : constant Interrupt_ID := 17;

   --  ADC1 global interrupt
   ADC_Interrupt                 : constant Interrupt_ID := 18;

   --  EXTI Line[9:5] interrupts
   EXTI9_5_Interrupt             : constant Interrupt_ID := 23;

   --  TIM1 Break interrupt and TIM9 global interrupt
   TIM1_BRK_TIM9_Interrupt       : constant Interrupt_ID := 24;

   --  TIM1 Update interrupt and TIM10 global interrupt
   TIM1_UP_TIM10_Interrupt       : constant Interrupt_ID := 25;

   --  TIM1 Trigger and Commutation interrupts and TIM11 global interrupt
   TIM1_TRG_COM_TIM11_Interrupt  : constant Interrupt_ID := 26;

   --  TIM1 Capture Compare interrupt
   TIM1_CC_Interrupt             : constant Interrupt_ID := 27;

   --  TIM2 global interrupt
   TIM2_Interrupt                : constant Interrupt_ID := 28;

   --  TIM3 global interrupt
   TIM3_Interrupt                : constant Interrupt_ID := 29;

   --  TIM4 global interrupt
   TIM4_Interrupt                : constant Interrupt_ID := 30;

   --  I2C1 event interrupt
   I2C1_EV_Interrupt             : constant Interrupt_ID := 31;

   --  I2C1 error interrupt
   I2C1_ER_Interrupt             : constant Interrupt_ID := 32;

   --  I2C2 event interrupt
   I2C2_EV_Interrupt             : constant Interrupt_ID := 33;

   --  I2C2 error interrupt
   I2C2_ER_Interrupt             : constant Interrupt_ID := 34;

   --  SPI1 global interrupt
   SPI1_Interrupt                : constant Interrupt_ID := 35;

   --  SPI2 global interrupt
   SPI2_Interrupt                : constant Interrupt_ID := 36;

   --  USART1 global interrupt
   USART1_Interrupt              : constant Interrupt_ID := 37;

   --  USART2 global interrupt
   USART2_Interrupt              : constant Interrupt_ID := 38;

   --  EXTI Line[15:10] interrupts
   EXTI15_10_Interrupt           : constant Interrupt_ID := 40;

   --  RTC Alarms (A and B) through EXTI line interrupt
   RTC_Alarm_Interrupt           : constant Interrupt_ID := 41;

   --  USB On-The-Go FS Wakeup through EXTI line interrupt
   OTG_FS_WKUP_Interrupt         : constant Interrupt_ID := 42;

   --  DMA1 Stream7 global interrupt
   DMA1_Stream7_Interrupt        : constant Interrupt_ID := 47;

   --  SDIO global interrupt
   SDIO_Interrupt                : constant Interrupt_ID := 49;

   --  TIM5 global interrupt
   TIM5_Interrupt                : constant Interrupt_ID := 50;

   --  SPI3 global interrupt
   SPI3_Interrupt                : constant Interrupt_ID := 51;

   --  DMA2 Stream0 global interrupt
   DMA2_Stream0_Interrupt        : constant Interrupt_ID := 56;

   --  DMA2 Stream1 global interrupt
   DMA2_Stream1_Interrupt        : constant Interrupt_ID := 57;

   --  DMA2 Stream2 global interrupt
   DMA2_Stream2_Interrupt        : constant Interrupt_ID := 58;

   --  DMA2 Stream3 global interrupt
   DMA2_Stream3_Interrupt        : constant Interrupt_ID := 59;

   --  DMA2 Stream4 global interrupt
   DMA2_Stream4_Interrupt        : constant Interrupt_ID := 60;

   --  USB On The Go FS global interrupt
   OTG_FS_Interrupt              : constant Interrupt_ID := 67;

   --  DMA2 Stream5 global interrupt
   DMA2_Stream5_Interrupt        : constant Interrupt_ID := 68;

   --  DMA2 Stream6 global interrupt
   DMA2_Stream6_Interrupt        : constant Interrupt_ID := 69;

   --  DMA2 Stream7 global interrupt
   DMA2_Stream7_Interrupt        : constant Interrupt_ID := 70;

   --  USART6 global interrupt
   USART6_Interrupt              : constant Interrupt_ID := 71;

   --  I2C3 event interrupt
   I2C3_EV_Interrupt             : constant Interrupt_ID := 72;

   --  I2C3 error interrupt
   I2C3_ER_Interrupt             : constant Interrupt_ID := 73;

   --  FPU interrupt
   FPU_Interrupt                 : constant Interrupt_ID := 81;

   --  SPI 4 global interrupt
   SPI4_Interrupt                : constant Interrupt_ID := 84;

   --  SPI 5 global interrupt
   SPI5_Interrupt                : constant Interrupt_ID := 85;

end Ada.Interrupts.Names;
