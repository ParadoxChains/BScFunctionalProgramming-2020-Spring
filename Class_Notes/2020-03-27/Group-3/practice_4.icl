module practice_4

import StdEnv

// FILTER

// 1. delete the elements equal to 5
// not_five :: [Int] -> [Int]


// Start = not_five [5,4,5,4,3]  // [4,4,3]

// 2. Delete an element n from a list
// del :: Int [Int] -> [Int]


// Start = del 5 [1, 5, 6, 7, 5, 8, 5] // [1, 6, 7, 8]

// 3. Keep every non-empty sublist.
// e.g. [[1, 2, 3], [], [3, 4],[],[],[5, 7, 8, 9],[]] -> [[1, 3, 5],[3,4],[5,7,8,9]]

// keepEveryNonEmpty :: [[Int]] -> [[Int]]

// Start = keepEveryNonEmpty [[1, 2, 3], [], [3, 4],[],[],[5, 7, 8, 9],[]]

// MAP

// 0. Add 1 to every sublist in list using map

// addOne :: [Int] -> [Int]

// Start = addOne [1, 2, 3]

// 1. compute the squares of the elements of a list using map
// [1, 2, 3] -> [1, 4, 9]

// sqList :: [Int] -> [Int]

// Start = sqList [1, 2, 3, 4]

// 2. Triple the head elements of the elements of a list.
// triples :: [[Int]] -> [[Int]]

// Start = triples [[1..5],[1..10],[],[1],[1,2,3],[1..4]]

// 3. Map a list of functions to a value. E.g. mapfun [f,g,h] x = [f x, g x, h x]

// mapFun :: [Int -> Int] Int -> [Int]

// Start = mapFun [inc, (+)1] 2

/* 
4. use map to insert n in the middle of every sublist of a list.
if there is one element in the middle of sublist, insert n before it 
e.g. if n = 4 , [1,2,3] -> [1,4,2,3] (insert 4 before 2)
*/

// insetMiddleMap :: Int [[Int]] -> [[Int]]


// Start = insetMiddleMap 2 [[],[1],[1,3],[3,4,5]] //[[2],[2,1],[1,2,3],[3,2,4,5]]
// Start = insetMiddleMap 8 [[0,1],[1],[1,6,5,3],[3,4,5,7,0],[]]//[[0,8,1],[8,1],[1,6,8,5,3],[3,4,8,5,7,0],[8]]

// LAMPDA

// 5. same as 1. with lambda expression

// sqrs_lambda :: [Int] -> [Int]

// Start = sqrs_lambda [1, 2, 3] // [1, 4, 9]

// FOLDR

/*
    1. use foldr to compute the product of the list.
*/

// getProduct :: [Int] -> Int


// Start = getProduct [1,2,3] //6
// Start = getProduct [1,1,3,7]  //21


// 2. rewrite flatten using foldr 
// (for the following list [[1,2], [3, 4, 5], [6, 7]] => [1,2,3,4,5,6,7])

// myFlat :: [[Int]] -> [Int]

// Start = myFlat [[1,2], [3, 4, 5], [6, 7]]

// MULTI HOF(HIGH ORDER FUNCTION)

/*
  1. compute the squares of the elements of a list using map with lambda expression .
  and use foldr to compute the product of the list.
*/

// sqrsProd :: [Int] -> Int

// Start = sqrsProd [1,2,3] //36
// Start = sqrsProd [1,1,3,7]  //441

// TAKEWHILE AND DROPWHILE
