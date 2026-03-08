with Ada.Text_IO;
with Tasks;

procedure Test is
   Value : Integer := Integer'First;
begin
   for I in Integer range 1 .. 3 loop
      Tasks.Control.Receive (Value);
      Ada.Text_IO.Put_Line ("Got value:" & I'Image);
   end loop;

   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;