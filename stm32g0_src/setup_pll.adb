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

with Interfaces.STM32;           use Interfaces, Interfaces.STM32;
with Interfaces.STM32.Flash;     use Interfaces.STM32.Flash;
with Interfaces.STM32.RCC;       use Interfaces.STM32.RCC;

with System.BB.Board_Parameters; use System.BB.Board_Parameters;

with STM32G0xx_Runtime_Config;

procedure Setup_Pll is
   procedure Initialize_Clocks;
   procedure Reset_Clocks;

   package Config renames STM32G0xx_Runtime_Config;

   use type Config.PLL_Src_Kind;
   use type Config.SYSCLK_Src_Kind;

   ------------------------------
   -- Clock Tree Configuration --
   ------------------------------

   PLL_R_Enable : constant Boolean := Config.SYSCLK_Src = Config.PLLRCLK;

   Activate_PLL : constant Boolean :=
     PLL_R_Enable or Config.PLL_Q_Enable or Config.PLL_P_Enable;

   --  Enable HSE if used to generate the system clock (either directly,
   --  or indirectly via the PLL).

   HSE_Enabled : constant Boolean :=
     Config.SYSCLK_Src = Config.HSE
     or (Config.SYSCLK_Src = Config.PLLRCLK
         and Config.PLL_Src = Config.HSE);

   LSE_Enabled : constant Boolean :=
     Config.LSE_Enabled or Config.SYSCLK_Src = Config.LSE;

   -----------------------
   -- Initialize_Clocks --
   -----------------------

   procedure Initialize_Clocks
   is
      -------------------------
      -- Compile-Time Checks --
      -------------------------

      pragma Compile_Time_Error
        (PLL_IN_Freq / Config.PLL_M_Div not in PLL_Input_Range,
         "Invalid PLL configuration. PLL input frequency after the /M"
           & " divider must be between 2.66 and 16 MHz");

      pragma Compile_Time_Error
        (PLL_VCO_Freq not in PLL_VCO_Range,
         "Invalid PLL configuration. PLL VCO output requency must be in the"
           & " range 64 .. 344 MHz");

      pragma Compile_Time_Error
        (Config.PLL_P_Enable and PLL_P_Freq not in PLL_P_Range,
         "Invalid PLL configuration. PLL P output frequency must not exceed"
           & " 122 MHz");

      pragma Compile_Time_Error
        (Config.PLL_Q_Enable and PLL_Q_Freq not in PLL_Q_Range,
         "Invalid PLL configuration. PLL Q output frequency must not exceed"
           & " 128 MHz");

      pragma Compile_Time_Error
        (Config.SYSCLK_Src = Config.PLLRCLK and PLL_R_Freq not in PLL_R_Range,
         "Invalid PLL configuration. PLL R output frequency must not exceed"
           & " 64 MHz");

      FLASH_Latency : constant :=
        (if    SYSCLK_Freq <= 24_000_000 then 0
         elsif SYSCLK_Freq <= 48_000_000 then 1
         else  2);

      SW_Value : CFGR_SW_Field;

   begin

      if not HSE_Enabled then
         --  Setup internal clock and wait for HSI stabilisation.

         RCC_Periph.CR.HSIDIV := Config.HSI_Div_Kind'Pos (Config.HSI_Div);
         RCC_Periph.CR.HSION  := 1;

         loop
            exit when RCC_Periph.CR.HSIRDY = 1;
         end loop;

      else
         --  Configure high-speed external clock, if enabled

         RCC_Periph.CR.HSEBYP := (if Config.HSE_Bypass then 1 else 0);
         RCC_Periph.CR.HSEON  := 1;

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

      --  Configure low-speed external clock if enabled

      if LSE_Enabled then

         --  LSEBYP can only be set while LSE is disabled

         RCC_Periph.BDCR.LSEBYP := (if Config.LSE_Bypass then 1 else 0);
         RCC_Periph.BDCR.LSEON  := 1;

         loop
            exit when RCC_Periph.BDCR.LSERDY = 1;
         end loop;

      end if;

      --  Activate PLL if enabled

      if Activate_PLL then
         --  Disable the main PLL before configuring it
         RCC_Periph.CR.PLLON := 0;

         --  Configure the PLL clock source, multiplication and division
         --  factors
         RCC_Periph.PLLSYSCFGR :=
           (PLLSRC => (case Config.PLL_Src is
                         when Config.HSE   => 2#11#,
                         when Config.HSI16 => 2#10#),
            PLLM   => Config.PLL_M_Div - 1,
            PLLN   => Config.PLL_N_Mul,
            PLLPEN => (if Config.PLL_P_Enable then 1 else 0),
            PLLP   => Config.PLL_P_Div - 1,
            PLLQEN => (if Config.PLL_Q_Enable then 1 else 0),
            PLLQ   => Config.PLL_Q_Div - 1,
            PLLREN => (if PLL_R_Enable then 1 else 0),
            PLLR   => Config.PLL_R_Div - 1,
            others => <>);

         RCC_Periph.CR.PLLON := 1;

         loop
            exit when RCC_Periph.CR.PLLRDY = 1;
         end loop;
      end if;

      --  Configure flash
      --  Must be done before increasing the frequency, otherwise the CPU
      --  won't be able to fetch new instructions.

      --  Reset and enable instruction cache

      FLASH_Periph.ACR.ICEN  := 0;
      FLASH_Periph.ACR.ICRST := 1;
      FLASH_Periph.ACR.ICEN  := 1;

      --  Enable CPU prefetch

      FLASH_Periph.ACR.PRFTEN := 1;

      --  Set flash wait states. We assume here that the core voltage (V_CORE)
      --  is in range 1 (the default after a reset).

      FLASH_Periph.ACR.LATENCY := FLASH_Latency;

      --  Configure derived clocks

      RCC_Periph.CFGR.HPRE := 7 + Config.AHB_Pre_Kind'Pos (Config.AHB_Pre);
      RCC_Periph.CFGR.PPRE := 3 + Config.APB_Pre_Kind'Pos (Config.APB_Pre);

      --  Switch over to the desired clock source

      SW_Value := (case Config.SYSCLK_Src is
                     when Config.HSISYS  => 2#000#,
                     when Config.HSE     => 2#001#,
                     when Config.PLLRCLK => 2#010#,
                     when Config.LSI     => 2#011#,
                     when Config.LSE     => 2#100#);

      RCC_Periph.CFGR.SW := SW_Value;

      --  Wait for the SYSCLK to switch over to the requested clock source

      loop
         exit when RCC_Periph.CFGR.SWS = SW_Value;
      end loop;
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

      --  Reset HSEON, CSSON, PLLON, and LSEON bits
      RCC_Periph.CR.HSEON   := 0;
      RCC_Periph.CR.CSSON   := 0;
      RCC_Periph.CR.PLLON   := 0;
      RCC_Periph.BDCR.LSEON := 0;

      --  Reset HSE & LSE bypass bit
      RCC_Periph.CR.HSEBYP   := 0;
      RCC_Periph.BDCR.LSEBYP := 0;

      --  Disable all interrupts
      RCC_Periph.CICR :=
        (LSIRDYC    => 1,
         LSERDYC    => 1,
         HSIRDYC    => 1,
         HSERDYC    => 1,
         PLLSYSRDYC => 1,
         CSSC       => 1,
         LSECSSC    => 1,
         others     => <>);
   end Reset_Clocks;

begin
   Reset_Clocks;
   Initialize_Clocks;
end Setup_Pll;
