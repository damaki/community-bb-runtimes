------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--            S Y S T E M . B B . B O A R D _ P A R A M E T E R S           --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--                      Copyright (C) 2021, AdaCore                         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
-- The port of GNARL to bare board targets was initially developed by the   --
-- Real-Time Systems Group at the Technical University of Madrid.           --
--                                                                          --
------------------------------------------------------------------------------
pragma Restrictions (No_Elaboration_Code);

with RP2040_Runtime_Config;

package System.BB.Board_Parameters is
   pragma Pure;

   use type RP2040_Runtime_Config.Board_Kind;

   ----------------------------
   -- Clock frequency ranges --
   ----------------------------

   subtype Hertz is Natural range 0 .. 2_000_000_000;

   subtype ROSC_Frequency_Range is Hertz range 1_800_000 .. 12_000_000;
   --  During boot the ROSC runs at a nominal 6.5 MHz and is guaranteed to be
   --  in the range 1.8 MHz to 12 MHz.

   subtype XOSC_Frequency_Range is Hertz
     with Static_Predicate =>
       XOSC_Frequency_Range in 0 | 1_000_000 .. 15_000_000;
   --  The RP2040 supports 1 MHz to 15 MHz cystals.
   --
   --  The special value 0 indicates that the XOSC is not available.

   subtype FOUTVCO_Frequency_Range is Hertz
   range 400_000_000 .. 1_600_000_000;
   --  PLL oscillator frequency (FOUTVCO) must be in the range
   --  400 MHz to 1600 MHz.

   subtype Clk_Sys_Frequency_Range is Hertz range 0 .. 133_000_000;
   --  Maximum frequency of clk_sys is 133 MHz.

   subtype Clk_USB_Frequency_Range is Hertz range 48_000_000 .. 48_000_000;
   --  clk_usb frequency must be 48 MHz.

   subtype FBDIV_Range is Natural range 16 .. 320;
   --  Feedback divider (FBDIV) range

   subtype POSTDIV_Range is Natural range 1 .. 7;
   --  Post divider (POSTDIV1 and POSTDIV2) ranges.

   ----------------------------
   -- Oscillator frequencies --
   ----------------------------

   ROSC_Frequency : constant ROSC_Frequency_Range := 12_000_000;
   --  ROSC can vary from 1 .. 12 MHz. Assume that ROSC is running at the
   --  maximum ROSC frequency to avoid unintentional overclocking.
   --
   --  TODO: measure ROSC with the internal frequency counter and temperature
   --        sensor, then update this value before enabling PLLs
   --  2.15.2.1.1. Mitigating ROSC frequency variation due to process

   -------------------------
   -- Clock configuration --
   -------------------------

   Has_XOSC  : constant Boolean :=
     (RP2040_Runtime_Config.Board /= RP2040_Runtime_Config.generic_board
      or else RP2040_Runtime_Config.XOSC_Frequency > 0);
   --  True if the XOSC is used.
   --
   --  All non-generic boards have an XOSC. For the generic board, assume the
   --  XOSC is not present when the configured XOSC_Frequency is 0.

   XOSC_Startup_Delay_Mult : constant :=
     (case RP2040_Runtime_Config.Board is
        when RP2040_Runtime_Config.generic_board               =>
           RP2040_Runtime_Config.XOSC_Startup_Delay_Mult,

        when RP2040_Runtime_Config.rpi_pico                    => 1,
        when RP2040_Runtime_Config.adafruit_feather_rp2040     => 64,
        when RP2040_Runtime_Config.adafruit_itsybitsy_rp2040   => 64,
        when RP2040_Runtime_Config.adafruit_macropad_rp2040    => 64,
        when RP2040_Runtime_Config.adafruit_qt2040_trinkey     => 64,
        when RP2040_Runtime_Config.adafruit_qtpy_rp2040        => 64,
        when RP2040_Runtime_Config.arduino_nano_rp2040_connect => 1,
        when RP2040_Runtime_Config.pimoroni_interstate75       => 1,
        when RP2040_Runtime_Config.pimoroni_keybow2040         => 1,
        when RP2040_Runtime_Config.pimoroni_pga2040            => 1,
        when RP2040_Runtime_Config.pimoroni_picolipo_4m        => 1,
        when RP2040_Runtime_Config.pimoroni_picolipo_16m       => 1,
        when RP2040_Runtime_Config.pimoroni_picosystem         => 1,
        when RP2040_Runtime_Config.pimoroni_plasma2040         => 1,
        when RP2040_Runtime_Config.pimoroni_tiny2040           => 1,
        when RP2040_Runtime_Config.sparkfun_micromod           => 1,
        when RP2040_Runtime_Config.sparkfun_promicro           => 1,
        when RP2040_Runtime_Config.sparkfun_thingplus          => 1);
   --  Multiplier to increase the XOSC startup delay for slow-starting
   --  oscillators.

   Reference : constant Hertz := (if Has_XOSC
                                  then RP2040_Runtime_Config.XOSC_Frequency
                                  else ROSC_Frequency);
   --  Reference frequency depends on the oscillator used.

   --  pll_sys configuration
   --  clk_sys = ((fref / refdiv) * vco_multiple) / (postdiv1 * postdiv2)

   Clk_Sys_Frequency : constant Clk_Sys_Frequency_Range :=
     (((Reference / RP2040_Runtime_Config.PLL_Sys_Reference_Div)
       * RP2040_Runtime_Config.PLL_Sys_VCO_Multiple)
      / (RP2040_Runtime_Config.PLL_Sys_Post_Div_1
         * RP2040_Runtime_Config.PLL_Sys_Post_Div_2));

   --  pll_usb configuration
   --  clk_usb = ((fref / refdiv) * vco_multiple) / (postdiv1 * postdiv2)

   Clk_USB_Frequency : constant Clk_USB_Frequency_Range :=
     (((Reference / RP2040_Runtime_Config.PLL_USB_Reference_Div)
       * RP2040_Runtime_Config.PLL_USB_VCO_Multiple)
      / (RP2040_Runtime_Config.PLL_USB_Post_Div_1
         * RP2040_Runtime_Config.PLL_USB_Post_Div_2));

   --------------------
   -- Hardware clock --
   --------------------

   Main_Clock_Frequency : constant Hertz := 1_000_000;
   --  Frequency of the clock that is used to implement Ada semantics for time,
   --  i.e. delay statements and package Ada.Real_Time.
   --
   --  This runtime uses one of the timer peripherals, which run at 1 MHz.

end System.BB.Board_Parameters;
