package body FP_Test is

   procedure Calculate (A, B, C : Long_Float; D : out Long_Float) is
   begin
      D := (A + B) * C;
      D := D / A;
   end Calculate;

   protected body PO is

      procedure Set (Value : Long_Float) is
      begin
         Stored_Value := Value;
         Has_Value := True;
      end Set;

      entry Get (Value : out Long_Float) when Has_Value is
      begin
         Value := Stored_Value;
         Has_Value := False;
      end Get;

   end PO;

   task body T2 is
      A : constant Long_Float := 2.5;
      B : constant Long_Float := 3.25;
      C : constant Long_Float := 4.75;
      D : Long_Float;
   begin
      Calculate (A, B, C, D);
      PO.Set (D);
   end T2;

end FP_Test;
