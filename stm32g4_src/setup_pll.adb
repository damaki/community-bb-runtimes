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
with Interfaces.STM32.PWR;       use Interfaces.STM32.PWR;
with Interfaces.STM32.RCC;       use Interfaces.STM32.RCC;

with System.BB.Board_Parameters; use System.BB.Board_Parameters;

with STM32G4xx_Runtime_Config;

procedure Setup_Pll is
   procedure Initialize_Clocks;
   procedure Reset_Clocks;

   package Config renames STM32G4xx_Runtime_Config;

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

   LSE_Enabled : constant Boolean := Config.LSE_Enabled;

   --  Enable boost mode if main clock frequency is above 150 MHz

   Boost_Mode : constant Boolean := SYSCLK_Freq > 150_000_000;

   --  Flash latency according to Table 9 of RM0440 Rev 9

   FLASH_Latency : constant :=
     (if Boost_Mode then
        (if    SYSCLK_Freq <=  34_000_000 then 0
         elsif SYSCLK_Freq <=  68_000_000 then 1
         elsif SYSCLK_Freq <= 102_000_000 then 2
         elsif SYSCLK_Freq <= 136_000_000 then 3
         else 4)
      else
        (if    SYSCLK_Freq <=  30_000_000 then 0
         elsif SYSCLK_Freq <=  60_000_000 then 1
         elsif SYSCLK_Freq <=  90_000_000 then 2
         elsif SYSCLK_Freq <= 120_000_000 then 3
         else 4));

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
           & " range 96 .. 344 MHz");

      pragma Compile_Time_Error
        (Config.PLL_P_Enable and PLL_P_Freq not in PLL_P_Range,
         "Invalid PLL configuration. PLL P output frequency must be in the"
           & " range 2.0645 .. 170 MHz");

      pragma Compile_Time_Error
        (Config.PLL_Q_Enable and PLL_Q_Freq not in PLL_Q_Range,
         "Invalid PLL configuration. PLL Q output frequency must be in the"
           & " range 8 .. 170 MHz");

      pragma Compile_Time_Error
        (Config.SYSCLK_Src = Config.PLLRCLK and PLL_R_Freq not in PLL_R_Range,
         "Invalid PLL configuration. PLL R output frequency must be in the"
           & " range 8 .. 170 MHz");

      SW_Value : RCC_CFGR_SW_Field;

   begin

      --  Set boost mode if needed to allow main clock frequency above 150 MHz

      PWR_Periph.PWR_CR5.R1MODE := (if Boost_Mode then B_0x0 else B_0x1);

      if not HSE_Enabled then
         --  Setup internal clock and wait for HSI stabilisation.

         RCC_Periph.RCC_CR.HSION := B_0x1;

         loop
            exit when RCC_Periph.RCC_CR.HSIRDY = B_0x1;
         end loop;

      else
         --  Configure high-speed external clock, if enabled

         RCC_Periph.RCC_CR.HSEBYP := (if Config.HSE_Bypass
                                      then B_0x1
                                      else B_0x0);
         RCC_Periph.RCC_CR.HSEON  := B_0x1;

         loop
            exit when RCC_Periph.RCC_CR.HSERDY = B_0x1;
         end loop;
      end if;

      --  Configure low-speed internal clock if enabled

      if Config.LSI_Enabled then
         RCC_Periph.RCC_CSR.LSION := B_0x1;

         loop
            exit when RCC_Periph.RCC_CSR.LSIRDY = B_0x1;
         end loop;
      end if;

      --  Configure low-speed external clock if enabled

      if LSE_Enabled then

         --  LSEBYP can only be set while LSE is disabled

         RCC_Periph.RCC_BDCR.LSEBYP := (if Config.LSE_Bypass
                                        then B_0x1
                                        else B_0x0);
         RCC_Periph.RCC_BDCR.LSEON  := B_0x1;

         loop
            exit when RCC_Periph.RCC_BDCR.LSERDY = B_0x1;
         end loop;

      end if;

      --  Activate PLL if enabled

      if Activate_PLL then
         --  Disable the main PLL before configuring it
         RCC_Periph.RCC_CR.PLLON := B_0x0;

         --  Configure the PLL clock source, multiplication and division
         --  factors
         RCC_Periph.RCC_PLLCFGR :=
           (PLLPDIV => Config.PLL_P_Div,
            PLLR    => Config.PLL_R_Div_Kind'Pos (Config.PLL_R_Div),
            PLLREN  => (if PLL_R_Enable then 1 else 0),
            PLLQ    => Config.PLL_Q_Div_Kind'Pos (Config.PLL_Q_Div),
            PLLQEN  => (if Config.PLL_Q_Enable then 1 else 0),
            PLLP    => 0, --  Not used since PLLPDIV /= 0
            PLLPEN  => (if Config.PLL_P_Enable then 1 else 0),
            PLLN    => Config.PLL_N_Mul,
            PLLM    => Config.PLL_M_Div - 1,
            PLLSRC  => (case Config.PLL_Src is
                         when Config.HSI16 => 2#10#,
                         when Config.HSE   => 2#11#),
            others => <>);

         RCC_Periph.RCC_CR.PLLON := B_0x1;

         loop
            exit when RCC_Periph.RCC_CR.PLLRDY = B_0x1;
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

      RCC_Periph.RCC_CFGR.HPRE :=
        (case Config.AHB_Pre is
           when Config.DIV1   => RCC_CFGR_HPRE_Field_Reset,
           when Config.DIV2   => B_0x8,
           when Config.DIV4   => B_0x9,
           when Config.DIV8   => B_0xA,
           when Config.DIV16  => B_0xB,
           when Config.DIV64  => B_0xC,
           when Config.DIV128 => B_0xD,
           when Config.DIV256 => B_0xE,
           when Config.DIV512 => B_0xF);

      RCC_Periph.RCC_CFGR.PPRE :=
        (As_Array => True,
         Arr      => (1 => (case Config.APB1_Pre is
                              when Config.DIV1  => RCC_CFGR_PPRE1_Field_Reset,
                              when Config.DIV2  => B_0x4,
                              when Config.DIV4  => B_0x5,
                              when Config.DIV8  => B_0x6,
                              when Config.DIV16 => B_0x7),
                      2 => (case Config.APB2_Pre is
                              when Config.DIV1  => RCC_CFGR_PPRE1_Field_Reset,
                              when Config.DIV2  => B_0x4,
                              when Config.DIV4  => B_0x5,
                              when Config.DIV8  => B_0x6,
                              when Config.DIV16 => B_0x7)));

      --  Switch over to the desired clock source

      SW_Value := (case Config.SYSCLK_Src is
                     when Config.HSI16   => B_0x1,
                     when Config.HSE     => B_0x2,
                     when Config.PLLRCLK => B_0x3);

      RCC_Periph.RCC_CFGR.SW := SW_Value;

      --  Wait for the SYSCLK to switch over to the requested clock source

      loop
         exit when RCC_CFGR_SWS_Field'Pos (RCC_Periph.RCC_CFGR.SWS)
                   = RCC_CFGR_SW_Field'Pos (SW_Value);
      end loop;
   end Initialize_Clocks;

   ------------------
   -- Reset_Clocks --
   ------------------

   procedure Reset_Clocks is
   begin
      --  Switch on high speed internal clock
      RCC_Periph.RCC_CR.HSION := B_0x1;

      --  Reset CFGR regiser
      RCC_Periph.RCC_CFGR := (others => <>);

      --  Reset HSEON, CSSON, PLLON, and LSEON bits
      RCC_Periph.RCC_CR.HSEON   := B_0x0;
      RCC_Periph.RCC_CR.CSSON   := B_0x0;
      RCC_Periph.RCC_CR.PLLON   := B_0x0;
      RCC_Periph.RCC_BDCR.LSEON := B_0x0;

      --  Reset HSE & LSE bypass bit
      RCC_Periph.RCC_CR.HSEBYP   := B_0x0;
      RCC_Periph.RCC_BDCR.LSEBYP := B_0x0;

      --  Disable all interrupts
      RCC_Periph.RCC_CICR :=
        (LSIRDYC   => B_0x1,
         LSERDYC   => B_0x1,
         HSIRDYC   => B_0x1,
         HSERDYC   => B_0x1,
         PLLRDYC   => B_0x1,
         CSSC      => B_0x1,
         LSECSSC   => B_0x1,
         HSI48RDYC => B_0x1,
         others    => <>);
   end Reset_Clocks;

begin
   Reset_Clocks;
   Initialize_Clocks;
end Setup_Pll;
