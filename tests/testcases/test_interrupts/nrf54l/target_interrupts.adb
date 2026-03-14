with Interfaces; use Interfaces;
with System;

package body Target_Interrupts is

   NVIC_ISPR0 : Unsigned_32
   with Volatile, Import, Address => System'To_Address (16#E000_E200#);

   NVIC_ICPR0 : Unsigned_32
   with Volatile, Import, Address => System'To_Address (16#E000_E280#);

   IRQ_Mask : constant Unsigned_32 := 2**Integer (IRQ);

   procedure Trigger_IRQ is
   begin
      NVIC_ISPR0 := IRQ_Mask;
   end Trigger_IRQ;

   procedure Acknowledge_IRQ is
   begin
      NVIC_ICPR0 := IRQ_Mask;
   end Acknowledge_IRQ;

end Target_Interrupts;