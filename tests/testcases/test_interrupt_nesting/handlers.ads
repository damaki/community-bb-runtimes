with System;

with Target_Interrupts;

package Handlers is

   --  Protected object with a lower priority

   protected Lower_PO
     with Interrupt_Priority => System.Interrupt_Priority'First
   is

      procedure Set_Trigger_Higher (T : Boolean);

   private
      procedure IRQ_Handler with Attach_Handler => Target_Interrupts.IRQ_1;

      Trigger_Higher : Boolean := False;

   end Lower_PO;

   --  Protected object with a higher priority

   protected Higher_PO
     with Interrupt_Priority => System.Interrupt_Priority'Last
   is

      procedure Set_Trigger_Lower (T : Boolean);

   private
      procedure IRQ_Handler with Attach_Handler => Target_Interrupts.IRQ_2;

      Trigger_Lower : Boolean := False;

   end Higher_PO;

end Handlers;
