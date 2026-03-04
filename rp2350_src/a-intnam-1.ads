--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from RP2350.svd

--  This is a version for the
--          Dual Cortex-M33 or Hazard3 processors at 150MHz
--          520kB on-chip SRAM, in 10 independent banks
--          Extended low-power sleep states with optional SRAM retention: as
--  low as 10uA DVDD
--          8kB of one-time-programmable storage (OTP)
--          Up to 16MB of external QSPI flash/PSRAM via dedicated QSPI bus
--              Additional 16MB flash/PSRAM accessible via optional second
--  chip-select
--          On-chip switched-mode power supply to generate core voltage
--              Low-quiescent-current LDO mode can be enabled for sleep states
--          2x on-chip PLLs for internal or external clock generation
--          GPIOs are 5V-tolerant (powered), and 3.3V-failsafe (unpowered)
--          Security features:
--              Optional boot signing, enforced by on-chip mask ROM, with key
--  fingerprint in OTP
--              Protected OTP storage for optional boot decryption key
--              Global bus filtering based on Arm or RISC-V security/privilege
--  levels
--              Peripherals, GPIOs and DMA channels individually assignable to
--  security domains
--              Hardware mitigations for fault injection attacks
--              Hardware SHA-256 accelerator
--          Peripherals:
--              2x UARTs
--              2x SPI controllers
--              2x I2C controllers
--              24x PWM channels
--              USB 1.1 controller and PHY, with host and device support
--              12x PIO state machines
--              1x HSTX peripheral
--       MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   --  System tick
   TIMER0_IRQ_0_Interrupt_CPU_1      : constant Interrupt_ID := 0;
   TIMER0_IRQ_1_Interrupt_CPU_1      : constant Interrupt_ID := 1;
   TIMER0_IRQ_2_Interrupt_CPU_1      : constant Interrupt_ID := 2;
   TIMER0_IRQ_3_Interrupt_CPU_1      : constant Interrupt_ID := 3;
   TIMER1_IRQ_0_Interrupt_CPU_1      : constant Interrupt_ID := 4;
   TIMER1_IRQ_1_Interrupt_CPU_1      : constant Interrupt_ID := 5;
   TIMER1_IRQ_2_Interrupt_CPU_1      : constant Interrupt_ID := 6;
   TIMER1_IRQ_3_Interrupt_CPU_1      : constant Interrupt_ID := 7;
   PWM_IRQ_WRAP_0_Interrupt_CPU_1    : constant Interrupt_ID := 8;
   PWM_IRQ_WRAP_1_Interrupt_CPU_1    : constant Interrupt_ID := 9;
   DMA_IRQ_0_Interrupt_CPU_1         : constant Interrupt_ID := 10;
   DMA_IRQ_1_Interrupt_CPU_1         : constant Interrupt_ID := 11;
   DMA_IRQ_2_Interrupt_CPU_1         : constant Interrupt_ID := 12;
   DMA_IRQ_3_Interrupt_CPU_1         : constant Interrupt_ID := 13;
   USBCTRL_Interrupt_CPU_1           : constant Interrupt_ID := 14;
   PIO0_IRQ_0_Interrupt_CPU_1        : constant Interrupt_ID := 15;
   PIO0_IRQ_1_Interrupt_CPU_1        : constant Interrupt_ID := 16;
   PIO1_IRQ_0_Interrupt_CPU_1        : constant Interrupt_ID := 17;
   PIO1_IRQ_1_Interrupt_CPU_1        : constant Interrupt_ID := 18;
   PIO2_IRQ_0_Interrupt_CPU_1        : constant Interrupt_ID := 19;
   PIO2_IRQ_1_Interrupt_CPU_1        : constant Interrupt_ID := 20;
   IO_IRQ_BANK0_Interrupt_CPU_1      : constant Interrupt_ID := 21;
   IO_IRQ_BANK0_NS_Interrupt_CPU_1   : constant Interrupt_ID := 22;
   IO_IRQ_QSPI_Interrupt_CPU_1       : constant Interrupt_ID := 23;
   IO_IRQ_QSPI_NS_Interrupt_CPU_1    : constant Interrupt_ID := 24;
   SIO_IRQ_FIFO_Interrupt_CPU_1      : constant Interrupt_ID := 25;
   SIO_IRQ_BELL_Interrupt_CPU_1      : constant Interrupt_ID := 26;
   SIO_IRQ_FIFO_NS_Interrupt_CPU_1   : constant Interrupt_ID := 27;
   SIO_IRQ_BELL_NS_Interrupt_CPU_1   : constant Interrupt_ID := 28;
   SIO_IRQ_MTIMECMP_Interrupt_CPU_1  : constant Interrupt_ID := 29;
   CLOCKS_Interrupt_CPU_1            : constant Interrupt_ID := 30;
   SPI0_Interrupt_CPU_1              : constant Interrupt_ID := 31;
   SPI1_Interrupt_CPU_1              : constant Interrupt_ID := 32;
   UART0_Interrupt_CPU_1             : constant Interrupt_ID := 33;
   UART1_Interrupt_CPU_1             : constant Interrupt_ID := 34;
   ADC_IRQ_FIFO_Interrupt_CPU_1      : constant Interrupt_ID := 35;
   I2C0_Interrupt_CPU_1              : constant Interrupt_ID := 36;
   I2C1_Interrupt_CPU_1              : constant Interrupt_ID := 37;
   OTP_Interrupt_CPU_1               : constant Interrupt_ID := 38;
   TRNG_Interrupt_CPU_1              : constant Interrupt_ID := 39;
   PLL_SYS_Interrupt_CPU_1           : constant Interrupt_ID := 42;
   PLL_USB_Interrupt_CPU_1           : constant Interrupt_ID := 43;
   POWMAN_IRQ_POW_Interrupt_CPU_1    : constant Interrupt_ID := 44;
   POWMAN_IRQ_TIMER_Interrupt_CPU_1  : constant Interrupt_ID := 45;
   SPARE_IRQ_0_Interrupt_CPU_1       : constant Interrupt_ID := 46;
   SPARE_IRQ_1_Interrupt_CPU_1       : constant Interrupt_ID := 47;
   SPARE_IRQ_2_Interrupt_CPU_1       : constant Interrupt_ID := 48;
   SPARE_IRQ_3_Interrupt_CPU_1       : constant Interrupt_ID := 49;
   SPARE_IRQ_4_Interrupt_CPU_1       : constant Interrupt_ID := 50;
   SPARE_IRQ_5_Interrupt_CPU_1       : constant Interrupt_ID := 51;

end Ada.Interrupts.Names;
