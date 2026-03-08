package body Tasks is

   task body T2 is
   begin
      for I in Integer range 1 .. 3 loop
         Control.Send (I);
      end loop;

      loop
         null;
      end loop;
   end T2;

   protected body Control is

      entry Send (Value : Integer) when not Has_Value is
      begin
         Stored_Value := Value;
         Has_Value := True;
      end Send;

      entry Receive (Value : out Integer) when Has_Value is
      begin
         Value := Stored_Value;
         Has_Value := False;
      end Receive;

   end Control;

end Tasks;
