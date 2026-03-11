package body FP_Test is

   procedure Calculate (A, B, C : Float; D : out Float) is
   begin
      D := (A + B) * C;
      D := D / A;
   end Calculate;

   protected body PO is

      procedure Set (Value : Float) is
      begin
         Stored_Value := Value;
         Has_Value := True;
      end Set;

      entry Get (Value : out Float) when Has_Value is
      begin
         Value := Stored_Value;
         Has_Value := False;
      end Get;

   end PO;

   task body T2 is
      A : constant Float := 2.5;
      B : constant Float := 3.25;
      C : constant Float := 4.75;
      D : Float;
   begin
      Calculate (A, B, C, D);
      PO.Set (D);
   end T2;

end FP_Test;
