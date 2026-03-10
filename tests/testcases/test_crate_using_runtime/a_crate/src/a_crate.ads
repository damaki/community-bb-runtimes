with Ada.Interrupts.Names;

pragma Unreferenced (Ada.Interrupts.Names);

package A_Crate is

   task T1 with Storage_Size => 200;

   protected PO is
   private
      procedure IRQ_Handler with Attach_Handler => 1;
   end PO;

   procedure Hello;

end A_Crate;
