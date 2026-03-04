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

--  This package defines board parameters for the stm32f0xx

with STM32F0xx_Runtime_Config;

package System.BB.Board_Parameters is
   pragma Pure;

   --------------------
   -- Hardware clock --
   --------------------

   HSI_Freq   : constant := 8_000_000;
   HSI48_Freq : constant := 48_000_000;
   HSE_Freq   : constant := STM32F0xx_Runtime_Config.HSE_Clock_Frequency;
   PREDIV     : constant := STM32F0xx_Runtime_Config.PREDIV;

   PLL_IN_Freq : constant :=
     (case STM32F0xx_Runtime_Config.PLL_Src is
        when STM32F0xx_Runtime_Config.HSI_2        => HSI_Freq   / 2,
        when STM32F0xx_Runtime_Config.HSI_PREDIV   => HSI_Freq   / PREDIV,
        when STM32F0xx_Runtime_Config.HSE_PREDIV   => HSE_Freq   / PREDIV,
        when STM32F0xx_Runtime_Config.HSI48_PREDIV => HSI48_Freq / PREDIV);

   PLL_OUT_Freq : constant := PLL_IN_Freq * STM32F0xx_Runtime_Config.PLLMUL;

   Main_Clock_Frequency : constant Positive :=
     (case STM32F0xx_Runtime_Config.SYSCLK_Src is
        when STM32F0xx_Runtime_Config.HSI   => HSI_Freq,
        when STM32F0xx_Runtime_Config.HSE   => HSE_Freq,
        when STM32F0xx_Runtime_Config.PLL   => PLL_OUT_Freq,
        when STM32F0xx_Runtime_Config.HSI48 => HSI48_Freq);
   --  Frequency of the system clock for the decrementer timer

end System.BB.Board_Parameters;
