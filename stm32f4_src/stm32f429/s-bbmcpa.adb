------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--              S Y S T E M . B B . M C U _ P A R A M E T E R S             --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--                    Copyright (C) 2012-2026, Free Software Foundation     --
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

with Interfaces.STM32.PWR; use Interfaces.STM32.PWR;

package body System.BB.MCU_Parameters is

   --------------------------
   -- PWR_Overdrive_Enable --
   --------------------------

   procedure PWR_Overdrive_Enable is
      use type Interfaces.STM32.Bit;
   begin
      --  Enable the over-drive mode

      PWR_Periph.CR.ODEN := 1;

      loop
         exit when PWR_Periph.CSR.ODRDY = 1;
      end loop;

      --  Switch the voltage regulator to over-drive

      PWR_Periph.CR.ODSWEN := 1;

      loop
         exit when PWR_Periph.CSR.ODSWRDY = 1;
      end loop;
   end PWR_Overdrive_Enable;

end System.BB.MCU_Parameters;
