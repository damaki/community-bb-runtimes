with Interfaces; use Interfaces;
with System;

package body Target_Interrupts is

   NVIC_ISPR1 : Unsigned_32
   with Volatile, Import, Address => System'To_Address (16#E000_E204#);

   NVIC_ICPR1 : Unsigned_32
   with Volatile, Import, Address => System'To_Address (16#E000_E284#);

   IRQ_Mask : constant Unsigned_32 := Shift_Left (1, Natural (IRQ) - 32);

   procedure Trigger_IRQ is
   begin
      NVIC_ISPR1 := IRQ_Mask;
   end Trigger_IRQ;

   procedure Acknowledge_IRQ is
   begin
      NVIC_ICPR1 := IRQ_Mask;
   end Acknowledge_IRQ;

end Target_Interrupts;