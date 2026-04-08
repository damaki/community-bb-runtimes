------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--            Copyright (C) AdaCore and other contributors, 2022            --
--      See https://github.com/AdaCore/bb-runtimes/graphs/contributors      --
--                           for more information                           --
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

with System.Machine_Code;   use System.Machine_Code;
with Interfaces;            use Interfaces;

package body System.BB.Armv6m_Atomic is

   -------------
   -- PRIMASK --
   -------------

   function PRIMASK return Unsigned_32 is
      R : Unsigned_32;
   begin
      Asm ("mrs %0, PRIMASK", Outputs => Unsigned_32'Asm_Output ("=r", R),
           Volatile => True);
      return R;
   end PRIMASK;

   ------------------------
   -- Interrupt_Disabled --
   ------------------------

   function Interrupt_Disabled return Boolean
   is ((PRIMASK and 1) /= 0);

   ------------------------
   -- Disable_Interrupts --
   ------------------------

   procedure Disable_Interrupts is
   begin
      Asm ("cpsid i" & ASCII.CR & ASCII.LF
             & "dsb" & ASCII.CR & ASCII.LF
             & "isb",
           Clobber => "memory",
           Volatile => True);
   end Disable_Interrupts;

   -----------------------
   -- Enable_Interrupts --
   -----------------------

   procedure Enable_Interrupts is
   begin
      Asm ("cpsie i" & ASCII.CR & ASCII.LF
             & "dsb" & ASCII.CR & ASCII.LF
             & "isb",
           Clobber => "memory",
           Volatile => True);
   end Enable_Interrupts;

   --------------------
   -- Atomic_Wrapper --
   --------------------

   procedure Atomic_Wrapper is
      Already_Disabled : constant Boolean := Interrupt_Disabled;
      --  Make sure not to change the status of interrupt control by checking
      --  if they are enabled when entering the function.
   begin

      if not Already_Disabled then
         Disable_Interrupts;
      end if;

      Wrapped_Proc;

      --  If the interrupts were disabled when entering this function, we do
      --  not want enable them.
      if not Already_Disabled then
         Enable_Interrupts;
      end if;
   end Atomic_Wrapper;

   ----------------------------
   -- Sync_Lock_Test_And_Set --
   ----------------------------

   function Sync_Lock_Test_And_Set (Addr  : System.Address;
                                    Value : T)
                                   return T
   is
      Data : T with Address => Addr;
      Ret  : T;

      procedure Inner
        with Inline_Always;

      procedure Inner
      is
      begin
         Ret  := Data;
         Data := Value;
      end Inner;

      procedure Atomic_Action is new Atomic_Wrapper (Inner);

   begin
      Atomic_Action;
      return Ret;
   end Sync_Lock_Test_And_Set;

   --------------------------------
   -- Sync_Bool_Compare_And_Swap --
   --------------------------------

   function Sync_Bool_Compare_And_Swap (Addr      : System.Address;
                                        Old_Value : T;
                                        New_Value : T)
                                       return Interfaces.C.char
   is
      Data : T with Address => Addr;
      Ret  : Interfaces.C.char;

      procedure Inner
        with Inline_Always;

      procedure Inner
      is
      begin
         if Data = Old_Value then
            Data := New_Value;
            Ret := Interfaces.C.char'Succ (Interfaces.C.nul); -- True
         else
            Ret := Interfaces.C.nul; -- False
         end if;
      end Inner;

      procedure Atomic_Action is new Atomic_Wrapper (Inner);

   begin
      Atomic_Action;
      return Ret;
   end Sync_Bool_Compare_And_Swap;

   -----------------------------
   -- Atomic_Compare_Exchange --
   -----------------------------

   function Atomic_Compare_Exchange
     (Ptr           : Address;
      Expected      : Address;
      Desired       : T;
      Weak          : Interfaces.C.char;
      Success_Model : SAP.Mem_Model;
      Failure_Model : SAP.Mem_Model) return Interfaces.C.char
   is
      pragma Unreferenced (Weak);
      pragma Unreferenced (Success_Model);
      pragma Unreferenced (Failure_Model);

      Ptr_Value      : T with Address => Ptr;
      Expected_Value : T with Address => Expected;
      Ret            : Interfaces.C.char;

      procedure Inner
        with Inline_Always;

      procedure Inner
      is
      begin
         if Ptr_Value = Expected_Value then
            Ptr_Value := Desired;
            Ret := Interfaces.C.char'Succ (Interfaces.C.nul); -- True
         else
            Ret := Interfaces.C.nul; -- False
         end if;
      end Inner;

      procedure Atomic_Action is new Atomic_Wrapper (Inner);

   begin
      Atomic_Action;
      return Ret;
   end Atomic_Compare_Exchange;

end System.BB.Armv6m_Atomic;