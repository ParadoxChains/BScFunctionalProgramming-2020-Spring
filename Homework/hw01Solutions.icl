module hw01Solutions
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
collatz :: Int -> Int
collatz n
| n==1 = 0
| isEven n = 1 + collatz (n/2)
| isOdd n = 1 + collatz (3*n + 1)

//Alternate Solution:
//This one uses tail recursion so that the function
//will not slowdown on big numbers.
collatzTail :: Int -> Int
collatzTail n = collatzAux n 0

collatzAux :: Int Int -> Int
collatzAux n counter
| n == 1 = counter
| isEven n = collatzAux (n/2) (counter+1)
| isOdd n = collatzAux (3*n + 1) (counter+1)
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
isPrime :: Int -> Bool
isPrime x = isPrimeAux x (x-1)

isPrimeAux :: Int Int -> Bool
isPrimeAux x n
| n == 1 = True
| x rem n == 0 = False
= isPrimeAux x (n-1)

//Alternate Solutions:
//Much shorter one line solutions using list comprehension.
//Two versions to work with.
//They are also far faster on fast numbers due to
//completion of evaluation at each step.
isPrime2 :: Int -> Bool
isPrime2 x = and[x rem n <> 0\\n<-[2..(x-1)]]

isPrime3 :: Int -> Bool
isPrime3 x = isEmpty[n\\n<-[2..(x-1)]|x rem n == 0]
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
isPalindrome :: Int -> Bool
isPalindrome n
| n < 0 = False
= theList == reverse theList
  where
    theList = numToList n

numToList :: Int -> [Int]
numToList n
| n < 10 = [n]
= numToList (n/10) ++[n rem 10]
//Start = isPalindrome 0 //True
//Start = isPalindrome 55 //True
//Start = isPalindrome 49594 //True
//Start = isPalindrome 1337 //False
//Start = isPalindrome (~57975) //False