with Ada.Text_IO;
with Ada.Real_Time;

procedure Test is
   use type Ada.Real_Time.Time;

   Now : Ada.Real_Time.Time := Ada.Real_Time.Clock;

begin

   Ada.Text_IO.Put_Line ("Before delay");
   delay until Now + Ada.Real_Time.Milliseconds (500);
   Ada.Text_IO.Put_Line ("After delay");
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");

end Test;