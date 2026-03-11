package FP_Test is

   procedure Calculate (A, B, C : Float; D : out Float)
   with No_Inline;

   protected PO is
      procedure Set (Value : Float);
      entry Get (Value : out Float);

   private
      Stored_Value : Float := 0.0;
      Has_Value : Boolean := False;
   end PO;

   task T2 with CPU => 2;

end FP_Test;