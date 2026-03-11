with Interfaces; use Interfaces;
with System;

package body Target_Interrupts is

   NVIC_ISPR1 : Unsigned_32
   with Volatile, Import, Address => System'To_Address (16#E000_E204#);

   NVIC_ICPR1 : Unsigned_32
   with Volatile, Import, Address => System'To_Address (16#E000_E284#);

   -----------
   -- IRQ 1 --
   -----------

   IRQ_1_Mask : constant Unsigned_32 := Shift_Left (1, 14);

   procedure Trigger_IRQ_1 is
   begin
      NVIC_ISPR1 := IRQ_1_Mask;
   end Trigger_IRQ_1;

   procedure Acknowledge_IRQ_1 is
   begin
      NVIC_ICPR1 := IRQ_1_Mask;
   end Acknowledge_IRQ_1;

   -----------
   -- IRQ 2 --
   -----------

   IRQ_2_Mask : constant Unsigned_32 := Shift_Left (1, 15);

   procedure Trigger_IRQ_2 is
   begin
      NVIC_ISPR1 := IRQ_2_Mask;
   end Trigger_IRQ_2;

   procedure Acknowledge_IRQ_2 is
   begin
      NVIC_ICPR1 := IRQ_2_Mask;
   end Acknowledge_IRQ_2;

end Target_Interrupts;