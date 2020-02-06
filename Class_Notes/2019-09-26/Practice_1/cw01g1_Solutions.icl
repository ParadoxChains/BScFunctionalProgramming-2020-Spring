module cw01g1_Solutions

import StdEnv



// Given two integers, write a function

// that will give us their least common multiple.

// int f1(int a, int b)
// {
//    return f1aux(a,b,1);
// }
f1 :: Int Int -> Int
f1 a b = f1aux (abs a) (abs b) 1
// int f1aux(int a, int b, int z)
// {
// do stuff here
// }
f1aux :: Int Int Int -> Int
f1aux a b z //z go from 1 up to LCM
| (z rem a == 0) && (z rem b == 0) = z
= f1aux a b (z+1)

f1list :: Int Int -> Int
f1list a b = hd(dropWhile (\x = (x rem a <> 0) || (x rem b <> 0))[1..])
// Start = f1 3 4 //12

// Start = f1 0 5 //0

// Start = f1 ~7 4 //28

// Start = f1 12 10 //60

// rem is the modulus operator.
// a rem b = 0 iff a is a multiple of b
// unary operator ~a -> negative
// binary operator b - a


// Given 'n' number of friends

// and 'm' pieces of cake, 

// how many different ways are there to

// distribute these pieces of cake?

f2 :: Int Int -> Int
f2 a b
| a < b = f2 b a
| a < 0 || b < 0 = 0
= (fact a)/( fact(a-b)*(fact b))

fact x
| x == 0 = 1
= x * fact (x-1)

factList x = prod[1..x]

// Start = f2 5 2 //10

// Start = f2 5 8 //56

// Start = f2 5 ~13 //0

// Start = f2 ~4 9999 //0



// Given an integer, write a function

// that will check if each digit is even.

// 1234 -> 1 2 3 4
// 1234 rem 10 = 4
// 1234 / 10 = 123

f3 :: Int -> Bool
f3 num
| num < 10 = isEven num
= isEven(num rem 10) && f3 (num/10)

// Start = f3 1234 //False

// Start = f3 506 //True

// Start = f3 ~846 //True