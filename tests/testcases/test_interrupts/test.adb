with Ada.Text_IO;
with Handlers;
with Target_Interrupts;

--  This test checks that interrupt handlers work correctly

procedure Test is

begin
   Ada.Text_IO.Put_Line ("Before Trigger_IRQ");
   Target_Interrupts.Trigger_IRQ;
   Ada.Text_IO.Put_Line ("After Trigger_IRQ");
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;