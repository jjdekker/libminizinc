% La suma de los booleanos es x = s
predicate bool_sum_eq(array[int] of var bool:x, int:s) =
     let { int: c = length(x) } in
     if s < 0 then false
     elseif s == 0 then forall(i in 1..c)(x[i] == false)
     elseif s < c then
          let
          {
            % cp = potencia más cercana de 2 >= c
            int: cp = pow(2,ceil(log2(int2float(c)))),
            array[1..cp] of var bool:y, % y es la versión acolchada de x
            array[1..cp] of var bool:z
          } in
          forall(i in 1..c)(y[i] == x[i]) /\
          forall(i in c+1..cp)(y[i] == false) /\
          oesort(y, z) /\ z[s] == true /\ z[s+1] == false
     elseif s == c then forall(i in 1..c)(x[i] == true)
     else false endif;

include "oesort.mzn";
