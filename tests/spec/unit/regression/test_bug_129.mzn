/***
!Test
expected: !Result
  status: SATISFIED
***/

array[int] of int: x = [3,4];

array[int] of int : y = [x | x in 1..2 where z[x]];
array[int] of bool : z = [x[i] == 1| i in 1..2];

solve satisfy;