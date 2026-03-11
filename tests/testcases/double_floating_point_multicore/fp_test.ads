package FP_Test is

   procedure Calculate (A, B, C : Long_Float; D : out Long_Float)
   with No_Inline;

   protected PO is
      procedure Set (Value : Long_Float);
      entry Get (Value : out Long_Float);

   private
      Stored_Value : Long_Float := 0.0;
      Has_Value : Boolean := False;
   end PO;

   task T2 with CPU => 2;

end FP_Test;