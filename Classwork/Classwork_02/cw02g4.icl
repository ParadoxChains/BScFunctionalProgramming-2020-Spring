module cw02g4
import StdEnv

// Reverse the list recurievely
// f1 :: [Int] -> [Int]
// Start = f1 [] // []
// Start = f1 [1,2,3,4,5] // [5,4,3,2,1]

// Generate every odd number from 1 to n (n is function parameter)
// f2 :: Int -> [Int]
// Start = f2 1  // [1]
// Start = f2 10 // [1,3,5,7,9]
// Start = f2 (~4) // []

// Replicate the elements of a list a given number of times. 
// If list is [1,2,3] and given number 2 -> [1,1,2,2,3,3]
// f3 :: [Int] Int -> [Int]
// Start = f3 [1,1,3,4] 3 // [1,1,1,1,1,1,3,3,3,4,4,4]
// Start = f3 [1,2,3] 2 // [1,1,2,2,3,3]
// Start = f3 [] 100 // []
// Start = f3 [1..] (~45) // []