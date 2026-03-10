with Ada.Real_Time;
with Ada.Text_IO;

package body A_Crate is

   task body T1 is
   begin
      delay until Ada.Real_Time.Time_Last;
   end T1;

   protected body PO is

      procedure IRQ_Handler is
      begin
         null;
      end IRQ_Handler;

   end PO;

   procedure Hello is
   begin
      Ada.Text_IO.Put_Line ("Hello from A_Crate");
   end Hello;

end A_Crate;
