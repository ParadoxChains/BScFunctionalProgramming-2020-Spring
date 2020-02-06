module cw3g04
import StdEnv

// Eliminate consecutive duplicates of list elements.
// If a list contains repeated elements they should be 
// replaced with a single copy of the element. 
// The order of the elements should not be changed.
// f1 :: [Int] -> [Int]
//Start = f1 [1] // [1]
//Start = f1 [] // []
//Start = f1 [1,2,2,3,3,5] // [1,2,3,5]
//Start = f1 [1,1,1,4,4,5,6,7,7,7,7] // [1,1,4,5,6,7,7]
//Start = f1 [1,2,3,4,5,6] // [1,2,3,4,5,6]
//Start = f1 [1,1,1,1,1,1] // [1,1,1]
//Start = f1 [2,2,2,2,2,2,2] // [2,2,2,2]


// Determine the prime factors of a given positive integer.
// Construct a flat list containing the prime factors in ascending order. 
//primeFactors :: Int -> [Int]
//Start = primeFactors 0 // []
//Start = primeFactors -5 // []
//Start = primeFactors 1 // []
//Start = primeFactors 17 // [17]
//Start = primeFactors 614889782588491410 // [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]



// Rotate a list N places to the left. 

// Start = f1 [1,2,3] 2   // [3,1,2]
// Start = f1 [] 3 // []
// Start = f1 [6] 5 // [6]
// Start = f1 [1,2,3,4,5,6,7,8] 3 // [4,5,6,7,8,1,2,3]
