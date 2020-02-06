module second
import StdEnv

f x = x + 2

//Start = f 3

addIt a b = a + b

//sum a b = a + b

//Start = sum 2 3

mult x = 2 * x

times8 x = mult(mult(mult x))

//Start = times8 3
//^
//Start
//time8 3
//mult(mult(mult 3))
//2 * mult(mult 3)
//2 * 2 * mult 3
//2 * 2 * 2 * 3
//24

// Start = addIt 2 3
// ^
// Start
// addIt 2 3
// 2 + 3
// 5

times a b
| b == 0 = 0 //stop/exit/end condition
| b > 0 = a + ( times a (b-1) ) //repeated action

// times 2 3
// 2 + (times 2 2)
// the second number acts like an iterator 
// 2 + 2 + (times 2 1)
// 2 + 2 + 2 + (times 2 0)
// 2 + 2 + 2 + 0
// 6

// 2 * 3
// 2 + 2 + 2
// we are repeatedly + 
// we stop, when we add enough times

// a * b
//power a b = a ^ b

// a^b
// a * a * a * a * ..... b times

//Repeated action: a multiplies a
//Stop condition: a multiplies itself b times

power a b
| b == 0 = 1
| b > 0 = a * ( power a (b-1) ) //b acts as an iterator

//Start = power 2 3
//^
// Start
// power 2 3
// 3 == 0 --> false //skip!
// 3 > 0 --> true
// 2 * ( power 2 (3-1) )
// 2 * ( power 2 2 )
// 2 * ( 2 * ( power 2 (2-1) ) )
// 2 * ( 2 * ( power 2 1 ) )
// 2 * ( 2 * ( 2 * ( power 2 (1-1) ) ) )
// 2 * ( 2 * ( 2 * ( power 2 0 ) ) )
// 2 * ( 2 * ( 2 * ( 1 ) ) )
// 2 * ( 2 * ( 2 ) )
// 2 * ( 4 )
// 8

// 2 * (2 * 2)
// ( 2 * 2 ) * 2

// 1 - (2 - 3) = 1 - (-1) = 2
// (1 - 2) - 3 = (-1) - 3 = -4

/*
fibo n
| n == 1 = 0
| n == 2 = 1
= fibo (n-1) + fibo (n-2)
*/
fibo 1 = 0
fibo 2 = 1
fibo n = fibo (n-1) + fibo (n-2)

// 0 1 1 2 3 5
// ^+^
//Repeated action: add last number to last last number
//Stop condition: when we hit n

// Start = fibo 10
// ^
// Start
// fibo 3
// fibo (3-1) + fibo (3-2)
// fibo 2 + fibo 1
// 1 + 0
// 1

// Start = [fibo x \\ x<-[1..]]







