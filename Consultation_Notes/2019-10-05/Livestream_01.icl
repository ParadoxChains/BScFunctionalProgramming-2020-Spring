module Livestream_01
import StdEnv

//Defaults -> Windows Settings -> Editor Settings
//Start = "Hello World" //<-Program starts from Start.

//Start = 2 + 3 //5
//    y = 2 + 3

// f(x) = x + 2
// f(3) = 3 + 2 = 5
// f x = x + 2
// Start = f 3 = 3 + 2 = 5
//     y = f(3)= 3 + 2 = 5
// g(a) = 3 * a
// g(2) = 3 * 2
// g a = 3 * a
//
// g( f(56) ) = 3*f(56)
// g( f(56) ) = 3* (56 + 2)
// g( f(56) ) = 3* 58
// g( f(56) ) = 174
// g ( f 56 ) = 3 * a
// g ( f 56 ) = 3 * f 56
// g ( f 56 ) = 3 * 56 + 2


g a = a * 2

f b = b + 3

//Start = f (g (f (g (f 1))))
//^
//Start
//f (g (f (g (f 1)))) //b_1 = 1
//(g (f (g (f 1)))) + 3 //a_1 = 4
//((f (g (f 1))) * 2) + 3 //b_2 = 8
//(((g (f 1)) + 3 * 2) + 3 //a_2 = 11
//((((f 1) * 2) + 3 * 2) + 3 //b_3 = 22
//((((1 + 3) * 2) + 3 * 2) + 3 //a_3 = 25
//25

func1 x
| isEven x = x + 2
| isOdd x = x+3

//sa=4
//lfel = func1 sa
//Start = lfel //6

/*
infix 4 :: [a] [a] -> Bool | <, = a
for example when u define functions like this
*/
// we have two lists of type a, and the return result
// is of type boolean
// and the function requires that type a has
// equality and less than defined for it.

// [a] b (c,a) -> b

/*
&& -> and
|| -> or
not  
*/
//Start = not True
//False
//Start = not( ( (2==2)||(3>100) )&&(5>89) )
//                 True|| False
//                     True       && False
//                   not  False
//  True















