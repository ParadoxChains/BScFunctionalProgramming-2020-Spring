module cw01g2_Solutions
import StdEnv

// Given an integer, write a function
// that returns the sum of all
// odd numbers less than equal than it.
f1 :: Int -> Int
f1 x = f1aux (x-1)

f1aux :: Int -> Int
f1aux x
| x <= 0 = 0
| isEven x = f1aux (x-1)
= x + f1aux (x-2)

//sStart = f1 5 //4
// ^
// f1 5
// 5 + f1 (5-2)
// 5 + f1 3
// 5 + 3 + f1 (3-2)
// 5 + 3 + f1 1
// 5 + 3 + 1 + f1 (1-2)
// 5 + 3 + 1 + f1 ~1
// 5 + 3 + 1 + 0
// Start = f1 12 //36
// Start = f1 ~6 //0

// isOdd
// in Clean modulus is 'rem'
// 13 rem 10 = 3
// in Clean, equality is '=='


// How many different ways are there
// to distribute 'n' homework problems
// amongst 'm' number of friends?
fact 1 = 1
fact x = x * fact(x-1)

f2 :: Int Int -> Int
f2 n m
| n <= 0 || m <= 0 = 0
| n >= m = (fact n) / ( fact (n-m) * (fact m))
| n < m = f2 m n

// Start = f2 200 4 //64684950
// Start = f2 2 4 //6
// Start = f2 ~4 4 //0
// Start = f2 9999999 0 //0


// Given an integer, write a function
// that will sum up its digits.
// 1234 -> 1 + 2 + 3 + 4
// 1234/10 = 123
// rem
// 13 rem 10 = 3

f3 :: Int -> Int
f3 x = f3 x
| x <= 0 = 0
= (x rem 10) + f3 (x/10)

// Start = f3 1234 //10
// Start = f3 506 //11
// Start = f3 6 //6
// Start = f3 ~91 //10