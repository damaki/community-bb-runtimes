with Interfaces; use Interfaces;
with System;

package body Target_Interrupts is

   EGU0_INTENSET : Unsigned_32
   with Volatile, Import, Address => System'To_Address(16#4001_4304#);

   EGU0_TASKS_TRIGGER0 : Unsigned_32
   with Volatile, Import, Address => System'To_Address(16#4001_4000#);

   EGU0_EVENTS_TRIGGERED0 : Unsigned_32
   with Volatile, Import, Address => System'To_Address(16#4001_4100#);

   procedure Trigger_IRQ is
   begin
      EGU0_INTENSET := 1;
      EGU0_TASKS_TRIGGER0 := 1;
   end Trigger_IRQ;

   procedure Acknowledge_IRQ is
   begin
      EGU0_EVENTS_TRIGGERED0 := 0;
   end Acknowledge_IRQ;

end Target_Interrupts;