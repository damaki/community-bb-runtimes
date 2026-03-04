------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--            S Y S T E M . B B . B O A R D _ P A R A M E T E R S           --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--                    Copyright (C) 2012-2016, AdaCore                      --
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

--  This package defines board parameters for the stm32g0xx

with STM32G0xx_Runtime_Config;

package System.BB.Board_Parameters is
   pragma Pure;

   --------------------
   -- Hardware clock --
   --------------------

   HSI_Freq : constant := 16_000_000;
   HSE_Freq : constant := STM32G0xx_Runtime_Config.HSE_Clock_Frequency;
   LSE_Freq : constant := 32_768;
   LSI_Freq : constant := 32_000; --  varies 31 .. 33 kHz, see datasheet

   type PLL_Input_Range is range  2_660_000 ..  16_000_000;
   type PLL_VCO_Range   is range 64_000_000 .. 344_000_000;
   type PLL_R_Range     is range          0 ..  64_000_000;
   type PLL_Q_Range     is range          0 .. 128_000_000;
   type PLL_P_Range     is range          0 .. 122_000_000;

   PLL_IN_Freq : constant :=
     (case STM32G0xx_Runtime_Config.PLL_Src is
        when STM32G0xx_Runtime_Config.HSI16 => HSI_Freq,
        when STM32G0xx_Runtime_Config.HSE   => HSE_Freq);

   PLL_VCO_Freq : constant :=
     (PLL_IN_Freq * STM32G0xx_Runtime_Config.PLL_N_Mul)
     / STM32G0xx_Runtime_Config.PLL_M_Div;

   PLL_R_Freq : constant :=
     (PLL_VCO_Freq / STM32G0xx_Runtime_Config.PLL_R_Div);

   PLL_Q_Freq : constant :=
     (PLL_VCO_Freq / STM32G0xx_Runtime_Config.PLL_Q_Div);

   PLL_P_Freq : constant :=
     (PLL_VCO_Freq / STM32G0xx_Runtime_Config.PLL_P_Div);

   HSI_Div : constant :=
     (case STM32G0xx_Runtime_Config.HSI_Div is
        when STM32G0xx_Runtime_Config.DIV1   => 1,
        when STM32G0xx_Runtime_Config.DIV2   => 2,
        when STM32G0xx_Runtime_Config.DIV4   => 4,
        when STM32G0xx_Runtime_Config.DIV8   => 8,
        when STM32G0xx_Runtime_Config.DIV16  => 16,
        when STM32G0xx_Runtime_Config.DIV32  => 32,
        when STM32G0xx_Runtime_Config.DIV64  => 64,
        when STM32G0xx_Runtime_Config.DIV128 => 128);

   SYSCLK_Freq : constant :=
     (case STM32G0xx_Runtime_Config.SYSCLK_Src is
        when STM32G0xx_Runtime_Config.LSE     => LSE_Freq,
        when STM32G0xx_Runtime_Config.LSI     => LSI_Freq,
        when STM32G0xx_Runtime_Config.HSE     => HSE_Freq,
        when STM32G0xx_Runtime_Config.PLLRCLK => PLL_R_Freq,
        when STM32G0xx_Runtime_Config.HSISYS  => HSI_Freq / HSI_Div);

   HCLK_Freq : constant :=
     SYSCLK_Freq / (case STM32G0xx_Runtime_Config.AHB_Pre is
                      when STM32G0xx_Runtime_Config.DIV1   => 1,
                      when STM32G0xx_Runtime_Config.DIV2   => 2,
                      when STM32G0xx_Runtime_Config.DIV4   => 4,
                      when STM32G0xx_Runtime_Config.DIV8   => 8,
                      when STM32G0xx_Runtime_Config.DIV16  => 16,
                      when STM32G0xx_Runtime_Config.DIV64  => 64,
                      when STM32G0xx_Runtime_Config.DIV128 => 128,
                      when STM32G0xx_Runtime_Config.DIV256 => 256,
                      when STM32G0xx_Runtime_Config.DIV512 => 512);

   Main_Clock_Frequency : constant Positive := HCLK_Freq;
   --  Frequency of the system clock (SYSCLK)

end System.BB.Board_Parameters;
