--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from RP2350.svd


with System;

package Interfaces.RP2350.PSM is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype FRCE_ON_PROC_COLD_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_OTP_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_ROSC_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_XOSC_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_RESETS_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_CLOCKS_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_PSM_READY_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_BUSFABRIC_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_ROM_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_BOOTRAM_Field is Interfaces.RP2350.Bit;
   --  FRCE_ON_SRAM array element
   subtype FRCE_ON_SRAM_Element is Interfaces.RP2350.Bit;

   --  FRCE_ON_SRAM array
   type FRCE_ON_SRAM_Field_Array is array (0 .. 9) of FRCE_ON_SRAM_Element
     with Component_Size => 1, Size => 10;

   --  Type definition for FRCE_ON_SRAM
   type FRCE_ON_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : Interfaces.RP2350.UInt10;
         when True =>
            --  SRAM as an array
            Arr : FRCE_ON_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for FRCE_ON_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   subtype FRCE_ON_XIP_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_SIO_Field is Interfaces.RP2350.Bit;
   subtype FRCE_ON_ACCESSCTRL_Field is Interfaces.RP2350.Bit;
   --  FRCE_ON_PROC array element
   subtype FRCE_ON_PROC_Element is Interfaces.RP2350.Bit;

   --  FRCE_ON_PROC array
   type FRCE_ON_PROC_Field_Array is array (0 .. 1) of FRCE_ON_PROC_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for FRCE_ON_PROC
   type FRCE_ON_PROC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROC as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  PROC as an array
            Arr : FRCE_ON_PROC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for FRCE_ON_PROC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Force block out of reset (i.e. power it on)
   type FRCE_ON_Register is record
      PROC_COLD      : FRCE_ON_PROC_COLD_Field := 16#0#;
      OTP            : FRCE_ON_OTP_Field := 16#0#;
      ROSC           : FRCE_ON_ROSC_Field := 16#0#;
      XOSC           : FRCE_ON_XOSC_Field := 16#0#;
      RESETS         : FRCE_ON_RESETS_Field := 16#0#;
      CLOCKS         : FRCE_ON_CLOCKS_Field := 16#0#;
      PSM_READY      : FRCE_ON_PSM_READY_Field := 16#0#;
      BUSFABRIC      : FRCE_ON_BUSFABRIC_Field := 16#0#;
      ROM            : FRCE_ON_ROM_Field := 16#0#;
      BOOTRAM        : FRCE_ON_BOOTRAM_Field := 16#0#;
      SRAM           : FRCE_ON_SRAM_Field :=
                        (As_Array => False, Val => 16#0#);
      XIP            : FRCE_ON_XIP_Field := 16#0#;
      SIO            : FRCE_ON_SIO_Field := 16#0#;
      ACCESSCTRL     : FRCE_ON_ACCESSCTRL_Field := 16#0#;
      PROC           : FRCE_ON_PROC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_25_31 : Interfaces.RP2350.UInt7 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for FRCE_ON_Register use record
      PROC_COLD      at 0 range 0 .. 0;
      OTP            at 0 range 1 .. 1;
      ROSC           at 0 range 2 .. 2;
      XOSC           at 0 range 3 .. 3;
      RESETS         at 0 range 4 .. 4;
      CLOCKS         at 0 range 5 .. 5;
      PSM_READY      at 0 range 6 .. 6;
      BUSFABRIC      at 0 range 7 .. 7;
      ROM            at 0 range 8 .. 8;
      BOOTRAM        at 0 range 9 .. 9;
      SRAM           at 0 range 10 .. 19;
      XIP            at 0 range 20 .. 20;
      SIO            at 0 range 21 .. 21;
      ACCESSCTRL     at 0 range 22 .. 22;
      PROC           at 0 range 23 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype FRCE_OFF_PROC_COLD_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_OTP_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_ROSC_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_XOSC_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_RESETS_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_CLOCKS_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_PSM_READY_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_BUSFABRIC_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_ROM_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_BOOTRAM_Field is Interfaces.RP2350.Bit;
   --  FRCE_OFF_SRAM array element
   subtype FRCE_OFF_SRAM_Element is Interfaces.RP2350.Bit;

   --  FRCE_OFF_SRAM array
   type FRCE_OFF_SRAM_Field_Array is array (0 .. 9) of FRCE_OFF_SRAM_Element
     with Component_Size => 1, Size => 10;

   --  Type definition for FRCE_OFF_SRAM
   type FRCE_OFF_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : Interfaces.RP2350.UInt10;
         when True =>
            --  SRAM as an array
            Arr : FRCE_OFF_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for FRCE_OFF_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   subtype FRCE_OFF_XIP_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_SIO_Field is Interfaces.RP2350.Bit;
   subtype FRCE_OFF_ACCESSCTRL_Field is Interfaces.RP2350.Bit;
   --  FRCE_OFF_PROC array element
   subtype FRCE_OFF_PROC_Element is Interfaces.RP2350.Bit;

   --  FRCE_OFF_PROC array
   type FRCE_OFF_PROC_Field_Array is array (0 .. 1) of FRCE_OFF_PROC_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for FRCE_OFF_PROC
   type FRCE_OFF_PROC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROC as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  PROC as an array
            Arr : FRCE_OFF_PROC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for FRCE_OFF_PROC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Force into reset (i.e. power it off)
   type FRCE_OFF_Register is record
      PROC_COLD      : FRCE_OFF_PROC_COLD_Field := 16#0#;
      OTP            : FRCE_OFF_OTP_Field := 16#0#;
      ROSC           : FRCE_OFF_ROSC_Field := 16#0#;
      XOSC           : FRCE_OFF_XOSC_Field := 16#0#;
      RESETS         : FRCE_OFF_RESETS_Field := 16#0#;
      CLOCKS         : FRCE_OFF_CLOCKS_Field := 16#0#;
      PSM_READY      : FRCE_OFF_PSM_READY_Field := 16#0#;
      BUSFABRIC      : FRCE_OFF_BUSFABRIC_Field := 16#0#;
      ROM            : FRCE_OFF_ROM_Field := 16#0#;
      BOOTRAM        : FRCE_OFF_BOOTRAM_Field := 16#0#;
      SRAM           : FRCE_OFF_SRAM_Field :=
                        (As_Array => False, Val => 16#0#);
      XIP            : FRCE_OFF_XIP_Field := 16#0#;
      SIO            : FRCE_OFF_SIO_Field := 16#0#;
      ACCESSCTRL     : FRCE_OFF_ACCESSCTRL_Field := 16#0#;
      PROC           : FRCE_OFF_PROC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_25_31 : Interfaces.RP2350.UInt7 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for FRCE_OFF_Register use record
      PROC_COLD      at 0 range 0 .. 0;
      OTP            at 0 range 1 .. 1;
      ROSC           at 0 range 2 .. 2;
      XOSC           at 0 range 3 .. 3;
      RESETS         at 0 range 4 .. 4;
      CLOCKS         at 0 range 5 .. 5;
      PSM_READY      at 0 range 6 .. 6;
      BUSFABRIC      at 0 range 7 .. 7;
      ROM            at 0 range 8 .. 8;
      BOOTRAM        at 0 range 9 .. 9;
      SRAM           at 0 range 10 .. 19;
      XIP            at 0 range 20 .. 20;
      SIO            at 0 range 21 .. 21;
      ACCESSCTRL     at 0 range 22 .. 22;
      PROC           at 0 range 23 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype WDSEL_PROC_COLD_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_OTP_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_ROSC_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_XOSC_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_RESETS_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_CLOCKS_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_PSM_READY_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_BUSFABRIC_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_ROM_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_BOOTRAM_Field is Interfaces.RP2350.Bit;
   --  WDSEL_SRAM array element
   subtype WDSEL_SRAM_Element is Interfaces.RP2350.Bit;

   --  WDSEL_SRAM array
   type WDSEL_SRAM_Field_Array is array (0 .. 9) of WDSEL_SRAM_Element
     with Component_Size => 1, Size => 10;

   --  Type definition for WDSEL_SRAM
   type WDSEL_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : Interfaces.RP2350.UInt10;
         when True =>
            --  SRAM as an array
            Arr : WDSEL_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for WDSEL_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   subtype WDSEL_XIP_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_SIO_Field is Interfaces.RP2350.Bit;
   subtype WDSEL_ACCESSCTRL_Field is Interfaces.RP2350.Bit;
   --  WDSEL_PROC array element
   subtype WDSEL_PROC_Element is Interfaces.RP2350.Bit;

   --  WDSEL_PROC array
   type WDSEL_PROC_Field_Array is array (0 .. 1) of WDSEL_PROC_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for WDSEL_PROC
   type WDSEL_PROC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROC as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  PROC as an array
            Arr : WDSEL_PROC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDSEL_PROC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Set to 1 if the watchdog should reset this
   type WDSEL_Register is record
      PROC_COLD      : WDSEL_PROC_COLD_Field := 16#0#;
      OTP            : WDSEL_OTP_Field := 16#0#;
      ROSC           : WDSEL_ROSC_Field := 16#0#;
      XOSC           : WDSEL_XOSC_Field := 16#0#;
      RESETS         : WDSEL_RESETS_Field := 16#0#;
      CLOCKS         : WDSEL_CLOCKS_Field := 16#0#;
      PSM_READY      : WDSEL_PSM_READY_Field := 16#0#;
      BUSFABRIC      : WDSEL_BUSFABRIC_Field := 16#0#;
      ROM            : WDSEL_ROM_Field := 16#0#;
      BOOTRAM        : WDSEL_BOOTRAM_Field := 16#0#;
      SRAM           : WDSEL_SRAM_Field := (As_Array => False, Val => 16#0#);
      XIP            : WDSEL_XIP_Field := 16#0#;
      SIO            : WDSEL_SIO_Field := 16#0#;
      ACCESSCTRL     : WDSEL_ACCESSCTRL_Field := 16#0#;
      PROC           : WDSEL_PROC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_25_31 : Interfaces.RP2350.UInt7 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WDSEL_Register use record
      PROC_COLD      at 0 range 0 .. 0;
      OTP            at 0 range 1 .. 1;
      ROSC           at 0 range 2 .. 2;
      XOSC           at 0 range 3 .. 3;
      RESETS         at 0 range 4 .. 4;
      CLOCKS         at 0 range 5 .. 5;
      PSM_READY      at 0 range 6 .. 6;
      BUSFABRIC      at 0 range 7 .. 7;
      ROM            at 0 range 8 .. 8;
      BOOTRAM        at 0 range 9 .. 9;
      SRAM           at 0 range 10 .. 19;
      XIP            at 0 range 20 .. 20;
      SIO            at 0 range 21 .. 21;
      ACCESSCTRL     at 0 range 22 .. 22;
      PROC           at 0 range 23 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype DONE_PROC_COLD_Field is Interfaces.RP2350.Bit;
   subtype DONE_OTP_Field is Interfaces.RP2350.Bit;
   subtype DONE_ROSC_Field is Interfaces.RP2350.Bit;
   subtype DONE_XOSC_Field is Interfaces.RP2350.Bit;
   subtype DONE_RESETS_Field is Interfaces.RP2350.Bit;
   subtype DONE_CLOCKS_Field is Interfaces.RP2350.Bit;
   subtype DONE_PSM_READY_Field is Interfaces.RP2350.Bit;
   subtype DONE_BUSFABRIC_Field is Interfaces.RP2350.Bit;
   subtype DONE_ROM_Field is Interfaces.RP2350.Bit;
   subtype DONE_BOOTRAM_Field is Interfaces.RP2350.Bit;
   --  DONE_SRAM array element
   subtype DONE_SRAM_Element is Interfaces.RP2350.Bit;

   --  DONE_SRAM array
   type DONE_SRAM_Field_Array is array (0 .. 9) of DONE_SRAM_Element
     with Component_Size => 1, Size => 10;

   --  Type definition for DONE_SRAM
   type DONE_SRAM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SRAM as a value
            Val : Interfaces.RP2350.UInt10;
         when True =>
            --  SRAM as an array
            Arr : DONE_SRAM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for DONE_SRAM_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   subtype DONE_XIP_Field is Interfaces.RP2350.Bit;
   subtype DONE_SIO_Field is Interfaces.RP2350.Bit;
   subtype DONE_ACCESSCTRL_Field is Interfaces.RP2350.Bit;
   --  DONE_PROC array element
   subtype DONE_PROC_Element is Interfaces.RP2350.Bit;

   --  DONE_PROC array
   type DONE_PROC_Field_Array is array (0 .. 1) of DONE_PROC_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for DONE_PROC
   type DONE_PROC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROC as a value
            Val : Interfaces.RP2350.UInt2;
         when True =>
            --  PROC as an array
            Arr : DONE_PROC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DONE_PROC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Is the subsystem ready?
   type DONE_Register is record
      --  Read-only.
      PROC_COLD      : DONE_PROC_COLD_Field;
      --  Read-only.
      OTP            : DONE_OTP_Field;
      --  Read-only.
      ROSC           : DONE_ROSC_Field;
      --  Read-only.
      XOSC           : DONE_XOSC_Field;
      --  Read-only.
      RESETS         : DONE_RESETS_Field;
      --  Read-only.
      CLOCKS         : DONE_CLOCKS_Field;
      --  Read-only.
      PSM_READY      : DONE_PSM_READY_Field;
      --  Read-only.
      BUSFABRIC      : DONE_BUSFABRIC_Field;
      --  Read-only.
      ROM            : DONE_ROM_Field;
      --  Read-only.
      BOOTRAM        : DONE_BOOTRAM_Field;
      --  Read-only.
      SRAM           : DONE_SRAM_Field;
      --  Read-only.
      XIP            : DONE_XIP_Field;
      --  Read-only.
      SIO            : DONE_SIO_Field;
      --  Read-only.
      ACCESSCTRL     : DONE_ACCESSCTRL_Field;
      --  Read-only.
      PROC           : DONE_PROC_Field;
      --  unspecified
      Reserved_25_31 : Interfaces.RP2350.UInt7;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DONE_Register use record
      PROC_COLD      at 0 range 0 .. 0;
      OTP            at 0 range 1 .. 1;
      ROSC           at 0 range 2 .. 2;
      XOSC           at 0 range 3 .. 3;
      RESETS         at 0 range 4 .. 4;
      CLOCKS         at 0 range 5 .. 5;
      PSM_READY      at 0 range 6 .. 6;
      BUSFABRIC      at 0 range 7 .. 7;
      ROM            at 0 range 8 .. 8;
      BOOTRAM        at 0 range 9 .. 9;
      SRAM           at 0 range 10 .. 19;
      XIP            at 0 range 20 .. 20;
      SIO            at 0 range 21 .. 21;
      ACCESSCTRL     at 0 range 22 .. 22;
      PROC           at 0 range 23 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type PSM_Peripheral is record
      --  Force block out of reset (i.e. power it on)
      FRCE_ON  : aliased FRCE_ON_Register;
      pragma Volatile_Full_Access (FRCE_ON);
      --  Force into reset (i.e. power it off)
      FRCE_OFF : aliased FRCE_OFF_Register;
      pragma Volatile_Full_Access (FRCE_OFF);
      --  Set to 1 if the watchdog should reset this
      WDSEL    : aliased WDSEL_Register;
      pragma Volatile_Full_Access (WDSEL);
      --  Is the subsystem ready?
      DONE     : aliased DONE_Register;
      pragma Volatile_Full_Access (DONE);
   end record
     with Volatile;

   for PSM_Peripheral use record
      FRCE_ON  at 16#0# range 0 .. 31;
      FRCE_OFF at 16#4# range 0 .. 31;
      WDSEL    at 16#8# range 0 .. 31;
      DONE     at 16#C# range 0 .. 31;
   end record;

   PSM_Periph : aliased PSM_Peripheral
     with Import, Address => PSM_Base;

end Interfaces.RP2350.PSM;
