module cw3
import StdEnv

// Check if the numbers of a list are even. 
// e.g. [1,2,4,5]  -> [False, True, True, False] 
evens :: [Int] -> [Bool]
evens aList = map isEven aList
//map isEven [Int]
//map::(Int->Bool) [Int] -> [Bool]
//Start = evens [1..5]

//Check if all numbers of a list are even.
evens2 :: [Int] -> Bool
evens2 aList = and(map isEven aList)
//map (Int -> Bool) [Int]
//[Bool]
//[Bool] -> Bool
//and
//Start = evens2 [1..5]

//Start = foldr (-) 0 [1..5] //3
//1+(2+(3+(4+(5+(0)))))
//Start = foldl (-) 0 [1..5] //-15
//        foldl (a a -> a) a [a]
//(((((0)+1)+2)+3)+4)+5

//Start = foldr (+) [1] [1..10] //compile error

//pattern match list -> [a,b:rest]
//For second question, use map, filter, and. ;)
//2nd: aux:: [Int] -> Bool
// [1,2,3,4,5] if all of them are prime -> false

//map removeAt













