--  Reduce memory usage to fit on targets with small memory
pragma Restrictions (No_Secondary_Stack);

with A_Crate;
with Ada.Text_IO;

--  This test checks that a crate that has no explicit dependency on any
--  runtime is able to use runtime units such as Ada.Real_Time.

procedure Test is
begin
   A_Crate.Hello;
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;