with Ada.Text_IO;
with Ada.Exceptions;

--  Test with all the tasking stuff in the closure too

with Ada.Real_Time;
pragma Unreferenced (Ada.Real_Time);

procedure Test is
   procedure Raise_Ex with No_Inline is
   begin
      raise Constraint_Error with "Hello";
   end Raise_Ex;
begin
   Raise_Ex;
   Ada.Text_IO.Put_Line ("Exception not caught!");
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");

exception
   when Ex : Constraint_Error =>
      Ada.Text_IO.Put_Line ("Caught: " & Ada.Exceptions.Exception_Name (Ex));

      Ada.Text_IO.Put_Line
        ("Message: " & Ada.Exceptions.Exception_Message (Ex));

      Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;
