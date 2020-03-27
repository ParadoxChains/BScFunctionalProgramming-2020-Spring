module practice_4

import StdEnv

// FILTER

// filter condition collection
// collection filtered

// filter (isEven) [1, 2, 3, 4] // [2, 4]


// 1. delete the elements equal to 5
not_five :: [Int] -> [Int]
not_five list = filter ((<>)5) list


// Start = filter (not(isEven)) [1..100] //[1]

// Start = not_five [5,4,5,4,3]  // [4,4,3]

// 2. Delete an element n from a list
del :: Int [Int] -> [Int]
del num list = filter ((<>)num) list //1 <> 5

// Start = del 5 [1, 5, 6, 7, 5, 8, 5] // [1, 6, 7, 8]

// 3. Keep every non-empty sublist.
// e.g. [[1, 2, 3], [], [3, 4],[],[],[5, 7, 8, 9],[]] -> [[1, 3, 5],[3,4],[5,7,8,9]]

isEmptyList :: [Int] -> Bool
isEmptyList list = not(((length list) == 0)) 

keepEveryNonEmpty :: [[Int]] -> [[Int]]
keepEveryNonEmpty list = filter (isEmptyList) list

// Start = keepEveryNonEmpty [[1, 2, 3], [], [3, 4],[],[],[5, 7, 8, 9],[]]

// MAP

// map ((+)1) [1, 2, 3] = [2 , 3, 4]

// 0. Add 1 to every sublist in list using map

addOne :: [Int] -> [Int]
addOne list = map ((+)1) list
// Start = addOne [1, 2, 3]

// 1. compute the squares of the elements of a list using map
// [1, 2, 3] -> [1, 4, 9]
sq :: Int -> Int
sq x = x^2

sqList :: [Int] -> [Int]
sqList list = map (sq) list

// Start = sqList [1, 2, 3, 4]

// 2. Triple the head elements of the elements of a list.
tripleHead :: [Int] -> [Int]
tripleHead [] = []
// tripleHead list = [x*3 \\ x <- (init list)] ++ (last list)
tripleHead list = [(hd list)*3] ++ (tl list)

triples :: [[Int]] -> [[Int]]
triples listOfList = map (tripleHead) listOfList

// Start = triples [[1..5],[1..10],[],[1],[1,2,3],[1..4]]

// 3. Map a list of functions to a value. E.g. mapfun [f,g,h] x = [f x, g x, h x]

myFunc :: Int (Int -> Int) -> Int
myFunc x f = f x

mapFun :: [Int -> Int] Int -> [Int]
mapFun list x = map (myFunc x) list
// mapFun list x = map (\f = f x) list

// Start = mapFun [inc, (+)1] 2

/* 
4. use map to insert n in the middle of every sublist of a list.
if there is one element in the middle of sublist, insert n before it 
e.g. if n = 4 , [1,2,3] -> [1,4,2,3] (insert 4 before 2)
*/

putMiddle:: Int [Int] -> [Int]
putMiddle n list = [list !! x \\ x <- [0..middleList-1]] ++ [n] ++ [list !! x \\ x <- [middleList..(length list - 1)]] 
  where
    middleList = (length list / 2)

insetMiddleMap :: Int [[Int]] -> [[Int]]
insetMiddleMap n listOfLists = map (putMiddle n) listOfLists


// Start = insetMiddleMap 2 [[],[1],[1,3],[3,4,5]] //[[2],[2,1],[1,2,3],[3,2,4,5]]
// Start = insetMiddleMap 8 [[0,1],[1],[1,6,5,3],[3,4,5,7,0],[]]//[[0,8,1],[8,1],[1,6,8,5,3],[3,4,8,5,7,0],[8]]

// LAMPDA

// 5. same as 1. with lambda expression

sqrs_lambda :: [Int] -> [Int]
sqrs_lambda list = map (\x = x^2) list

// Start = sqrs_lambda [1, 2, 3] // [1, 4, 9]

// FOLDR

/*
    1. use foldr to compute the product of the list.
*/

getProduct :: [Int] -> Int
getProduct list = foldr (*) 1 list


// Start = getProduct [1,2,3] //6
// Start = getProduct [1,1,3,7]  //21


// 2. rewrite flatten using foldr 
// (for the following list [[1,2], [3, 4, 5], [6, 7]] => [1,2,3,4,5,6,7])

myFlat :: [[Int]] -> [Int]
myFlat listOfLists = foldr (++) [] listOfLists

// Start = myFlat [[1,2], [3, 4, 5], [6, 7]]

// MULTI HOF(HIGH ORDER FUNCTION)

/*
  1. compute the squares of the elements of a list using map with lambda expression .
  and use foldr to compute the product of the list.
*/

sqrsProd :: [Int] -> Int
sqrsProd list = foldr (*) (1) (map (\x = x^2) list)
// [1, 4, 9]
// 1 * 1
// 1 *4
// 4 * 9
// 36

// Start = sqrsProd [1,2,3] //36
// Start = sqrsProd [1,1,3,7]  //441

myTask :: [[Int]] -> [Int]
myTask list = map (\ x = foldr (*) 1 x) list
// myTask list = map (foldr (*) 1) list
// myTask list = map (prod) list


// Start = myTask [[1,2], [1, 3, 4]]