with Ada.Text_IO;

package body Handlers is

   protected body PO is

      procedure IRQ_Handler is
      begin
         Target_Interrupts.Acknowledge_IRQ;

         Ada.Text_IO.Put_Line ("IRQ triggered");
      end IRQ_Handler;

   end PO;

end Handlers;
