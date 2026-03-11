with Ada.Interrupts;
with Ada.Interrupts.Names;

package Target_Interrupts is

   IRQ : constant Ada.Interrupts.Interrupt_ID :=
     Ada.Interrupts.Names.TIMER_IRQ_0_Interrupt_CPU_1;

   procedure Trigger_IRQ;
   procedure Acknowledge_IRQ;

end Target_Interrupts;
