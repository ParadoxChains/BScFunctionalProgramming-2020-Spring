module tuples
import StdEnv


// Lists
// [1,23,4,52,4]!!2
// [Int], [String], [Bool]
// [5, "Hello"]


// ["James", "Bob"]
// [18, 19]

// ["James", 18]

// (Int, String)

// Start = ("Bob", 19, "prrxnh")




// fst
// Start = fst ("Bob", 19)

// snd
// Start = snd ("Bob", 19)


// fst3
// Start = fst3 ("Bob", 19, 12)


// fst3
// Start = snd3 ("Bob", 19, 12)



// thd3
// Start = thd3 ("Bob", 19, 12)


// splitAt

// Start = splitAt 5 ['functional programming']


// zip

// Start = zip ([1,2,3], [4,5,6])









// Given a list of tuple, return a single tuple which is
// the sum of all tuple (x,y) in which x,y have the same parity (odd, odd)/(even, even)
// minus
// the sum of all tuple (x,y) in which x,y dont have the same parity (odd, even)/(even, odd)

// Fancier way to ask:
// Set of vector in 2D, find the final vector which is the result of
// Oh, Nvm...

add :: (Int, Int) (Int, Int) -> (Int, Int)
// add a b = (fst a + fst b,snd a + snd b)
add (a, b) (c, d) = (a+c, b+d)


samePar :: (Int, Int) -> Bool
samePar (a, b) = isEven (a+b) // (isEven a && isEven b) || (isOdd a && isOdd b)

tupleSum :: [(Int,Int)] -> (Int, Int)
tupleSum list = (x1-x2,y1-y2) // (-7, -8)
where 
    (x1,y1) = foldr add (0,0) (filter samePar list) // (6,8)
    (x2,y2) = foldr add (0,0) (filter (not o samePar) list) // (13,16)

// Start = tupleSum [] // (0,0)
// Start = tupleSum [(1, 2)] // (-1, -2)
// Start = tupleSum [(1, 2), (4, 4), (8,9), (2,4), (4,5)] // (3, 2)
// (filter samePar list) -> [(4,4), (2,4)]
// (0,0) + (2,4) -> (2,4)
// (2,4) + (4,4) -> (6,8)


//(filter (not o samePar) list) -> [(1,2), (8,9), (4,5)]
// (0,0) + (4,5) = (4,5)
// (4,5) + (8,9) = (12,14)
// (12,14) + (1,2) = (13,16)





/*
give a integer and produce a tupple.
calculate its divisors into a list as first element of the tuple,
and mean value of this list as the second element of the tuple.
*/
// mean [1,2,3] = (1+2+3) / 3
mean :: [Int] -> Real
mean list = toReal (sum list) / toReal (length list)

f3 :: Int -> ([Int], Real)
f3 n = (list_of_divisors, mean list_of_divisors)
where 
    list_of_divisors = [i \\ i <- [1..n] | n rem i == 0]


// Start = f3 8 //([1,2,4,8],3.75)
// Start = f3 9 //([1,3,9],4.33333333333333)
// Start = f3 15 //([1,3,5,15],6)
// Start = f3 5 // ([1,5], 3)







/*
Given a list of Tuples of Integer, give a list of integers produced if we raise
the first integer to the power of the second integer and keep only the even numbers.
Example :
[(2,4),(3,2)] --->[16]
because (2,4) ->2^4 = 16 and is even
(3,2) -> 3^2=9 is odd
*/

// power :: [(Int,Int)] -> [Int]
//Start = power [(2,4),(3,2)]//[16]
//Start = power [(1,100),(2,3),(4,5)]//[8,1024]
//Start = power [(3,5),(7,9)]//[]

// map using foldr

// map inc [1,2,3,4] -> [2,3,4,5]
// foldr add (0,0) (filter samePar list)

myMap :: (Int -> Int) [Int] -> [Int]
myMap function list = foldr (\ x y = [function x] ++ y) [] list

// Start = myMap inc [1,2,3]/

// filter using foldr
myFilter :: (Int -> Bool) [Int] -> [Int]
myFilter function list = foldr (myFunction function) [] list

myFunction :: (Int -> Bool) Int [Int] -> [Int]
myFunction function x y
| function x = [x] ++ y
= y


Start = myFilter isEven [1,2,3,4,5]

// filter isEven [1,2,3,4,5,6,7]
// []
// 7, []  -> []
// 6, [] -> [6]
// 5, [] -> [6]
// 4, [] -> [4,6]
// 3, [] -> [4,6]





// []
// [5]              []      4           -> [5]
// [4,5]            [5]     3            -> [4,5]
// [3,4,5]
// [2,3,4,5]


myFunction [x:xs] function 

myFilter :: (Int -> Bool) [Int] -> [Int]
myFilter function [] = []
myFilter function [x:xs]
| function x = [x] ++ (myFilter function xs)
= myFilter function xs
