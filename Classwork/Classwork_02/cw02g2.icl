module cw02g2
import StdEnv

// 1. Compute the product of odd numbers from 1 to n using recursion
//prodOdd :: Int -> Int
// Start = prodOdd 7 // 105
// Start = prodOdd 6 // 15
// Start = prodOdd 1 // 1
// Start = prodOdd (~54) //0

// 2. Remove all '0' from the list
// remZero :: [Int] -> [Int]
// Start = remZero [1,9,0,2,4,7,0,5,1,8,3,0,1,2] // [1,9,2,4,7,5,1,8,3,1,2]
// Start = remZero [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] // []
// Start = remZero [1,0,(~1),0,0,2,0,0,0,(~2),0,0,0,0,3] // [1,-1,2,-2,3]

// 3. Compute the difference between the first and the last element of each sublist.
//sums :: [[Int]] -> [Int]
//Start = sums [[1,2], [3,4,5], [6,5,9,7], [], [8]] // [1,2,1,0,0]