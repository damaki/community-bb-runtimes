procedure FP_Test (A, B, C : Long_Float; D : out Long_Float) is
begin
   D := (A + B) * C;
   D := D / A;
end FP_Test;