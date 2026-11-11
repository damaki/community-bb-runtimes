with Ada.Text_IO;

procedure Test is
begin
   Ada.Text_IO.Put_Line ("Hello from Segger RTT!");
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");

   --  Avoid returning too quickly to give the J-Link time to find the RTT
   --  control block and read the output buffer.
   loop
      null;
   end loop;
end Test;