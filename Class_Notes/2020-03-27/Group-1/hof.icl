module hof
import StdEnv

/*
Evan: HOF
Everyone else: ᕕ(ツ)ᕗ 
*/

//Higher order function is a function that takes another function as an argument

something :: Int Int -> Int
something a b = a ^ b

f :: Int Int (Int Int -> Int) -> Int
f a b op = op a b

//Start = f 2 3 (+) // (+) 2 3 -> 2 + 3
//Start = f 2 3 (*) // (*) 2 3 -> 2 * 3
//Start = f 2 3 (-) // (-) 2 3 -> 2 - 3
//Start = f 2 3 something //something 2 3

//foo:: ::(Int->Int) Int -> Int
//   ^   ^  this is incorrect.

//Prefix form: (-) a b = a - b
//infix form: a - b

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
//[2,4,6,8,10]
//isEven 1 = False
//isEven 2 = True
//isEven 3 = False
//isEven 4 = True

//Start = filter ((>)5) [1..10] //[1,2,3,4]
//Start = filter (\x = x < 5) [1..10] //lambda expression = inline function
//((>)5) 1  -> (>) 5 1 -> 5 > 1
//(\x = x < 5) 1 -> (\1 = 1 < 5) -> 1<5
//Start = filter someF [1..10]
someF :: Int -> Bool
someF x = x<5

isPrime :: Int -> Bool
isPrime x = and[ x rem n <> 0\\n <- [2..(x-1)] ]

//Start = filter (\x = x>50) (filter isPrime [1..100])
//Start = filter (\x = isPrime x && x>50)  [1..100]

/*
//* Apply a function to every element of a list.
map			:: (.a -> .b) ![.a] -> [.b]
*/

//Start = map ((+) 1) [1..10] //[2,3,4,5,6,7,8,9,10,11]
//[2,3,4,5,6,7,8,9,..]
//isEven :: Int -> Bool
//Start = map isEven [1..10] //[False,True,False,True,False,True,False,True,False,True]
//Start = map (\x = (x+5) > 3 ) [1..10] //[True,True,True,True,True,True,True,True,True,True]

//Can we use map with isMember? Yes, but be careful
//isMember :: a [a] -> Bool

isInList :: [Int] [Int] -> [Int]
isInList list1 list2 = filter (\ someNum = isMember someNum list1) list2

//isInList list1 list2 = filter isMember list2
//                     filter              operation               list2
// each element of list2 Int is fed through operation, a boolean comes out. and based on that boolean, it puts the 
// element of list2 (Int) into the final list
// somefunc someNum = isMember someNum list1

//Start = isInList [2,4,7,3,6,4,7,2,1,7] [3,4,5,6,7,8,9] //[3,4,6,7]
// isInList [2,4,7,3,6,4,7,2,1,7] [3,4,5,6,7,8,9] =
// filter (\ someNum = isMember someNum [2,4,7,3,6,4,7,2,1,7]) [3,4,5,6,7,8,9]
// 3 goes into (\someNum = isMember someNum [2,4,7,3,6,4,7,2,1,7])
//(\3 = isMember 3 [2,4,7,3,6,4,7,2,1,7])
//isMember 3 [2,4,7,3,6,4,7,2,1,7] = True
//filter sees True, filter puts 3 into the new list

//currying

//Start = foldr operation initialElement [list of elements]
//Start = foldr (+) 100 [1..3]
//foldr (+) 100 [1..3]
//foldr (+) ((+) 3 100) [1,2]
//foldr (+) ((+) 2 ((+) 3 100)) [1]
//foldr (+) ((+) 1 ((+) 2 ((+) 3 100))) []
//((+) 1 ((+) 2 ((+) 3 100))) 
//((+) 1 ((+) 2 (103))
//((+) 1 (105)
//106
//(+) 3 100 = 103
//(+) 2 103 = 105
//(+) 1 105 = 106
//1+(2+(3+100))

//Start = foldr (-) 5 [1..3] //-3
//5-1-2-3 //wrong
//1-2-3-5 //wrong
//1-(2-(3-5))
//(-) 3 5 = -2
//(-) 2 -2 = 4
//(-) 1 4 = -3

//Start = foldl (-) 5 [1..3] //-1
//3-2-1-5 //nope
//((5-1)-2)-3
//(-) 5 1 = 4
//(-) 4 2 = 2
//(-) 2 3 = -1


/*
Start = foldr (\x y = [x] ++ y ) [] [1..10]
Start = foldl (\x y = x ++ [y] ) [] [1..10]
*/

//Start = filter isEven [1..10]
//Start = [ n \\ n<-[1..10] | isEven n ]

//Start = map (\x = x + 1) [1..10]
//Start = [ n+1 \\ n<-[1..10]  ]

//How to use filter with more than one condition???
//Start = filter ((<)50) (filter isPrime [1..100]) //gives us primes from 1 to 100 that are bigger than 50
//Start = filter  (\x = isPrime x && x>50)    [1..100]
//Start = filter  (\x = isPrime x || x>50)    [1..100]
