module cw3
import StdEnv

//map :: (a -> b) [a] -> [b]
f:: Int -> Int
f x = x + 2

//Start = map f [1..5]
//[3,4,5,6,7]
//Start = map isEven [1..5]
// map (Int -> Bool) [Int] -> [Bool]
//[False,True,False,True,False]