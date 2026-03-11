with Interfaces; use Interfaces;
with System;

package body Target_Interrupts is

   TIMER_INTE : Unsigned_32
   with Volatile, Import, Address => System'To_Address (16#4005_4038#);

   TIMER_INTF : Unsigned_32
   with Volatile, Import, Address => System'To_Address (16#4005_403C#);

   procedure Trigger_IRQ is
   begin
      TIMER_INTE := 1;
      TIMER_INTF := 1;
   end Trigger_IRQ;

   procedure Acknowledge_IRQ is
   begin
      TIMER_INTF := 0;
      TIMER_INTE := 0;
   end Acknowledge_IRQ;

end Target_Interrupts;