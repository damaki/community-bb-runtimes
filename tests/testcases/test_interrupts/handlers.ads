with System;

with Target_Interrupts;

package Handlers is

   protected PO
     with Interrupt_Priority => System.Interrupt_Priority'First
   is

   private
      procedure IRQ_Handler with Attach_Handler => Target_Interrupts.IRQ;

   end PO;

end Handlers;
