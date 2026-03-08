procedure FP_Test (A, B, C : Float; D : out Float) is
begin
   D := (A + B) * C;
   D := D / A;
end FP_Test;