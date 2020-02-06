module cw05g1
import StdEnv


/* 1. Given a list of integers, decide if they are pairwisely relatively prime or not.
(Two integers are relatively prime (or coprime) 
if there is no integer greater than one that divides both of them)
*/
//f1::[Int]->Bool
//Start = f1 [] //True
//Start = f1 [1,3,7,9] //False (3,9) not
//Start = f1 [11,12,13] //True


// 2. Define a record type for rational numbers, and add two rational numbers.
//f2 :: Q Q -> Q
//Start=f2 {nom=2,den=4} {nom=2,den=3} //(Q 7 6) 
//Start=f2 {nom=2,den=4} {nom=2,den=4} //(Q 1 1)



/* 3.Given a integer, return a tuple containing
a list of its divisors as the first element of the tuple,
and the mean value of that list as the second element of the tuple.
*/
//f3 :: Int -> ([Int],Real)
//Start = f3 8 //([1,2,4,8],3.75)
//Start = f3 9 //([1,3,9],4.33333333333333)
//Start = f3 15 //([1,3,5,15],6)