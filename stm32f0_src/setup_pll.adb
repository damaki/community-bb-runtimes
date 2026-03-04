------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          Copyright (C) 2012-2025, Free Software Foundation, Inc.         --
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
------------------------------------------------------------------------------

pragma Ada_2012; -- To work around pre-commit check?
pragma Suppress (All_Checks);

--  This initialization procedure mainly initializes the PLLs and
--  all derived clocks.

with Ada.Unchecked_Conversion;

with Interfaces.STM32;           use Interfaces, Interfaces.STM32;
with Interfaces.STM32.Flash;     use Interfaces.STM32.Flash;
with Interfaces.STM32.RCC;       use Interfaces.STM32.RCC;

with System.BB.MCU_Parameters;   use System.BB.MCU_Parameters;
with System.STM32;               use System.STM32;

with STM32F0xx_Runtime_Config;

procedure Setup_Pll is
   procedure Initialize_Clocks;
   procedure Reset_Clocks;

   package Config renames STM32F0xx_Runtime_Config;

   use type Config.PLL_Src_Kind;
   use type Config.SYSCLK_Src_Kind;
   use type Config.AHB_Pre_Kind;
   use type Config.APB_Pre_Kind;

   ------------------------------
   -- Clock Tree Configuration --
   ------------------------------

   Activate_PLL : constant Boolean := Config.SYSCLK_Src = Config.PLL;

   --  Enable HSE if used to generate the system clock (either directly,
   --  or indirectly via the PLL).

   HSE_Enabled : constant Boolean :=
     (Config.SYSCLK_Src = Config.HSE
      or (Config.SYSCLK_Src = Config.PLL
          and Config.PLL_Src = Config.HSE_PREDIV));

   -----------------------
   -- Initialize_Clocks --
   -----------------------

   procedure Initialize_Clocks
   is
      -------------------------------
      -- Compute Clock Frequencies --
      -------------------------------

      pragma Compile_Time_Error
        (Simple_Clock_Tree
         and Config.PLL_Src not in Config.HSI_2 | Config.HSE_PREDIV,
         "PLL source must be HSI/2 or HSE on STM32F03x/STM32F05x devices");

      pragma Compile_Time_Error
        (Simple_Clock_Tree
         and (Config.PLL_Src = Config.HSI48_PREDIV
              or Config.SYSCLK_Src = Config.HSI48),
         "HSI48 clock not present on STM32F03x/STM32F05x devices");

      PREDIV : constant := Config.PREDIV;

      PLLCLKIN : constant Integer :=
        (case Config.PLL_Src is
            when Config.HSI_2        => HSICLK / 2,
            when Config.HSI_PREDIV   => HSICLK / PREDIV,
            when Config.HSE_PREDIV   => Config.HSE_Clock_Frequency / PREDIV,
            when Config.HSI48_PREDIV => HSI48CLK / PREDIV);

      PLLCLKOUT : constant Integer := PLLCLKIN * Config.PLLMUL;

      pragma Compile_Time_Error
        (Activate_PLL and PLLCLKOUT not in PLLOUT_Range,
         "PLL clock frequency is out of range");

      PLL_Src : constant PLL_Source :=
        (case Config.PLL_Src is
           when Config.HSI_2        => PLL_SRC_HSI_2,
           when Config.HSI_PREDIV   => PLL_SRC_HSI_PREDIV,
           when Config.HSE_PREDIV   => PLL_SRC_HSE_PREDIV,
           when Config.HSI48_PREDIV => PLL_SRC_HSI48_PREDIV);

      SYSCLK_Src : constant SYSCLK_Source :=
        (case Config.SYSCLK_Src is
           when Config.HSI   => SYSCLK_SRC_HSI,
           when Config.HSE   => SYSCLK_SRC_HSE,
           when Config.PLL   => SYSCLK_SRC_PLL,
           when Config.HSI48 => SYSCLK_SRC_HSI48);

      SW_Value    : constant CFGR_SW_Field :=
                      SYSCLK_Source'Enum_Rep (SYSCLK_Src);

      SYSCLK      : constant Integer :=
        (case Config.SYSCLK_Src is
            when Config.HSI   => HSICLK,
            when Config.HSE   => Config.HSE_Clock_Frequency,
            when Config.PLL   => PLLCLKOUT,
            when Config.HSI48 => HSI48CLK);

      AHB_PRE : constant AHB_Prescaler :=
        (case Config.AHB_Pre is
           when Config.DIV1   => (Enabled => False, Value => DIV2),
           when Config.DIV2   => (Enabled => True,  Value => DIV2),
           when Config.DIV4   => (Enabled => True,  Value => DIV4),
           when Config.DIV8   => (Enabled => True,  Value => DIV8),
           when Config.DIV16  => (Enabled => True,  Value => DIV16),
           when Config.DIV64  => (Enabled => True,  Value => DIV64),
           when Config.DIV128 => (Enabled => True,  Value => DIV128),
           when Config.DIV256 => (Enabled => True,  Value => DIV256),
           when Config.DIV512 => (Enabled => True,  Value => DIV512));

      APB_PRE : constant APB_Prescaler :=
        (case Config.APB_Pre is
           when Config.DIV1   => (Enabled => False, Value => DIV2),
           when Config.DIV2   => (Enabled => True,  Value => DIV2),
           when Config.DIV4   => (Enabled => True,  Value => DIV4),
           when Config.DIV8   => (Enabled => True,  Value => DIV8),
           when Config.DIV16  => (Enabled => True,  Value => DIV16));

      HCLK : constant Integer :=
               (case Config.AHB_Pre is
                  when Config.DIV1   => SYSCLK,
                  when Config.DIV2   => SYSCLK / 2,
                  when Config.DIV4   => SYSCLK / 4,
                  when Config.DIV8   => SYSCLK / 8,
                  when Config.DIV16  => SYSCLK / 16,
                  when Config.DIV64  => SYSCLK / 64,
                  when Config.DIV128 => SYSCLK / 128,
                  when Config.DIV256 => SYSCLK / 256,
                  when Config.DIV512 => SYSCLK / 512);

      PCLK : constant Integer :=
               (case Config.APB_Pre is
                  when Config.DIV1   => HCLK,
                  when Config.DIV2   => HCLK / 2,
                  when Config.DIV4   => HCLK / 4,
                  when Config.DIV8   => HCLK / 8,
                  when Config.DIV16  => HCLK / 16);

      pragma Compile_Time_Error
        (HCLK not in HCLK_Range
         or else PCLK not in PCLK_Range,
         "Invalid AHB/APB prescalers configuration");

      function To_AHB is new Ada.Unchecked_Conversion
        (AHB_Prescaler, UInt4);
      function To_APB is new Ada.Unchecked_Conversion
        (APB_Prescaler, UInt3);

   begin

      if not HSE_Enabled then
         --  Setup internal clock and wait for HSI stabilisation.

         RCC_Periph.CR.HSION := 1;

         loop
            exit when RCC_Periph.CR.HSIRDY = 1;
         end loop;

      else
         --  Configure high-speed external clock, if enabled

         RCC_Periph.CR.HSEON := 1;
         RCC_Periph.CR.HSEBYP := (if Config.HSE_Bypass then 1 else 0);

         loop
            exit when RCC_Periph.CR.HSERDY = 1;
         end loop;
      end if;

      --  Configure low-speed internal clock if enabled

      if Config.LSI_Enabled then
         RCC_Periph.CSR.LSION := 1;

         loop
            exit when RCC_Periph.CSR.LSIRDY = 1;
         end loop;
      end if;

      --  Activate PLL if enabled
      if Activate_PLL then
         --  Disable the main PLL before configuring it
         RCC_Periph.CR.PLLON := 0;

         --  Configure the PLL clock source, multiplication and division
         --  factors
         RCC_Periph.CFGR2.PREDIV := UInt4 (PREDIV - 1);
         RCC_Periph.CFGR.PLLMUL  := Config.PLLMUL - 2;
         RCC_Periph.CFGR.PLLSRC  := PLL_Source'Enum_Rep (PLL_Src);

         RCC_Periph.CR.PLLON := 1;
         loop
            exit when RCC_Periph.CR.PLLRDY = 1;
         end loop;
      end if;

      --  Configure flash
      --  Must be done before increasing the frequency, otherwise the CPU
      --  won't be able to fetch new instructions.

      Flash_Periph.ACR.PRFTBE := 1;

      --  Use zero wait states when SYSCLK <= 24 MHz otherwise one wait state
      Flash_Periph.ACR.LATENCY := UInt3 ((SYSCLK - 1) / 24_000_000);

      --  Configure derived clocks

      RCC_Periph.CFGR.HPRE := To_AHB (AHB_PRE);
      RCC_Periph.CFGR.PPRE := To_APB (APB_PRE);
      RCC_Periph.CFGR.SW   := SW_Value;

      if Activate_PLL then
         loop
            exit when RCC_Periph.CFGR.SWS =
              SYSCLK_Source'Enum_Rep (SYSCLK_SRC_PLL);
         end loop;
      end if;
   end Initialize_Clocks;

   ------------------
   -- Reset_Clocks --
   ------------------

   procedure Reset_Clocks is
   begin
      --  Switch on high speed internal clock
      RCC_Periph.CR.HSION := 1;

      --  Reset CFGR regiser
      RCC_Periph.CFGR := (others => <>);

      --  Reset HSEON, CSSON and PLLON bits
      RCC_Periph.CR.HSEON := 0;
      RCC_Periph.CR.CSSON := 0;
      RCC_Periph.CR.PLLON := 0;

      --  Reset HSE bypass bit
      RCC_Periph.CR.HSEBYP := 0;

      --  Disable all interrupts
      RCC_Periph.CIR := (others => <>);
   end Reset_Clocks;

begin
   Reset_Clocks;
   Initialize_Clocks;
end Setup_Pll;
