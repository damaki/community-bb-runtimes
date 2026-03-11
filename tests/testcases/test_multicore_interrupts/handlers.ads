with Ada.Synchronous_Task_Control;
with System;

with Target_Interrupts;

package Handlers is

   Flag : Boolean := False with Atomic;
   --  Flag that is set to True from the IRQ_Handler on CPU 2

   protected PO_1
     with Interrupt_Priority => System.Interrupt_Priority'Last
   is

      procedure Trigger_IRQ_And_Wait_For_Flag;

   end PO_1;

   protected PO_2
     with Interrupt_Priority => System.Interrupt_Priority'Last
   is

   private
      procedure IRQ_Handler with Attach_Handler => Target_Interrupts.IRQ;

   end PO_2;


end Handlers;
