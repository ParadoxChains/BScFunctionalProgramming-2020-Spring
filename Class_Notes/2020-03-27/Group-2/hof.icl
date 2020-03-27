module hof
import StdEnv

/*
ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ 
ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ 
ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ ᕕ(ツ)ᕗ 
*/

// Higher order functions, function that takes another function as argument.

someFunc :: Int Int -> Int
someFunc x y = (x + y - 1) * x

f :: Int Int (Int Int -> Int) -> Int 
f a b op = op a b

//Start = f 2 3 (+) // (+) 2 3
//Start = f 2 3 (*) // (*) 2 3
//Start = f 2 3 (\x y = x * y - 1)
//Start = f 2 3 someFunc

//infix form -> 2 + 3
//prefix form -> (+) 2 3 

f2 :: Int Int (Int Int -> Int) -> Int
f2 a b op
| a < b = op a b
| b < a = op b a

//Start = f2 2 3 (-) // (-) 2 3 -> 2 - 3
//Start = f2 4 2 (^) // (^) 2 4 -> 2 ^ 4

/*

/**
 * Filter a list using a predicate.
 * @result The list containing exactly those elements for which the predicate
 *   holds.
 */
filter		:: (a -> .Bool) !.[a] -> .[a]
*/
//isEven :: Int -> Bool
//[1..10] :: [Int]
//result :: [Int]
//Start = filter isEven [1..10] //[2,4,6,8,10]
//Start = filter isEven [1..10]
//Start = filter isEven [1,2,3,4,5,6,7,8,9,10]
//isEven 1 -> False
//isEven 2 -> True
//...
// [2,4,6,8,10]

isPrime :: Int -> Bool
isPrime x = and [x rem n <> 0 \\ n<-[2..(x-1)] ]

//Start = filter isPrime [1..100]
//Start = filter (\x = x<10 )  [1..100]

isListContained :: [Int] [Int] -> [Int]
isListContained list1 list2 = filter (\x = isMember x list1) list2
//                          = filter func3 list2
/*
func3 x = isMember x list1
*/
//Start = isListContained [2,5,3,6,8,3,2,5,7,8,47] [1..10]

primesLessThanN :: Int -> [Int]
primesLessThanN n = takeWhile (\a = a < n  ) [ x \\ x<-[1..] | isPrime x ] //[1,2,3,5,7,11,13...]

//((>) n)  x -> (>) n x -> n > x
//Start = primesLessThanN 10

//Start = map (isEven) [1..10] //[False,True,False,True,False,True,False,True,False,True]
//Start = map ((+) 1) [1..10] //[2,3,4,5,6,7,8,9,10,11]


//Start = map ((-) 5) [1..10] //[4,3,2,1,0,-1,-2,-3,-4,-5]
//((-) 5) 3 -> (-) 5 3 -> 5 - 3 
//((-) 5) 8 -> (-) 5 8 -> 5 - 8
//Start = map (\x = 5 - x) [1..10] //[4,3,2,1,0,-1,-2,-3,-4,-5]
// ^ BE VERY CAREFUL OF PREFIX ORDER OPERATIONS

//Start = foldr (+) 0 [1..3]
//foldr (+) 0 [1..3]
//foldr (+) ((+) 3 0) [1,2]
//foldr (+) (foldr 2 ((+) 3 0)) [1]
//foldr (+) (foldr 1 (foldr 2 ((+) 3 0))) []
//(foldr 1 (foldr 2 ((+) 3 0)))
//(+) 1 ((+) 2 ((+) 3 0))
//(+) 1 ((+) 2 (3 + 0))
//(+) 1 (2 + (3 + 0))
//1 + (2 + (3 + 0))
//1 + (2 + 3)
//1 + 5
//6
// (+) 3 0
// (+) 2 3
// (+) 1 5
// 6

//Start = foldr (-) 10 [1..3]
//this is NOT 10 - 1 - 2 - 3
//this is 1 - (2 - (3 - 10))

//http://BEAD.INF.ELTE.HU
// inc :: Int -> Int
// ((+) 1)
// (\x = x + 1)

/*
foo:: Int -> Int
foo n = foldl (\a b = a - b) 0 [1..n]
Start = map foo [1..5]
 
Start = map ( foldl (\a b = a - b) 0 [1..n] ) [1..5]
This will perform foldl (\a b = a - b) 0 [1..n] on each element of [1..5]
*/

/*
foldl (-) 0 [1..3]
((0 - 1) - 2) - 3

foldr (-) 0 [1..3]
1 - (2 - (3 - 0))
*/
