--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from RP2350.svd


with System;

package Interfaces.RP2350.RESETS is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype RESET_ADC_Field is Interfaces.RP2350.Bit;
   subtype RESET_BUSCTRL_Field is Interfaces.RP2350.Bit;
   subtype RESET_DMA_Field is Interfaces.RP2350.Bit;
   subtype RESET_HSTX_Field is Interfaces.RP2350.Bit;
   --  RESET_I2C array element
   subtype RESET_I2C_Element is Interfaces.RP2350.Bit;

   --  RESET_I2C array
   type RESET_I2C_Field_Array is array (0 .. 1) of RESET_I2C_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_I2C
   type RESET_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  I2C as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  I2C as an array
            Arr : RESET_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RESET_IO_BANK0_Field is Interfaces.RP2350.Bit;
   subtype RESET_IO_QSPI_Field is Interfaces.RP2350.Bit;
   subtype RESET_JTAG_Field is Interfaces.RP2350.Bit;
   subtype RESET_PADS_BANK0_Field is Interfaces.RP2350.Bit;
   subtype RESET_PADS_QSPI_Field is Interfaces.RP2350.Bit;
   --  RESET_PIO array element
   subtype RESET_PIO_Element is Interfaces.RP2350.Bit;

   --  RESET_PIO array
   type RESET_PIO_Field_Array is array (0 .. 2) of RESET_PIO_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for RESET_PIO
   type RESET_PIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIO as a value
            Val : Interfaces.RP2350.UInt3;
         when True =>
            --  PIO as an array
            Arr : RESET_PIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for RESET_PIO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   subtype RESET_PLL_SYS_Field is Interfaces.RP2350.Bit;
   subtype RESET_PLL_USB_Field is Interfaces.RP2350.Bit;
   subtype RESET_PWM_Field is Interfaces.RP2350.Bit;
   subtype RESET_SHA256_Field is Interfaces.RP2350.Bit;
   --  RESET_SPI array element
   subtype RESET_SPI_Element is Interfaces.RP2350.Bit;

   --  RESET_SPI array
   type RESET_SPI_Field_Array is array (0 .. 1) of RESET_SPI_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_SPI
   type RESET_SPI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SPI as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  SPI as an array
            Arr : RESET_SPI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_SPI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RESET_SYSCFG_Field is Interfaces.RP2350.Bit;
   subtype RESET_SYSINFO_Field is Interfaces.RP2350.Bit;
   subtype RESET_TBMAN_Field is Interfaces.RP2350.Bit;
   --  RESET_TIMER array element
   subtype RESET_TIMER_Element is Interfaces.RP2350.Bit;

   --  RESET_TIMER array
   type RESET_TIMER_Field_Array is array (0 .. 1) of RESET_TIMER_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_TIMER
   type RESET_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TIMER as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  TIMER as an array
            Arr : RESET_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_TIMER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RESET_TRNG_Field is Interfaces.RP2350.Bit;
   --  RESET_UART array element
   subtype RESET_UART_Element is Interfaces.RP2350.Bit;

   --  RESET_UART array
   type RESET_UART_Field_Array is array (0 .. 1) of RESET_UART_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_UART
   type RESET_UART_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UART as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  UART as an array
            Arr : RESET_UART_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_UART_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RESET_USBCTRL_Field is Interfaces.RP2350.Bit;

   type RESET_Register is record
      ADC            : RESET_ADC_Field := 16#1#;
      BUSCTRL        : RESET_BUSCTRL_Field := 16#1#;
      DMA            : RESET_DMA_Field := 16#1#;
      HSTX           : RESET_HSTX_Field := 16#1#;
      I2C            : RESET_I2C_Field := (As_Array => False, Val => 16#1#);
      IO_BANK0       : RESET_IO_BANK0_Field := 16#1#;
      IO_QSPI        : RESET_IO_QSPI_Field := 16#1#;
      JTAG           : RESET_JTAG_Field := 16#1#;
      PADS_BANK0     : RESET_PADS_BANK0_Field := 16#1#;
      PADS_QSPI      : RESET_PADS_QSPI_Field := 16#1#;
      PIO            : RESET_PIO_Field := (As_Array => False, Val => 16#1#);
      PLL_SYS        : RESET_PLL_SYS_Field := 16#1#;
      PLL_USB        : RESET_PLL_USB_Field := 16#1#;
      PWM            : RESET_PWM_Field := 16#1#;
      SHA256         : RESET_SHA256_Field := 16#1#;
      SPI            : RESET_SPI_Field := (As_Array => False, Val => 16#1#);
      SYSCFG         : RESET_SYSCFG_Field := 16#1#;
      SYSINFO        : RESET_SYSINFO_Field := 16#1#;
      TBMAN          : RESET_TBMAN_Field := 16#1#;
      TIMER          : RESET_TIMER_Field := (As_Array => False, Val => 16#1#);
      TRNG           : RESET_TRNG_Field := 16#1#;
      UART           : RESET_UART_Field := (As_Array => False, Val => 16#1#);
      USBCTRL        : RESET_USBCTRL_Field := 16#1#;
      --  unspecified
      Reserved_29_31 : Interfaces.RP2350.UInt3 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RESET_Register use record
      ADC            at 0 range 0 .. 0;
      BUSCTRL        at 0 range 1 .. 1;
      DMA            at 0 range 2 .. 2;
      HSTX           at 0 range 3 .. 3;
      I2C            at 0 range 4 .. 5;
      IO_BANK0       at 0 range 6 .. 6;
      IO_QSPI        at 0 range 7 .. 7;
      JTAG           at 0 range 8 .. 8;
      PADS_BANK0     at 0 range 9 .. 9;
      PADS_QSPI      at 0 range 10 .. 10;
      PIO            at 0 range 11 .. 13;
      PLL_SYS        at 0 range 14 .. 14;
      PLL_USB        at 0 range 15 .. 15;
      PWM            at 0 range 16 .. 16;
      SHA256         at 0 range 17 .. 17;
      SPI            at 0 range 18 .. 19;
      SYSCFG         at 0 range 20 .. 20;
      SYSINFO        at 0 range 21 .. 21;
      TBMAN          at 0 range 22 .. 22;
      TIMER          at 0 range 23 .. 24;
      TRNG           at 0 range 25 .. 25;
      UART           at 0 range 26 .. 27;
      USBCTRL        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype WDSEL_ADC_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_BUSCTRL_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_DMA_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_HSTX_Field is Interfaces.RP2350.Bit;
   --  WDSEL_I2C array element
   subtype WDSEL_I2C_Element is Interfaces.RP2350.Bit;

   --  WDSEL_I2C array
   type WDSEL_I2C_Field_Array is array (0 .. 1) of WDSEL_I2C_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_I2C
   type WDSEL_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  I2C as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  I2C as an array
            Arr : WDSEL_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype WDSEL_IO_BANK0_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_IO_QSPI_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_JTAG_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_PADS_BANK0_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_PADS_QSPI_Field is Interfaces.RP2350.Bit;
   --  WDSEL_PIO array element
   subtype WDSEL_PIO_Element is Interfaces.RP2350.Bit;

   --  WDSEL_PIO array
   type WDSEL_PIO_Field_Array is array (0 .. 2) of WDSEL_PIO_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for WDSEL_PIO
   type WDSEL_PIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIO as a value
            Val : Interfaces.RP2350.UInt3;
         when True =>
            --  PIO as an array
            Arr : WDSEL_PIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for WDSEL_PIO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   subtype WDSEL_PLL_SYS_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_PLL_USB_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_PWM_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_SHA256_Field is Interfaces.RP2350.Bit;
   --  WDSEL_SPI array element
   subtype WDSEL_SPI_Element is Interfaces.RP2350.Bit;

   --  WDSEL_SPI array
   type WDSEL_SPI_Field_Array is array (0 .. 1) of WDSEL_SPI_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_SPI
   type WDSEL_SPI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SPI as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  SPI as an array
            Arr : WDSEL_SPI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_SPI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype WDSEL_SYSCFG_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_SYSINFO_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_TBMAN_Field is Interfaces.RP2350.Bit;
   --  WDSEL_TIMER array element
   subtype WDSEL_TIMER_Element is Interfaces.RP2350.Bit;

   --  WDSEL_TIMER array
   type WDSEL_TIMER_Field_Array is array (0 .. 1) of WDSEL_TIMER_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_TIMER
   type WDSEL_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TIMER as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  TIMER as an array
            Arr : WDSEL_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_TIMER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype WDSEL_TRNG_Field is Interfaces.RP2350.Bit;
   --  WDSEL_UART array element
   subtype WDSEL_UART_Element is Interfaces.RP2350.Bit;

   --  WDSEL_UART array
   type WDSEL_UART_Field_Array is array (0 .. 1) of WDSEL_UART_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_UART
   type WDSEL_UART_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UART as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  UART as an array
            Arr : WDSEL_UART_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_UART_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype WDSEL_USBCTRL_Field is Interfaces.RP2350.Bit;

   type WDSEL_Register is record
      ADC            : WDSEL_ADC_Field := 16#0#;
      BUSCTRL        : WDSEL_BUSCTRL_Field := 16#0#;
      DMA            : WDSEL_DMA_Field := 16#0#;
      HSTX           : WDSEL_HSTX_Field := 16#0#;
      I2C            : WDSEL_I2C_Field := (As_Array => False, Val => 16#0#);
      IO_BANK0       : WDSEL_IO_BANK0_Field := 16#0#;
      IO_QSPI        : WDSEL_IO_QSPI_Field := 16#0#;
      JTAG           : WDSEL_JTAG_Field := 16#0#;
      PADS_BANK0     : WDSEL_PADS_BANK0_Field := 16#0#;
      PADS_QSPI      : WDSEL_PADS_QSPI_Field := 16#0#;
      PIO            : WDSEL_PIO_Field := (As_Array => False, Val => 16#0#);
      PLL_SYS        : WDSEL_PLL_SYS_Field := 16#0#;
      PLL_USB        : WDSEL_PLL_USB_Field := 16#0#;
      PWM            : WDSEL_PWM_Field := 16#0#;
      SHA256         : WDSEL_SHA256_Field := 16#0#;
      SPI            : WDSEL_SPI_Field := (As_Array => False, Val => 16#0#);
      SYSCFG         : WDSEL_SYSCFG_Field := 16#0#;
      SYSINFO        : WDSEL_SYSINFO_Field := 16#0#;
      TBMAN          : WDSEL_TBMAN_Field := 16#0#;
      TIMER          : WDSEL_TIMER_Field := (As_Array => False, Val => 16#0#);
      TRNG           : WDSEL_TRNG_Field := 16#0#;
      UART           : WDSEL_UART_Field := (As_Array => False, Val => 16#0#);
      USBCTRL        : WDSEL_USBCTRL_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.RP2350.UInt3 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WDSEL_Register use record
      ADC            at 0 range 0 .. 0;
      BUSCTRL        at 0 range 1 .. 1;
      DMA            at 0 range 2 .. 2;
      HSTX           at 0 range 3 .. 3;
      I2C            at 0 range 4 .. 5;
      IO_BANK0       at 0 range 6 .. 6;
      IO_QSPI        at 0 range 7 .. 7;
      JTAG           at 0 range 8 .. 8;
      PADS_BANK0     at 0 range 9 .. 9;
      PADS_QSPI      at 0 range 10 .. 10;
      PIO            at 0 range 11 .. 13;
      PLL_SYS        at 0 range 14 .. 14;
      PLL_USB        at 0 range 15 .. 15;
      PWM            at 0 range 16 .. 16;
      SHA256         at 0 range 17 .. 17;
      SPI            at 0 range 18 .. 19;
      SYSCFG         at 0 range 20 .. 20;
      SYSINFO        at 0 range 21 .. 21;
      TBMAN          at 0 range 22 .. 22;
      TIMER          at 0 range 23 .. 24;
      TRNG           at 0 range 25 .. 25;
      UART           at 0 range 26 .. 27;
      USBCTRL        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype RESET_DONE_ADC_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_BUSCTRL_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_DMA_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_HSTX_Field is Interfaces.RP2350.Bit;
   --  RESET_DONE_I2C array element
   subtype RESET_DONE_I2C_Element is Interfaces.RP2350.Bit;

   --  RESET_DONE_I2C array
   type RESET_DONE_I2C_Field_Array is array (0 .. 1)
     of RESET_DONE_I2C_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_I2C
   type RESET_DONE_I2C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  I2C as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  I2C as an array
            Arr : RESET_DONE_I2C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_I2C_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RESET_DONE_IO_BANK0_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_IO_QSPI_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_JTAG_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_PADS_BANK0_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_PADS_QSPI_Field is Interfaces.RP2350.Bit;
   --  RESET_DONE_PIO array element
   subtype RESET_DONE_PIO_Element is Interfaces.RP2350.Bit;

   --  RESET_DONE_PIO array
   type RESET_DONE_PIO_Field_Array is array (0 .. 2)
     of RESET_DONE_PIO_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for RESET_DONE_PIO
   type RESET_DONE_PIO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIO as a value
            Val : Interfaces.RP2350.UInt3;
         when True =>
            --  PIO as an array
            Arr : RESET_DONE_PIO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for RESET_DONE_PIO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   subtype RESET_DONE_PLL_SYS_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_PLL_USB_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_PWM_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_SHA256_Field is Interfaces.RP2350.Bit;
   --  RESET_DONE_SPI array element
   subtype RESET_DONE_SPI_Element is Interfaces.RP2350.Bit;

   --  RESET_DONE_SPI array
   type RESET_DONE_SPI_Field_Array is array (0 .. 1)
     of RESET_DONE_SPI_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_SPI
   type RESET_DONE_SPI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SPI as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  SPI as an array
            Arr : RESET_DONE_SPI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_SPI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RESET_DONE_SYSCFG_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_SYSINFO_Field is Interfaces.RP2350.Bit;
   subtype RESET_DONE_TBMAN_Field is Interfaces.RP2350.Bit;
   --  RESET_DONE_TIMER array element
   subtype RESET_DONE_TIMER_Element is Interfaces.RP2350.Bit;

   --  RESET_DONE_TIMER array
   type RESET_DONE_TIMER_Field_Array is array (0 .. 1)
     of RESET_DONE_TIMER_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_TIMER
   type RESET_DONE_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TIMER as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  TIMER as an array
            Arr : RESET_DONE_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_TIMER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RESET_DONE_TRNG_Field is Interfaces.RP2350.Bit;
   --  RESET_DONE_UART array element
   subtype RESET_DONE_UART_Element is Interfaces.RP2350.Bit;

   --  RESET_DONE_UART array
   type RESET_DONE_UART_Field_Array is array (0 .. 1)
     of RESET_DONE_UART_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RESET_DONE_UART
   type RESET_DONE_UART_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UART as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  UART as an array
            Arr : RESET_DONE_UART_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESET_DONE_UART_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RESET_DONE_USBCTRL_Field is Interfaces.RP2350.Bit;

   type RESET_DONE_Register is record
      --  Read-only.
      ADC            : RESET_DONE_ADC_Field;
      --  Read-only.
      BUSCTRL        : RESET_DONE_BUSCTRL_Field;
      --  Read-only.
      DMA            : RESET_DONE_DMA_Field;
      --  Read-only.
      HSTX           : RESET_DONE_HSTX_Field;
      --  Read-only.
      I2C            : RESET_DONE_I2C_Field;
      --  Read-only.
      IO_BANK0       : RESET_DONE_IO_BANK0_Field;
      --  Read-only.
      IO_QSPI        : RESET_DONE_IO_QSPI_Field;
      --  Read-only.
      JTAG           : RESET_DONE_JTAG_Field;
      --  Read-only.
      PADS_BANK0     : RESET_DONE_PADS_BANK0_Field;
      --  Read-only.
      PADS_QSPI      : RESET_DONE_PADS_QSPI_Field;
      --  Read-only.
      PIO            : RESET_DONE_PIO_Field;
      --  Read-only.
      PLL_SYS        : RESET_DONE_PLL_SYS_Field;
      --  Read-only.
      PLL_USB        : RESET_DONE_PLL_USB_Field;
      --  Read-only.
      PWM            : RESET_DONE_PWM_Field;
      --  Read-only.
      SHA256         : RESET_DONE_SHA256_Field;
      --  Read-only.
      SPI            : RESET_DONE_SPI_Field;
      --  Read-only.
      SYSCFG         : RESET_DONE_SYSCFG_Field;
      --  Read-only.
      SYSINFO        : RESET_DONE_SYSINFO_Field;
      --  Read-only.
      TBMAN          : RESET_DONE_TBMAN_Field;
      --  Read-only.
      TIMER          : RESET_DONE_TIMER_Field;
      --  Read-only.
      TRNG           : RESET_DONE_TRNG_Field;
      --  Read-only.
      UART           : RESET_DONE_UART_Field;
      --  Read-only.
      USBCTRL        : RESET_DONE_USBCTRL_Field;
      --  unspecified
      Reserved_29_31 : Interfaces.RP2350.UInt3;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RESET_DONE_Register use record
      ADC            at 0 range 0 .. 0;
      BUSCTRL        at 0 range 1 .. 1;
      DMA            at 0 range 2 .. 2;
      HSTX           at 0 range 3 .. 3;
      I2C            at 0 range 4 .. 5;
      IO_BANK0       at 0 range 6 .. 6;
      IO_QSPI        at 0 range 7 .. 7;
      JTAG           at 0 range 8 .. 8;
      PADS_BANK0     at 0 range 9 .. 9;
      PADS_QSPI      at 0 range 10 .. 10;
      PIO            at 0 range 11 .. 13;
      PLL_SYS        at 0 range 14 .. 14;
      PLL_USB        at 0 range 15 .. 15;
      PWM            at 0 range 16 .. 16;
      SHA256         at 0 range 17 .. 17;
      SPI            at 0 range 18 .. 19;
      SYSCFG         at 0 range 20 .. 20;
      SYSINFO        at 0 range 21 .. 21;
      TBMAN          at 0 range 22 .. 22;
      TIMER          at 0 range 23 .. 24;
      TRNG           at 0 range 25 .. 25;
      UART           at 0 range 26 .. 27;
      USBCTRL        at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type RESETS_Peripheral is record
      RESET      : aliased RESET_Register;
      pragma Volatile_Full_Access (RESET);
      WDSEL      : aliased WDSEL_Register;
      pragma Volatile_Full_Access (WDSEL);
      RESET_DONE : aliased RESET_DONE_Register;
      pragma Volatile_Full_Access (RESET_DONE);
   end record
     with Volatile;

   for RESETS_Peripheral use record
      RESET      at 16#0# range 0 .. 31;
      WDSEL      at 16#4# range 0 .. 31;
      RESET_DONE at 16#8# range 0 .. 31;
   end record;

   RESETS_Periph : aliased RESETS_Peripheral
     with Import, Address => RESETS_Base;

end Interfaces.RP2350.RESETS;
