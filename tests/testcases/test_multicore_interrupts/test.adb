with Ada.Text_IO;
with Handlers;
with Target_Interrupts;

--  This test checks that an interrupt handler installed on CPU 2 works
--  correctly.
--
--  The sequence of actions is as follows:
--   1. CPU 1 calls a protected procedure, which blocks out all other
--      interrupts from triggering on this CPU by raising the current priority
--      to Interrupt_Priority'Last.
--   2. The protected procedure triggers the interrupt on CPU 2 and waits in
--      a loop on a Boolean flag.
--   3. The interrupt is triggered on CPU 2, which sets the flag to True.
--   4. CPU 1 exits its loop and returns from the protected procedure.

procedure Test is

begin
   Ada.Text_IO.Put_Line ("Before Trigger_IRQ_And_Wait_For_Flag");
   Handlers.PO_1.Trigger_IRQ_And_Wait_For_Flag;
   Ada.Text_IO.Put_Line ("After Trigger_IRQ_And_Wait_For_Flag");
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;