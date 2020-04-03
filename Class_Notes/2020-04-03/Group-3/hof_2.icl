module hof_2

import StdEnv

// Start = [(x, y) \\ x <- [1..3] & y <- [5..8]]

// Start = [(x, y) \\ x <- [1..3] , y <- [5..8]]


//! takeWhile & dropWhile
// Start = takeWhile isOdd [4, 1, 3, 5, 4, 9]
// Start = dropWhile isOdd [4, 3, 5, 4, 9]

//1. Drop while the first prime number
isPrime :: Int -> Bool
isPrime 1 = False
isPrime num = isEmpty [x \\ x<-[2..num-1] | num rem x == 0]

// Start = isPrime 5

dropTillPrime :: [Int] -> [Int]
dropTillPrime list = dropWhile isPrime list

// Start = dropTillPrime [3, 5, 7, 9, 10, 11] // [9, 10, 11]

//2. Get the odd numbers in a list till the first even number
//2. take while you find the first even number
takeTillEven :: [Int] -> [Int]
takeTillEven list = takeWhile isOdd list

// Start = takeTillEven [1, 3, 5, 4, 9, 10] // [1, 3, 5]

//! Two argument lambda expression

// Start = foldr (\x y = x-y) 0 [1, 2]
// 1 0
// 2 1
// 3 1
// 4 2
// 2

// Start = foldl (\x y = x-y) 0 [1..4]
// 0 1
// -1 2
// -3 3
// -6 4
// -10 

// Define function myLength, which returns length of a list
// You must use foldr
myLength :: [Int] -> Int
myLength list = foldr (\x y = y + 1) 0 list

// foldr (+) 0 (map (\x = 1) list)

// [1, 2, 3]
// 0
// 1 1
// 2 2
// 3 3
// 3

// Start = myLength [] // 0
// Start = myLength [1,2,3] // 3
// Start = myLength (take 100 [1..]) // 100

// Define function "reverse" using foldr
myReverse :: [Int] -> [Int]
myReverse list = foldr (\x y = y ++ [x]) [] list
// [1, 2, 3, 4]
// [] ++ 1
// 1 [1]
// [2] ++ [1]
// 2 [2, 1]
// [3] ++ [2, 1]
// 3 [3, 2, 1]
// 4 [4, 3, 2, 1]

// Start = myReverse [1,2,3,4,5,6,7,8] // [8,7,6,5,4,3,2,1]
// Start = myReverse [] // []
// Start = myReverse [1] // [1]

//! Type conversion (toInt, toReal, toString)
// check if the square root of each integer in a list are all integers.
areAllSqrt :: [Int] ->Bool
areAllSqrt list = and (map isSqrt list)
// [True, False]
// 

// Start = areAllSqrt [1, 4, 8]

isSqrt :: Int -> Bool
isSqrt num = isInt(sqrt(toReal(num)))

isInt :: a -> Bool | toInt a & toReal a
isInt num = toReal(toInt(num)) == toReal(num)

// Start = isInt 4
// 4.5
// 5
// 5.0 <> 4,5

// 3
// 3
// 3.0 == 3

//HOF
//1. A positive number in the form like: 10, 200, 8, 1000, 40, 1, 9, 7000, 30000000
// (which has only one non-zero digit at first place) is called a "clean number"(0 is not included)
// find all clean numbers in the list of lists and write to a list
//Start = f2 [[1,2,7,10,50,102,33],[],[0,9,90],[11,980,20]] //[1,2,7,10,50,9,90,20]
//Start = f2 [[1..20],[10,20..60],[30,20.. -10]]//[1,2,3,4,5,6,7,8,9,10,20,10,20,30,40,50,60,30,20,10]


/* 2. Given a list of sublists of Int, 
keep only the lists where all numbers
are prime numbers.
*/

// 3.  Delete the n-th element of each sublist in the list.
//f3 ::[[Int]] Int -> [[Int]]
//Start = f3 [1,2,3,4,5] 1
//Start = f3 [[1,2,3],[3],[4,5,6,7],[],[0,1,6,3,5]] 3  //[[1,2],[3],[4,5,7],[],[0,1,3,5]]
//Start = f3 [[1,2,6,8,3],[9,3],[0,5,0,6,7],[],[0,1,6,3,5,8]] 3  //[[1,2,8,3],[9,3],[0,5,6,7],[],[0,1,3,5,8]]
//Start = f3 [[0],[3],[4,5,6],[],[0,1,6,9,7,3,5]] 3  //[[0],[3],[4,5],[],[0,1,9,7,3,5]]

// 4. Rotate a list N places to the left. 

// [1, 2, 3] -> [2, 3, 1] -> [3, 1, 2]

f1 :: [Int] Int -> [Int]
f1 [] _ = [] 
f1 list num
| num > 0 = f1 ((tl list) ++ [hd list]) (num-1)
= list  

// Start = f1 [1,2,3] 2   // [3,1,2]
// Start = f1 [] 3 // []
// Start = f1 [6] 5 // [6]
// Start = f1 [1,2,3,4,5,6,7,8] 3 // [4,5,6,7,8,1,2,3]