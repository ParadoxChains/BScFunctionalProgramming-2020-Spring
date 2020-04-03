module hof_2

import StdEnv

//! takeWhile & dropWhile

//1. Drop while the first prime number

// Start = dropTillPrime [1, 3, 5, 7, 9, 10] // [5, 7, 9, 10]

//2. take while you find the first even number

// Start = takeTillEven [1, 3, 5, 4, 9, 10] // [1, 3, 5]

//! Two argument lambda expression

// Define function myLength, which returns length of a list
// You must use foldr
// myLength :: [Int] -> Int

// Start = myLength [] // 0
// Start = myLength [1,2,3] // 3
// Start = myLength (take 100 [1..]) // 100

// Define function "reverse" using foldr
// myReverse :: [Int] -> [Int]

// Start = myReverse [1,2,3,4,5,6,7,8] // [8,7,6,5,4,3,2,1]
// Start = myReverse [] // []
// Start = myReverse [1] // [1]

//! Type conversion (toInt, toReal, toString)
// Use foldr to check if the square root of each integer in a list are all integers.
// areAllSqrt :: [Int] ->Bool


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

// Start = f1 [1,2,3] 2   // [3,1,2]
// Start = f1 [] 3 // []
// Start = f1 [6] 5 // [6]
// Start = f1 [1,2,3,4,5,6,7,8] 3 // [4,5,6,7,8,1,2,3]