module hw04Solutions
import StdEnv

/**
  * 30 pts
  * Write a function that takes a list of integers
  * and returns the variance of the list.
  * That is, the sum of the square differences from the mean divided by
  * number of elements - 1.
  * For example, variance of [1,2,3,4,5] is calculated by:
  * Mean = (1+2+3+4+5)/5 = 3
  * Sum of Square Differences = (1-3)^2 + (2-3)^2 + (3-3)^2 + (4-3)^2 + (5-3)^2 = 10
  * Variance = 10/(5-1) = 10/4 = 2.5
  *
  * Note: Your solution must use 'map' or a list comprehension.
  */
Variance :: [Int] -> Real
Variance inputList = sumSquareDifferences/(theLength - 1.0)
  where
  newList = map toReal inputList
  theLength = toReal(length newList)
  mean = (sum newList)/(theLength)
  squareDifferences = map (\x = (x-mean)^2.0) newList
  sumSquareDifferences = sum squareDifferences
//Start = Variance [1..5] //2.5
//Start = Variance [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] //0
//Start = Variance [-4,1,6,0,-2,6] //16.96666666666
//Start = Variance [] //0

/**
  * 30 pts
  * Write a function that takes a list of integers and reverses their digits and order.
  * 
  * For example: ReverseDig [123,456,789] = [987,654,321]
  */
ReverseDig :: [Int] -> [Int]
ReverseDig theList = map (\x = listToInt (reverse(intToList x))) (reverse theList)

intToList :: Int -> [Int]
intToList n
| n < 10 = [n]
= intToList (n/10) ++ [n rem 10]

listToInt :: [Int] -> Int
listToInt [a] = a
listToInt numList = (last numList) + 10*(listToInt (init numList))
//Start = ReverseDig [123,456,789] //[987,654,321]
//Start = ReverseDig [] //[]
//Start = ReverseDig [1,23,456,7891,23456] //[65432,1987,654,32,1]

/**
  * 40 pts
  * Write a function that takes a predicate (a -> Bool function) and
  * a list of sublists of integers and returns the sum of all elements that
  * return True on both  or one of the two predicates depending on
  * the given parameter "or"/"and".
  */
FilterSum :: (Int -> Bool) String (Int -> Bool) [[Int]] -> Int
FilterSum predA "or" predB list = FilterSumAux predA or predB list
FilterSum predA "and" predB list = FilterSumAux predA and predB list

FilterSumAux :: (Int -> Bool) ([Bool]->Bool) (Int -> Bool) [[Int]] -> Int
FilterSumAux predA op predB list =sum [ x\\x<-(flatten list)| op [predA x, predB x]]
//Start = FilterSum isEven "or" ((<) 3) [[1..5],[-2..10]] //60
//Start = FilterSum ((<)10) "and" (\x=isEmpty[div\\div<-[2..(x-1)]|x rem  div == 0]) [[1..20],[90..100],[1..10]] //157
//Start = FilterSum isOdd "or" isEven []//0