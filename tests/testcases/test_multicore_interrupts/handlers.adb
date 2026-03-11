package body Handlers is

   protected body PO_1 is

      procedure Trigger_IRQ_And_Wait_For_Flag is
      begin
         --  Trigger the interrupt from within this protected object so that
         --  the current priority is raised to the Interrupt_Priority'Last.
         --  This locks out any other interrupt from occurring on this CPU,
         --  so the only way for PO_2.IRQ_Handler to run is on another CPU.
         --
         --  The only way for the loop to exit is for CPU 2 to set Flag to True
         --  from within PO_2.IRQ_Handler.

         Target_Interrupts.Trigger_IRQ;
         loop
            exit when Flag;
         end loop;
      end Trigger_IRQ_And_Wait_For_Flag;

   end PO_1;

   protected body PO_2 is

      procedure IRQ_Handler is
      begin
         Target_Interrupts.Acknowledge_IRQ;
         Flag := True;
      end IRQ_Handler;

   end PO_2;

end Handlers;
