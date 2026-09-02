------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--            S Y S T E M . B B . B O A R D _ P A R A M E T E R S           --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--                    Copyright (C) 2012-2026, AdaCore                      --
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

--  This package defines board parameters for the STM32F4 family

with STM32F4xx_Runtime_Config;

package System.BB.Board_Parameters is
   pragma Pure;

   --------------------
   -- Hardware clock --
   --------------------

   HSI_Freq : constant := 16_000_000;
   HSE_Freq : constant := STM32F4xx_Runtime_Config.HSE_Clock_Frequency;
   LSE_Freq : constant := 32_768;
   LSI_Freq : constant := 32_000; --  varies 17 .. 47 kHz, see datasheet

   --  PLL configuration. See RM0383 section 6.3.2 "PLL configuration
   --  register (RCC_PLLCFGR)".

   type PLL_Input_Range is range 1_000_000 ..   2_000_000;
   type PLL_VCO_Range   is range 100_000_000 .. 432_000_000;
   type PLL_Q_Range     is range 1_000_000 ..   48_000_000;

   --  The PLL P output (SYSCLK) is capped at 100 MHz on STM32F411 (RM0383),
   --  but 168 MHz on STM32F405/407/415/417 (RM0090, no over-drive).

   type PLL_P_Range is range 24_000_000 ..
     (case STM32F4xx_Runtime_Config.MCU_Sub_Family is
        when STM32F4xx_Runtime_Config.F411 => 100_000_000,
        when STM32F4xx_Runtime_Config.F407
           | STM32F4xx_Runtime_Config.F417 => 168_000_000);

   PLL_IN_Freq : constant :=
     (case STM32F4xx_Runtime_Config.PLL_Src is
        when STM32F4xx_Runtime_Config.HSI => HSI_Freq,
        when STM32F4xx_Runtime_Config.HSE => HSE_Freq);

   PLL_VCO_Freq : constant :=
     (PLL_IN_Freq * STM32F4xx_Runtime_Config.PLL_N_Mul)
     / STM32F4xx_Runtime_Config.PLL_M_Div;

   PLL_P_Freq : constant :=
     PLL_VCO_Freq /
       (case STM32F4xx_Runtime_Config.PLL_P_Div is
          when STM32F4xx_Runtime_Config.DIV2 => 2,
          when STM32F4xx_Runtime_Config.DIV4 => 4,
          when STM32F4xx_Runtime_Config.DIV6 => 6,
          when STM32F4xx_Runtime_Config.DIV8 => 8);

   PLL_Q_Freq : constant :=
     PLL_VCO_Freq / STM32F4xx_Runtime_Config.PLL_Q_Div;

   SYSCLK_Freq : constant :=
     (case STM32F4xx_Runtime_Config.SYSCLK_Src is
        when STM32F4xx_Runtime_Config.HSE => HSE_Freq,
        when STM32F4xx_Runtime_Config.PLL => PLL_P_Freq,
        when STM32F4xx_Runtime_Config.HSI => HSI_Freq);

   HCLK_Freq : constant :=
     SYSCLK_Freq / (case STM32F4xx_Runtime_Config.AHB_Pre is
                      when STM32F4xx_Runtime_Config.DIV1   => 1,
                      when STM32F4xx_Runtime_Config.DIV2   => 2,
                      when STM32F4xx_Runtime_Config.DIV4   => 4,
                      when STM32F4xx_Runtime_Config.DIV8   => 8,
                      when STM32F4xx_Runtime_Config.DIV16  => 16,
                      when STM32F4xx_Runtime_Config.DIV64  => 64,
                      when STM32F4xx_Runtime_Config.DIV128 => 128,
                      when STM32F4xx_Runtime_Config.DIV256 => 256,
                      when STM32F4xx_Runtime_Config.DIV512 => 512);

   APB1_Freq : constant :=
     HCLK_Freq / (case STM32F4xx_Runtime_Config.APB1_Pre is
                    when STM32F4xx_Runtime_Config.DIV1  => 1,
                    when STM32F4xx_Runtime_Config.DIV2  => 2,
                    when STM32F4xx_Runtime_Config.DIV4  => 4,
                    when STM32F4xx_Runtime_Config.DIV8  => 8,
                    when STM32F4xx_Runtime_Config.DIV16 => 16);

   APB2_Freq : constant :=
     HCLK_Freq / (case STM32F4xx_Runtime_Config.APB2_Pre is
                    when STM32F4xx_Runtime_Config.DIV1  => 1,
                    when STM32F4xx_Runtime_Config.DIV2  => 2,
                    when STM32F4xx_Runtime_Config.DIV4  => 4,
                    when STM32F4xx_Runtime_Config.DIV8  => 8,
                    when STM32F4xx_Runtime_Config.DIV16 => 16);

   Main_Clock_Frequency : constant Positive := HCLK_Freq;

end System.BB.Board_Parameters;
