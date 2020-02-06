module cw3g04
import StdEnv

// Eliminate consecutive duplicates of list elements.
// If a list contains repeated elements they should be 
// replaced with a single copy of the element. 
// The order of the elements should not be changed.
f1 :: [Int] -> [Int]

f1 [] = []
f1 [a] = [a]
f1 [x,y:xs] 
| x == y = [x:f1 xs]
= [x] ++ f1 ([y:xs])

// Start = f1 [1] // [1]
// Start = f1 [] // []
// Start = f1 [1,2,2,3,3,5] // [1,2,3,5]
// Start = f1 [1,1,1,4,4,5,6,7,7,7,7] // [1,1,4,5,6,7,7]
// Start = f1 [1,2,3,4,5,6] // [1,2,3,4,5,6]
// Start = f1 [1,1,1,1,1,1] // [1,1,1]
// Start = f1 [2,2,2,2,2,2,2] // [2,2,2,2]


// Determine the prime factors of a given positive integer. Construct a flat list containing the prime factors in ascending order. 

primeFactors :: Int -> [Int]
primeFactors n 
| n < 1 = []
= primeFactorsAux n 2

primeFactorsAux :: Int Int -> [Int]
primeFactorsAux 1 _ = []
primeFactorsAux n m
| n rem m == 0 = [m: primeFactorsAux (n / m) m]
= primeFactorsAux n (m+1)

// Start = primeFactors 0 // []
// Start = primeFactors -5 // []
// Start = primeFactors 1 // []
// Start = primeFactors 17 // [17]
// Start = primeFactors 614889782588491410 // [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]



// Rotate a list N places to the left. 
f1 :: [Int] Int -> [Int]
f1 [] _ = []
f1 x 0 = x
f1 x y
| y > 0 = f1 (tl x ++ [hd x]) (y-1)
= f1 [last x: init x] (y+1)
// Start = f1 [1,2,3] 2   // [3,1,2]
// Start = f1 [] 3 // []
// Start = f1 [6] 5 // [6]
// Start = f1 [1,2,3,4,5,6,7,8] 3 // [4,5,6,7,8,1,2,3]
