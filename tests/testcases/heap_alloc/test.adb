with Ada.Text_IO;

procedure Test is
   type Int_Acc is access Integer;

   X : Int_Acc := new Integer'(123);
begin
   Ada.Text_IO.Put_Line (X.all'Image);
   Ada.Text_IO.Put_Line ("===TEST COMPLETE===");
end Test;