--
--  Copyright (C) 2025, AdaCore
--

pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from RP2350.svd


with System;

--  Controls the crystal oscillator
package Interfaces.RP2350.XOSC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  The 12-bit code is intended to give some protection against accidental
   --  writes. An invalid setting will retain the previous value. The actual
   --  value being used can be read from STATUS_FREQ_RANGE
   type CTRL_FREQ_RANGE_Field is
     (--  Reset value for the field
      CTRL_FREQ_RANGE_Field_Reset,
      Val_1_15MHZ,
      Val_10_30MHZ,
      Val_25_60MHZ,
      Val_40_100MHZ)
     with Size => 12;
   for CTRL_FREQ_RANGE_Field use
     (CTRL_FREQ_RANGE_Field_Reset => 0,
      Val_1_15MHZ => 2720,
      Val_10_30MHZ => 2721,
      Val_25_60MHZ => 2722,
      Val_40_100MHZ => 2723);

   --  On power-up this field is initialised to DISABLE and the chip runs from
   --  the ROSC. If the chip has subsequently been programmed to run from the
   --  XOSC then setting this field to DISABLE may lock-up the chip. If this is
   --  a concern then run the clk_ref from the ROSC and enable the clk_sys
   --  RESUS feature. The 12-bit code is intended to give some protection
   --  against accidental writes. An invalid setting will retain the previous
   --  value. The actual value being used can be read from STATUS_ENABLED
   type CTRL_ENABLE_Field is
     (--  Reset value for the field
      CTRL_ENABLE_Field_Reset,
      DISABLE,
      ENABLE)
     with Size => 12;
   for CTRL_ENABLE_Field use
     (CTRL_ENABLE_Field_Reset => 0,
      DISABLE => 3358,
      ENABLE => 4011);

   --  Crystal Oscillator Control
   type CTRL_Register is record
      --  The 12-bit code is intended to give some protection against
      --  accidental writes. An invalid setting will retain the previous value.
      --  The actual value being used can be read from STATUS_FREQ_RANGE
      FREQ_RANGE     : CTRL_FREQ_RANGE_Field := CTRL_FREQ_RANGE_Field_Reset;
      --  On power-up this field is initialised to DISABLE and the chip runs
      --  from the ROSC. If the chip has subsequently been programmed to run
      --  from the XOSC then setting this field to DISABLE may lock-up the
      --  chip. If this is a concern then run the clk_ref from the ROSC and
      --  enable the clk_sys RESUS feature. The 12-bit code is intended to give
      --  some protection against accidental writes. An invalid setting will
      --  retain the previous value. The actual value being used can be read
      --  from STATUS_ENABLED
      ENABLE         : CTRL_ENABLE_Field := CTRL_ENABLE_Field_Reset;
      --  unspecified
      Reserved_24_31 : Interfaces.RP2350.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      FREQ_RANGE     at 0 range 0 .. 11;
      ENABLE         at 0 range 12 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  The current frequency range setting
   type STATUS_FREQ_RANGE_Field is
     (Val_1_15MHZ,
      Val_10_30MHZ,
      Val_25_60MHZ,
      Val_40_100MHZ)
     with Size => 2;
   for STATUS_FREQ_RANGE_Field use
     (Val_1_15MHZ => 0,
      Val_10_30MHZ => 1,
      Val_25_60MHZ => 2,
      Val_40_100MHZ => 3);

   subtype STATUS_ENABLED_Field is Interfaces.RP2350.Bit;
   subtype STATUS_BADWRITE_Field is Interfaces.RP2350.Bit;
   subtype STATUS_STABLE_Field is Interfaces.RP2350.Bit;

   --  Crystal Oscillator Status
   type STATUS_Register is record
      --  Read-only. The current frequency range setting
      FREQ_RANGE     : STATUS_FREQ_RANGE_Field :=
                        Interfaces.RP2350.XOSC.Val_1_15MHZ;
      --  unspecified
      Reserved_2_11  : Interfaces.RP2350.UInt10 := 16#0#;
      --  Read-only. Oscillator is enabled but not necessarily running and
      --  stable, resets to 0
      ENABLED        : STATUS_ENABLED_Field := 16#0#;
      --  unspecified
      Reserved_13_23 : Interfaces.RP2350.UInt11 := 16#0#;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. An invalid value has been written to CTRL_ENABLE or
      --  CTRL_FREQ_RANGE or DORMANT
      BADWRITE       : STATUS_BADWRITE_Field := 16#0#;
      --  unspecified
      Reserved_25_30 : Interfaces.RP2350.UInt6 := 16#0#;
      --  Read-only. Oscillator is running and stable
      STABLE         : STATUS_STABLE_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for STATUS_Register use record
      FREQ_RANGE     at 0 range 0 .. 1;
      Reserved_2_11  at 0 range 2 .. 11;
      ENABLED        at 0 range 12 .. 12;
      Reserved_13_23 at 0 range 13 .. 23;
      BADWRITE       at 0 range 24 .. 24;
      Reserved_25_30 at 0 range 25 .. 30;
      STABLE         at 0 range 31 .. 31;
   end record;

   subtype STARTUP_DELAY_Field is Interfaces.RP2350.UInt14;
   subtype STARTUP_X4_Field is Interfaces.RP2350.Bit;

   --  Controls the startup delay
   type STARTUP_Register is record
      --  in multiples of 256*xtal_period. The reset value of 0xc4 corresponds
      --  to approx 50 000 cycles.
      DELAY_k        : STARTUP_DELAY_Field := 16#0#;
      --  unspecified
      Reserved_14_19 : Interfaces.RP2350.UInt6 := 16#0#;
      --  Multiplies the startup_delay by 4, just in case. The reset value is
      --  controlled by a mask-programmable tiecell and is provided in case we
      --  are booting from XOSC and the default startup delay is insufficient.
      --  The reset value is 0x0.
      X4             : STARTUP_X4_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : Interfaces.RP2350.UInt11 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for STARTUP_Register use record
      DELAY_k        at 0 range 0 .. 13;
      Reserved_14_19 at 0 range 14 .. 19;
      X4             at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype COUNT_COUNT_Field is Interfaces.RP2350.UInt16;

   --  A down counter running at the xosc frequency which counts to zero and
   --  stops. Can be used for short software pauses when setting up time
   --  sensitive hardware. To start the counter, write a non-zero value. Reads
   --  will return 1 while the count is running and 0 when it has finished.
   --  Minimum count value is 4. Count values <4 will be treated as count value
   --  =4. Note that synchronisation to the register clock domain costs 2
   --  register clock cycles and the counter cannot compensate for that.
   type COUNT_Register is record
      COUNT          : COUNT_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.RP2350.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for COUNT_Register use record
      COUNT          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Controls the crystal oscillator
   type XOSC_Peripheral is record
      --  Crystal Oscillator Control
      CTRL    : aliased CTRL_Register;
      pragma Volatile_Full_Access (CTRL);
      --  Crystal Oscillator Status
      STATUS  : aliased STATUS_Register;
      pragma Volatile_Full_Access (STATUS);
      --  Crystal Oscillator pause control
      DORMANT : aliased Interfaces.RP2350.UInt32;
      --  Controls the startup delay
      STARTUP : aliased STARTUP_Register;
      pragma Volatile_Full_Access (STARTUP);
      --  A down counter running at the xosc frequency which counts to zero and
      --  stops. Can be used for short software pauses when setting up time
      --  sensitive hardware. To start the counter, write a non-zero value.
      --  Reads will return 1 while the count is running and 0 when it has
      --  finished. Minimum count value is 4. Count values <4 will be treated
      --  as count value =4. Note that synchronisation to the register clock
      --  domain costs 2 register clock cycles and the counter cannot
      --  compensate for that.
      COUNT   : aliased COUNT_Register;
      pragma Volatile_Full_Access (COUNT);
   end record
     with Volatile;

   for XOSC_Peripheral use record
      CTRL    at 16#0# range 0 .. 31;
      STATUS  at 16#4# range 0 .. 31;
      DORMANT at 16#8# range 0 .. 31;
      STARTUP at 16#C# range 0 .. 31;
      COUNT   at 16#10# range 0 .. 31;
   end record;

   --  Controls the crystal oscillator
   XOSC_Periph : aliased XOSC_Peripheral
     with Import, Address => XOSC_Base;

end Interfaces.RP2350.XOSC;
