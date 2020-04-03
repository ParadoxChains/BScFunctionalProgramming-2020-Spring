module hofcurrying
import StdEnv

/*
Currying: treats equivalently the following two types
Int Int -> Int
Int -> (Int -> Int)
*/

//Start = filter (\x = x<5) [1..10]

filter10 :: [Int] -> [Int]
filter10 list = filter (\x = x<10) list
// filter10 [] = []
// filter10 [x:xs]
// | x<10 = [x] ++ filter10 xs
// = filter10 xs

// map filter takeWhile dropWhile foldr foldl

//Start = map ((+)1) [1..10]
//Start = foldr (+) 1 [1..4]
//Start = foldr (\x y = y - x) 10 [1..3]

//(+) :: Int Int -> Int
//Start = 2 + 3
//Start = (+) 2 3
//Start = ( (+) 2 )  3 //currying
//Start = ((-) 2  )  3 //3 curries into the second argument
//Start = map ((-) 5) [1..10] 
// (-) 5 1 => 5 - 1

//Start = foldr (-) 0 [1..3] //1-(2-(3-0)) //foldr uses the initial/result as the SECOND argument.
                                        //foldr curries in the new argument as the FIRST argument.
                                        //foldl curries the other way.

// foldr (someFunction) neutralElement  [listofElementstoProcess]
//Start = foldr (+) 0 [1..10]
//Start = foldr (*) 1 [1..3]
factorial :: Int -> Int
//factorial n = foldr (*) 1 [1..n]
factorial n = prod[1..n]
//Start = factorial 3

//Start = foldr (\ newElement list = [newElement * 2]  ++ list )  []  [1..10]
//Start = foldr (\ newElement list = [newElement] ++ list ++ [newElement]) [] [1..5]
//Start = filter isEven [1..10]
//Start = foldr (\ newElement list | isEven newElement = [newElement] ++ list = list) [] [1..10]

/*
Given a list of numbers. Return a list of the squares of the prime numbers that are less than n.
*/

//prime numbers
isPrime :: Int -> Bool
isPrime n = and[ n rem x <> 0 \\x<-[2..(n-1)]] //this one works by boolean evaluation
//isPrime n = isEmpty[ x \\x<-[2..(n-1)] | n rem x == 0 ] //this one generates a list of divisors

//Start = isPrime 100000000
//Start = (\n = [2..(n-1)]) 8 //[2,3,4,5,6,7] list of possible divisors
//Start = (\n = [ n rem x <> 0 \\x<-[2..(n-1)]]) 8 //[False,True,False,True,True,True]
//and [True, True, True] = True
//and [True, False, True, True] = False
//Start = (\n = [ x \\x<-[2..(n-1)] | n rem x == 0 ]) 8 //[2,4] //generates list of divisors out of potential divisors

//list of squares
listSquares :: [Int] -> [Int]
listSquares list = [ x^2  \\ x<-list   ]
//listSquares list = map (\x = x^2) list

//Start = listSquares [1..10]

//less than n
lessThanN :: [Int] Int -> [Int]
lessThanN list n = filter (\x = x<n) list

//Start = lessThanN [1..100] 25

finalFunc :: [Int] Int -> [Int]
//finalFunc list n = lessThanN (listSquares (filter isPrime list)) n
finalFunc list n = result
where
    primes = filter isPrime list
    squares = listSquares primes
    lessN = lessThanN squares n
    result = lessN

//Start = finalFunc [1..10] 25 // [1,4,9]

// if we have a number 4.328438538, how do we get just 4?
//Start = toInt 4.328438538

//if we have number 4.328438538, how do we get .328438538
// 4
decimalPart :: Real -> Real
decimalPart n = result
where
    intPart = toInt n 
    result = n - toReal(intPart)

//Start = decimalPart 4.328438538
