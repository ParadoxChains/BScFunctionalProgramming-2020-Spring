module tuples

import StdEnv

// why tuples!?
// [("hossam", 123), ("A", 1234)]
// fst, snd, fst3, snd3, thd3

// Start = thd3 ("hossam", 123, 12.5)

func1 :: (a, b, c) -> c
func1 (t, r, w) = w 

// Start = func1 ("hossam", 123, 13.5)

// splitAt

// Start = splitAt 2 [1, 2, 3]

// zip

// Start = zip ([1, 2, 3], [4, 5])


// Make a function which gives the sum of two tuples 
// i.e ourAdd (1, 2) (3, 4) // (4, 6) 

// Given a list of tuples. return a single tuple which is
// the sum of all tuple (x, y) in which x, y have the same parity (odd, odd) (even, even)
// minus
// the sum of all tuple (x, y) in which x, y don't have the same parity (even, odd) (odd, even)

ourAdd (t, y) (x, z) = (t+x, y+z)

ourMin (t, y) (x, z) = (t-x, y-z)

samePar :: (Int, Int) -> Bool
samePar (a, b) = isEven (a+b)

tupleSum :: [(Int, Int)] -> (Int, Int)
tupleSum list = ourMin (sameParTuple) (diffParTuple)
    where
        sameParTuple = foldr (ourAdd) (0, 0) (filter samePar list)
        diffParTuple = foldr (ourAdd) (0, 0) (filter (not o samePar) list)

// Start = ourAdd (1, 2.2) (3, 4.5)


// Start = tupleSum [] //(0,0)
// Start = tupleSum [(1,2)] //(-1,-2)
// Start = tupleSum [(1,2), (4,4)] //(3,2)


// Given an integer, produce a tuple which contains a list of its divisors and their mean value
// sum list / length list
// 1+2+4+8 / 4 = 3.75
f3 :: Int -> ([Int], Real)
f3 n = (divisors,  getMeanValue (divisors))
    where
        divisors = getDivOfList n

getDivOfList :: Int -> [Int]
getDivOfList n = [x \\ x <- [1..n] | n rem x == 0]

getMeanValue :: [Int] -> Real
getMeanValue list = toReal (sum list) / toReal (length list)

// Start = getDivOfList 5


// Start = f3 8 //([1, 2, 4, 8], 3.75)
// Start = f3 9 //([1, 3, 9], 4.33333333333333)
// Start = f3 15 //([1, 3, 5, 15], 6)

