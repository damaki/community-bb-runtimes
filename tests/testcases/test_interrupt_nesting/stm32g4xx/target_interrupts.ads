with Ada.Interrupts;
with Ada.Interrupts.Names;

package Target_Interrupts is

   IRQ_1 : constant Ada.Interrupts.Interrupt_ID :=
     Ada.Interrupts.Names.TIM2_Interrupt;

   IRQ_2 : constant Ada.Interrupts.Interrupt_ID :=
     Ada.Interrupts.Names.TIM3_Interrupt;

   procedure Trigger_IRQ_1;
   procedure Trigger_IRQ_2;

   procedure Acknowledge_IRQ_1;
   procedure Acknowledge_IRQ_2;

end Target_Interrupts;
