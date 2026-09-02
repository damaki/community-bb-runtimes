------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          Copyright (C) 2012-2026, Free Software Foundation, Inc.         --
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

pragma Ada_2012;
pragma Suppress (All_Checks);

--  This initialization procedure mainly initializes the PLL and all derived
--  clocks.
--
--  This procedure is shared by every MCU_Sub_Family; per-sub-family
--  differences (flash wait-state table, APB1/APB2 limits, PLL P output
--  range) are selected below via Config.MCU_Sub_Family.

with Interfaces.STM32;           use Interfaces.STM32;
with Interfaces.STM32.FLASH;     use Interfaces.STM32.FLASH;
with Interfaces.STM32.PWR;       use Interfaces.STM32.PWR;
with Interfaces.STM32.RCC;       use Interfaces.STM32.RCC;

with System.BB.Board_Parameters; use System.BB.Board_Parameters;

with STM32F4xx_Runtime_Config;

procedure Setup_Pll is
   procedure Initialize_Clocks;
   procedure Reset_Clocks;

   package Config renames STM32F4xx_Runtime_Config;

   use type Config.PLL_Src_Kind;
   use type Config.SYSCLK_Src_Kind;

   ------------------------------
   -- Clock Tree Configuration --
   ------------------------------

   Activate_PLL : constant Boolean := Config.SYSCLK_Src = Config.PLL;

   --  Enable HSE if used to generate the system clock (either directly,
   --  or indirectly via the PLL).

   HSE_Enabled : constant Boolean :=
     Config.SYSCLK_Src = Config.HSE
     or (Config.SYSCLK_Src = Config.PLL
         and Config.PLL_Src = Config.HSE);

   LSI_Enabled : constant Boolean := Config.LSI_Enabled;
   LSE_Enabled : constant Boolean := Config.LSE_Enabled;

   --  Flash latency, assuming VDD in the range 2.7 .. 3.6V. See RM0383
   --  Table 10 (STM32F411) / RM0090 Table 11 (STM32F405/407/415/417)
   --  "Number of wait states according to CPU clock (HCLK) frequency".
   --
   --  TODO(stm32f411): this table is written from general STM32F4 datasheet
   --  knowledge (it has not been cross-checked against RM0383's actual
   --  Table 10 for the STM32F411 specifically) -- please verify against the
   --  datasheet before relying on it for a production build.

   FLASH_Latency : constant :=
     (case Config.MCU_Sub_Family is
        when Config.F411 =>
          (if    SYSCLK_Freq <= 30_000_000 then 0
           elsif SYSCLK_Freq <= 60_000_000 then 1
           elsif SYSCLK_Freq <= 90_000_000 then 2
           else 3),
        when Config.F407 | Config.F417 =>
          (if    SYSCLK_Freq <= 30_000_000  then 0
           elsif SYSCLK_Freq <= 60_000_000  then 1
           elsif SYSCLK_Freq <= 90_000_000  then 2
           elsif SYSCLK_Freq <= 120_000_000 then 3
           elsif SYSCLK_Freq <= 150_000_000 then 4
           else 5));

   --  Regulator voltage scaling output selection
   --  F411: See RM0383 section 5.1.3, PWR_CR.VOS[1:0]:
   --    01 => Scale 3, SYSCLK <= 64 MHz
   --    10 => Scale 2, SYSCLK <= 84 MHz (reset value)
   --    11 => Scale 1, SYSCLK <= 100 MHz
   --  F407: See DS8626, Table 14

   Voltage_Scaling : constant :=
     (case Config.MCU_Sub_Family is
        when Config.F411 =>
          (if    SYSCLK_Freq <= 64_000_000 then 1
           elsif SYSCLK_Freq <= 84_000_000 then 2
           else 3),
        when Config.F407 | Config.F417 =>
          (if SYSCLK_Freq <= 144_000_000 then 0
           else 1));

   --  Maximum APB1/APB2 frequencies. See RM0383 section 3.3 (STM32F411)
   --  and RM0090 section 3.3 (STM32F405/407/415/417).

   APB1_Max_Freq : constant :=
     (case Config.MCU_Sub_Family is
        when Config.F411             => 50_000_000,
        when Config.F407 | Config.F417 => 42_000_000);

   APB2_Max_Freq : constant :=
     (case Config.MCU_Sub_Family is
        when Config.F411             => 100_000_000,
        when Config.F407 | Config.F417 => 84_000_000);

   -----------------------
   -- Initialize_Clocks --
   -----------------------

   procedure Initialize_Clocks
   is
      -------------------------
      -- Compile-Time Checks --
      -------------------------

      pragma Compile_Time_Error
        (Activate_PLL and then PLL_IN_Freq / Config.PLL_M_Div
           not in PLL_Input_Range,
         "Invalid PLL configuration. PLL input frequency after the /M"
           & " divider must be between 1 and 2 MHz");

      pragma Compile_Time_Error
        (Activate_PLL and then PLL_VCO_Freq not in PLL_VCO_Range,
         "Invalid PLL configuration. PLL VCO output frequency must be in"
           & " the range 100 .. 432 MHz");

      pragma Compile_Time_Error
        (Activate_PLL and then PLL_P_Freq not in PLL_P_Range,
         "Invalid PLL configuration. PLL P output frequency (SYSCLK) must"
           & " be in the range 24 .. 100 MHz for F411, or 24 .. 168 MHz"
           & " for F407/F417");

      pragma Compile_Time_Error
        (Activate_PLL and then PLL_Q_Freq not in PLL_Q_Range,
         "Invalid PLL configuration. PLL Q output frequency must be in the"
           & " range 1 .. 48 MHz");

      pragma Compile_Time_Error
        (APB1_Freq > APB1_Max_Freq,
         "Invalid configuration. APB1 frequency must not exceed 50 MHz"
           & " (F411) or 42 MHz (F407/F417)");

      pragma Compile_Time_Error
        (APB2_Freq > APB2_Max_Freq,
         "Invalid configuration. APB2 frequency must not exceed 100 MHz"
           & " (F411) or 84 MHz (F407/F417)");

      SW_Value : CFGR_SW_Field;

   begin

      if HSE_Enabled then
         --  Setup internal clock and wait for HSI stabilisation.

         RCC_Periph.CR.HSEBYP := (if Config.HSE_Bypass
                                  then 1
                                  else 0);
         RCC_Periph.CR.HSEON  := 1;

         loop
            exit when RCC_Periph.CR.HSERDY = 1;
         end loop;

      else
         --  Configure high-speed external clock, if enabled

         RCC_Periph.CR.HSION := 1;

         loop
            exit when RCC_Periph.CR.HSIRDY = 1;
         end loop;
      end if;

      --  Configure low-speed internal clock if enabled

      if LSI_Enabled then
         RCC_Periph.CSR.LSION := 1;

         loop
            exit when RCC_Periph.CSR.LSIRDY = 1;
         end loop;
      end if;

      --  Configure low-speed external clock if enabled

      if LSE_Enabled then

         --  LSEBYP can only be set while LSE is disabled

         RCC_Periph.BDCR.LSEBYP := (if Config.LSE_Bypass
                                    then 1
                                    else 0);
         RCC_Periph.BDCR.LSEON  := 1;

         loop
            exit when RCC_Periph.BDCR.LSERDY = 1;
         end loop;

      end if;

      --  Enable the power interface clock and select the voltage scale
      --  needed for the target SYSCLK frequency (PLL is still off at this
      --  point, see Reset_Clocks, so VOS is writable here). The width of
      --  PWR_CR.VOS differs per MCU_Sub_Family, so the actual selection is
      --  delegated to Setup_Voltage_Scale (see its spec for details).

      RCC_Periph.APB1ENR.PWREN := 1;

      PWR_Periph.CR.VOS := Voltage_Scaling;

      --  Configure flash
      --  Must be done before increasing the frequency, otherwise the CPU
      --  won't be able to fetch new instructions.

      FLASH_Periph.ACR.ICEN  := 0;
      FLASH_Periph.ACR.DCEN  := 0;
      FLASH_Periph.ACR.ICRST := 1;
      FLASH_Periph.ACR.DCRST := 1;
      FLASH_Periph.ACR :=
        (LATENCY => FLASH_Latency,
         ICEN    => 1,
         DCEN    => 1,
         PRFTEN  => 1,
         others  => <>);

      --  Activate PLL if enabled

      if Activate_PLL then
         --  Disable the main PLL before configuring it
         RCC_Periph.CR.PLLON := 0;

         --  Configure the PLL clock source, multiplication and division
         --  factors
         RCC_Periph.PLLCFGR :=
           (PLLM   => UInt6 (Config.PLL_M_Div),
            PLLN   => UInt9 (Config.PLL_N_Mul),
            PLLP   => (case Config.PLL_P_Div is
                         when Config.DIV2 => 2#00#,
                         when Config.DIV4 => 2#01#,
                         when Config.DIV6 => 2#10#,
                         when Config.DIV8 => 2#11#),
            PLLQ   => UInt4 (Config.PLL_Q_Div),
            PLLSRC => (case Config.PLL_Src is
                         when Config.HSI => 0,
                         when Config.HSE => 1),
            others => <>);

         RCC_Periph.CR.PLLON := 1;

         loop
            exit when RCC_Periph.CR.PLLRDY = 1;
         end loop;
      end if;

      --  Configure derived clocks

      RCC_Periph.CFGR.HPRE :=
        (case Config.AHB_Pre is
           when Config.DIV1   => 0,
           when Config.DIV2   => 2#1000#,
           when Config.DIV4   => 2#1001#,
           when Config.DIV8   => 2#1010#,
           when Config.DIV16  => 2#1011#,
           when Config.DIV64  => 2#1100#,
           when Config.DIV128 => 2#1101#,
           when Config.DIV256 => 2#1110#,
           when Config.DIV512 => 2#1111#);

      RCC_Periph.CFGR.PPRE :=
        (As_Array => True,
         Arr      => (1 => (case Config.APB1_Pre is
                              when Config.DIV1  => 0,
                              when Config.DIV2  => 2#100#,
                              when Config.DIV4  => 2#101#,
                              when Config.DIV8  => 2#110#,
                              when Config.DIV16 => 2#111#),
                      2 => (case Config.APB2_Pre is
                              when Config.DIV1  => 0,
                              when Config.DIV2  => 2#100#,
                              when Config.DIV4  => 2#101#,
                              when Config.DIV8  => 2#110#,
                              when Config.DIV16 => 2#111#)));

      --  Switch over to the desired clock source

      SW_Value := (case Config.SYSCLK_Src is
                     when Config.HSI => 0,
                     when Config.HSE => 1,
                     when Config.PLL => 2);

      RCC_Periph.CFGR.SW := SW_Value;

      --  Wait for the SYSCLK to switch over to the requested clock source

      loop
         exit when CFGR_SWS_Field'Pos (RCC_Periph.CFGR.SWS)
                   = CFGR_SW_Field'Pos (SW_Value);
      end loop;
   end Initialize_Clocks;

   ------------------
   -- Reset_Clocks --
   ------------------

   procedure Reset_Clocks is
   begin
      --  Switch on high speed internal clock
      RCC_Periph.CR.HSION := 1;

      --  Reset CFGR register
      RCC_Periph.CFGR := (others => <>);

      --  Reset HSEON, CSSON, PLLON, and LSEON bits
      RCC_Periph.CR.HSEON   := 0;
      RCC_Periph.CR.CSSON   := 0;
      RCC_Periph.CR.PLLON   := 0;
      RCC_Periph.BDCR.LSEON := 0;

      --  Reset PLL configuration register
      RCC_Periph.PLLCFGR := (others => <>);

      --  Reset HSE & LSE bypass bit
      RCC_Periph.CR.HSEBYP   := 0;
      RCC_Periph.BDCR.LSEBYP := 0;

      --  Disable all clock interrupts
      RCC_Periph.CIR := (others => <>);
   end Reset_Clocks;

begin
   Reset_Clocks;
   Initialize_Clocks;
end Setup_Pll;
