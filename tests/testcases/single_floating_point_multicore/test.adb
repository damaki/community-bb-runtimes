with Ada.Text_IO;
with FP_Test;

--  This test checks that floating point works correctly on the second CPU.
--
--  A task on the second CPU performs a floating point calculation and sends
--  it to this environment task via a protected object.

procedure Test is
   Value : Float;
begin
   FP_Test.PO.Get (Value);
   Ada.Text_IO.Put_Line ("Value =" & Value'Image);
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;