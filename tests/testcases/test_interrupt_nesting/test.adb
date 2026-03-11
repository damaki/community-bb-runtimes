with Ada.Text_IO;
with Handlers;
with Target_Interrupts;

--  This test checks that interrupt nesting works correctly, i.e. that a
--  an interrupt with a higher priority is able to preempt a lower-priority
--  interrupt, but not vice-versa.

procedure Test is

   procedure Trigger_Lower_IRQ is
   begin
      Ada.Text_IO.Put_Line ("Before Trigger_Lower_IRQ");
      Target_Interrupts.Trigger_IRQ_1;
      Ada.Text_IO.Put_Line ("After Trigger_Lower_IRQ");
   end Trigger_Lower_IRQ;

   procedure Trigger_Higher_IRQ is
   begin
      Ada.Text_IO.Put_Line ("Before Trigger_Higher_IRQ");
      Target_Interrupts.Trigger_IRQ_2;
      Ada.Text_IO.Put_Line ("After Trigger_Higher_IRQ");
   end Trigger_Higher_IRQ;

begin

   --  Trigger each interrupt, one at a time

   Trigger_Lower_IRQ;
   Trigger_Higher_IRQ;

   --  Trigger IRQ 2 while IRQ 1 is active.
   --
   --  IRQ 2 should preempt IRQ 1 since it is higher priority.

   Handlers.Lower_PO.Set_Trigger_Higher (True);
   Trigger_Lower_IRQ;

   --  Trigger IRQ 1 while IRQ 2 is active.
   --
   --  IRQ 1 should run *after* IRQ 2 because it is lower priority.

   Handlers.Lower_PO.Set_Trigger_Higher (False);
   Handlers.Higher_PO.Set_Trigger_Lower (True);
   Trigger_Higher_IRQ;

   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;