module recursionlists
import StdEnv

/*
A function calling itself.
*/
func :: Int -> Int
func num
| num > 100 = num
= func (num + 1)

//Start = func 1
//Start = func 1
//Start = func (1 + 1)
//Start = func ((1 + 1) + 1)
//Start = func (((1 + 1) + 1) + 1)
//Start = func 9001
//Start = func -9001

addNumbers :: Int Int -> Int
addNumbers a b
//| b < 0 = abort "oh no"
| b < 0 = addNumbers (a-1) (b+1)
| b == 0 = a
= addNumbers (a+1) (b-1)
//add 2 + 3 -> 2 + 1 + 1 + 1

//Start = addNumbers 2 3 //5
//Start = addNumbers 2 -3
//Start = addNumbers -5 -42

factorial :: Int -> Int
factorial x
| x < 0 = abort "fuck off bruh"
| x == 0 = 1
= x * factorial (x-1)

//Start = factorial 25

factorial2 :: Int -> Int
factorial2 x
| x < 0 = abort "go away"
= faux x 1

faux :: Int Int -> Int
faux 0 accumulator = accumulator
faux x accumulator = faux (x-1) (accumulator*(x))
//tail recursion
//accumulator
//f2 3
//fa 3 1
//fa 2 (1*3)
//fa 1 ((1*3)*2)
//fa 0 (((1*3)*2)*1)
//(((1*3)*2)*1)
//6
//Start = factorial2 3

//Lists
//a collection of data from the same type
//Start = [1,2,3,4,5] //[Int]
//Start = [1..100] //[Int]
//Start = [1,3..100] //[1,3,5,7..99]
a = 2
b = 4
c = 8
d = 33
//Start = [a,b..c] //even numbers from 2 to 32
//Start = [a,b,c..d] //does not compile
//Start = ['a','c'..'z']
//Start = [1,2.0..] //does not compile

//Start = hd [1,2,3,4] //Int
//Start = tl [1,2,3,4] //[Int]
//Start = [1] ++ [2,3] ++ [4]
//[1] ++ [2,3] ++ [4]
//[1,2,3] ++ [4]
//[1,2,3,4]
//Start = [1,2,3] ++ 4 //compile error
//Start = [[1..3],[2..4]] ++ [[]] //[[Int]]
//Start = tl [1] 
//Start = [1:[2..4]] 
//[ singleElement : someList ]
//[Int] -> [ Int : [Int] ]
//[[Int]] -> [ [Int] : [[Int]] ]

//Recursion w/ lists

sumList :: [Int] -> Int
sumList aList
| isEmpty aList = 0
//| aList == [] = 0
//| tl aList == [] = hd aList
= hd aList + sumList (tl aList)
Start = sumList [1..4]
//Start = sumList [1..4]
//Start = 1 + sumList [2,3,4]
//Start = 1 + 2 + sumList [3,4]
//Start = 1 + 2 + 3 + sumList [4]
//Start = 1 + 2 + 3 + 4 + sumList []
//Start = 1 + 2 + 3 + 4 + 0

sumList2 :: [Int] -> Int
sumList2 [] = abort "empty"
sumList2 [singleton] = singleton
sumList2 [first:rest] = first + sumList2 rest

//[1,2,3,4]
//[first:rest]
//[1:[2,3,4]]
//first = 1 rest = [2,3,4]

Start = [1,3,4,5,6,3,3,54,6,6:[5..10]]

//[1,2,3,4,5,6]
//list
//hd list + hd(tl list)
//[a,b:rest]
//a+b

//[a,b,c:rest]
//doSomething a c 
//recursion [b:rest]

filterEven :: [Int] -> [Int]
filterEven [] = []
filterEven [a:b]
| isEven a = [a:filterEven b]
= filterEven b
