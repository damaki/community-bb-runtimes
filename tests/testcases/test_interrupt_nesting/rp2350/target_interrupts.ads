with Ada.Interrupts;
with Ada.Interrupts.Names;

package Target_Interrupts is

   IRQ_1 : constant Ada.Interrupts.Interrupt_ID :=
     Ada.Interrupts.Names.SPARE_IRQ_0_Interrupt_CPU_1;

   IRQ_2 : constant Ada.Interrupts.Interrupt_ID :=
     Ada.Interrupts.Names.SPARE_IRQ_1_Interrupt_CPU_1;

   procedure Trigger_IRQ_1;
   procedure Trigger_IRQ_2;

   procedure Acknowledge_IRQ_1;
   procedure Acknowledge_IRQ_2;

end Target_Interrupts;
