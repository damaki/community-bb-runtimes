with Ada.Interrupts;
with Ada.Interrupts.Names;

package Target_Interrupts is

   IRQ : constant Ada.Interrupts.Interrupt_ID :=
     Ada.Interrupts.Names.SWI00_Interrupt;

   procedure Trigger_IRQ;
   procedure Acknowledge_IRQ;

end Target_Interrupts;
