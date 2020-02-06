module second
import StdEnv

// single line comment

/*
Multi
Line
Comment
*/

/*
f x = x+2
double x = 2 * x
addMeSomeNumbersBaby a b = a + b
*/

//Start = addMeSomeNumbersBaby 3 2


times2 x = 2 * x
times8 x = times2(times2(times2 x))

//Start = times2 3
// Start = times8 3
// ^
// Start
// times8 3
// times2(times2(times2 3))
// 2 * times2(times2 3)
// 2 * 2 * times2 3
// 2 * 2 * 2 * 3
// 24

//multUs a b = a * b
//write a version WITHOUT (*)
//hint, * is repeated +

//Repeated Action: add a to as
//Stop/Exit/End Condition: add a, b times
// 2 * 3
// 2 + 2 + 2


multUs a b
| b == 0 = 0
| b > 0 = a + ( multUs a (b-1) ) //b acts an iterator

/*
multUs _ 0 = 0
multUs a b = a + ( multUs a (b-1) )
*/

// | condition = statement
// if (condition) then {statement}

//Start = multUs 2 3
// ^
// Start
// multUs 2 3
// 3 == 0 --> false //ignore!
// 3 > 0 --> true!
// 2 + ( multUs 2 (3-1) )
// 2 + ( multUs 2 2 )
// 2 + 2 + ( multUs 2 (2-1) )
// 2 + 2 + ( multUs 2 1 )
// 2 + 2 + 2 + ( multUs 2 (1-1) )
// 2 + 2 + 2 + ( multUs 2 0 )
// 2 + 2 + 2 + 0
// 6

//expUs a b = a ^ b
//write this with recursion
//2 ^ 3 = 2 * 2 * 2
//Repeated action: multiplication on a
//Stop condition: we multiplied a b times

expUs a b
| b == 0 = 1
| b > 0 = a * ( expUs a (b-1) )

//Fibonacci sequence
// 0 1 1 2 3 5 8 13 21

// takes n as a parameter and gives you the n'th fib
// Repeated action: add the last number to the last last number
// Stop Condition: when we hit the nth number.

fib n
| n == 1 = 0
| n == 2 = 1
= fib (n-1) + fib (n-2)
//| otherwise = 

//Start = fib 9

//Start = [fib x \\ x<-[1..]]

// Start = fib 3
// ^
// Start
// fib 3
// fib (3-1) + fib (3-2)
// fib 2 + fib 1
// 1 + 0
// 1


// Start = fib 5
// ^
// Start
// fib 5
// fib (5-1) + fib (5-2)
// fib 4 + fib 3
// fib (4-1) + fib (4-2) + fib (3-1) + fib (3-2)
// ...


