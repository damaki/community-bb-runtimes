with Interfaces; use Interfaces;
with System;

package body Target_Interrupts is

   -----------
   -- IRQ 1 --
   -----------

   EGU0_INTENSET : Unsigned_32
   with Volatile, Import, Address => System'To_Address(16#4001_4304#);

   EGU0_TASKS_TRIGGER0 : Unsigned_32
   with Volatile, Import, Address => System'To_Address(16#4001_4000#);

   EGU0_EVENTS_TRIGGERED0 : Unsigned_32
   with Volatile, Import, Address => System'To_Address(16#4001_4100#);

   procedure Trigger_IRQ_1 is
   begin
      EGU0_INTENSET := 1;
      EGU0_TASKS_TRIGGER0 := 1;
   end Trigger_IRQ_1;

   procedure Acknowledge_IRQ_1 is
   begin
      EGU0_EVENTS_TRIGGERED0 := 0;
   end Acknowledge_IRQ_1;

   -----------
   -- IRQ 2 --
   -----------

   EGU1_INTENSET : Unsigned_32
   with Volatile, Import, Address => System'To_Address(16#4001_5304#);

   EGU1_TASKS_TRIGGER0 : Unsigned_32
   with Volatile, Import, Address => System'To_Address(16#4001_5000#);

   EGU1_EVENTS_TRIGGERED0 : Unsigned_32
   with Volatile, Import, Address => System'To_Address(16#4001_5100#);

   procedure Trigger_IRQ_2 is
   begin
      EGU1_INTENSET := 1;
      EGU1_TASKS_TRIGGER0 := 1;
   end Trigger_IRQ_2;

   procedure Acknowledge_IRQ_2 is
   begin
      EGU1_EVENTS_TRIGGERED0 := 0;
   end Acknowledge_IRQ_2;

end Target_Interrupts;