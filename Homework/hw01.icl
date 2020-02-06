module hw01
import StdEnv

/**
  * Write a function that tests the Collatz conjecture.
  * Given a number 'n', if it is even, divide it by 2.
  * If 'n' is odd, multiply by 3 and add 1.
  * Repeat until the number reaches 1.
  * This function should return the total stopping time,
  * which is the number of steps it took to reach 1.
  *
  * Total: 30pts
  */
//collatz :: Int -> Int
//Start = collatz 34 //13
//Start = collatz(collatz 10000001) //33
//Start = collatz 1 //0
//Start = collatz (~56) //0

/**
  * Write a function that takes an integer 'x'
  * and returns a boolean corresponding to whether or not x is prime.
  * A prime number is a number that has only itself and 1 as divisors.
  * 1 is not prime.
  *
  * Total: 30pts
  */
//isPrime :: Int -> Bool
//Start = isPrime 5 //True
//Start = isPrime (~3) //False (Negative numbers don't count, only Natural numbers)
//Start = isPrime 0 //False
//Start = isPrime 1 //False
//Start = isPrime 28736 //False

/**
  * Write a function that takes an integer 'x'
  * and checks if this number is a palindrome.
  * A palindrome is a number or word that is identical 
  * when written forward or backwards.
  *
  * e.g. 1234 is not a palindrome. 145626541 is a palindrome.
  * Total: 40pts
  */
//isPalindrome :: Int -> Bool
//Start = isPalindrome 0 //True
//Start = isPalindrome 55 //True
//Start = isPalindrome 49594 //True
//Start = isPalindrome 1337 //False
//Start = isPalindrome (~57975) //False