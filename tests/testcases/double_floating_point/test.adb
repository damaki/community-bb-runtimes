with Ada.Text_IO;
with FP_Test;

procedure Test is
   A : constant Long_Float := 2.5;
   B : constant Long_Float := 3.25;
   C : constant Long_Float := 4.75;
   D : Long_Float;
begin
   FP_Test (A, B, C, D);
   Ada.Text_IO.Put_Line ("D =" & D'Image);
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;