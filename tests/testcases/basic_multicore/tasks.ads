package Tasks is

   task T2 with CPU => 2;

   --  Simple protected object to exchange integers between tasks

   protected Control is

      entry Send (Value : Integer);

      entry Receive (Value : out Integer);

   private

      Stored_Value : Integer := 0;
      Has_Value    : Boolean := False;

   end Control;

end Tasks;