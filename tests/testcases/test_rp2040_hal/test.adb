with Ada.Text_IO;

with RP.GPIO;
with Pico;

procedure Test is
begin
   Pico.LED.Configure (RP.GPIO.Output);
   Pico.LED.Set;
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;