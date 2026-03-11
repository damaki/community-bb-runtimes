with Ada.Text_IO;

package body Handlers is

   protected body Lower_PO is

      procedure Set_Trigger_Higher (T : Boolean) is
      begin
         Trigger_Higher := T;
      end Set_Trigger_Higher;

      procedure IRQ_Handler is
      begin
         Target_Interrupts.Acknowledge_IRQ_1;

         Ada.Text_IO.Put_Line ("Entered IRQ_1");

         if Trigger_Higher then
            Target_Interrupts.Trigger_IRQ_2;
         end if;

         Ada.Text_IO.Put_Line ("Exiting IRQ_1");
      end IRQ_Handler;

   end Lower_PO;

   protected body Higher_PO is

      procedure Set_Trigger_Lower (T : Boolean) is
      begin
         Trigger_Lower := T;
      end Set_Trigger_Lower;

      procedure IRQ_Handler is
      begin
         Target_Interrupts.Acknowledge_IRQ_2;

         Ada.Text_IO.Put_Line ("Entered IRQ_2");

         if Trigger_Lower then
            Target_Interrupts.Trigger_IRQ_1;
         end if;

         Ada.Text_IO.Put_Line ("Exiting IRQ_2");
      end IRQ_Handler;

   end Higher_PO;

end Handlers;
