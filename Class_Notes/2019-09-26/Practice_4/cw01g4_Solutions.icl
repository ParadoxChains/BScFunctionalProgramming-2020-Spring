module cw01g4_Solutions
import StdEnv

// Determine the greatest common divisor of two
// positive integer numbers.
f1 :: Int Int -> Int
//interface function
f1 a b
| a < b = f1 b a
= f1aux a b b

// modulus in Clean is 'rem'
// 5 rem 3 = 2
f1aux a b c
| (a rem c == 0)&&(b rem c ==0) = c
= f1aux a b (c-1)
// int f1 (int a, int b);
// Start = f1 5 15 // 5
// Start = f1 6 11 // 1
// Start = f1 6 15 // 3

// You are climbing a stair case. It takes n steps to reach to the top.
// Each time you can either climb 1 or 2 steps.
// In how many distinct ways can you climb to the top?
// USE COMBINATION ON 2

// The math here is supposed to involve
// some lovely double recursion.
// Since we don't have time to cover that
// crazy math, we're just going to do
// combination. Sorry.



factList x = prod [1..x]

fact x
| x == 0 = 1
= x * fact (x-1)
f2 :: Int -> Int
f2 n = (fact n)/( fact(n-2)*(fact 2) )
// Start = f2 2 // 1
// Start = f2 3 // 3 

// Given an integer, write a function that returns
// the largest digit in the integer.
f3 :: Int -> Int
f3 a
| a < 0 = f3 (abs a)
| a < 10 = a
= f3aux (a/10) (a rem 10)
//13121
//f3aux 1312 1

f3aux :: Int Int -> Int
f3aux a maxDigit //maxDigit keeps track of the max digit
| a <= 0 = maxDigit
| (a rem 10) > maxDigit = f3aux (a/10) (a rem 10)
| (a rem 10) <= maxDigit = f3aux (a/10) maxDigit
// f3aux 1312 1
// f3aux 131 2
// f3aux 13 2
// f3aux 1 3
// f3aux 0 3

// Start = f3 564 //6
// Start = f3 5 //5
// Start = f3 -6793 //9

// rem
// 1234 rem 10 = 4
// 1234/10 = 123