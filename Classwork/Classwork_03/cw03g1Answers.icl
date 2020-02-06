module cw03g1s
import StdEnv

/* 1. Eliminate consecutive duplicates of list elements.
 If a list contains repeated elements they should be 
 replaced with a single copy of the element
 AND a number given by parameter. 
 The order of the elements should not be changed.
 */
f1 :: [Int] Int-> [Int]

f1 [] n= []
f1 [a] n= [a]
f1 [x,y:xs]  n
| x == y = [x, n: f1 (dropWhile ((==)x) xs) n]
= [x] ++ f1 [y:xs] n

//Start = f1 [1] 8 // [1]
//Start = f1 [] 1// []
//Start = f1 [1,2,2,3,3,5] 0// [1,2,0,3,0,5]
//Start = f1 [1,1,1,4,4,5,6,7,7,7,7] 9// [1,9,4,9,5,6,7,9]
//Start = f1 [1,2,3,4,5,6] 0// [1,2,3,4,5,6]
//Start = f1 [1,1,1,1,1,1] 5// [1,5]
//Start = f1 [2,2,2,2,2,2,2] 666// [2,666]

/* 2. Given a list of sublists of Int, 
keep only the lists where all numbers
are prime numbers.
*/
isPrime:: Int Int->Bool
isPrime _ 1 = True
isPrime x n
|x<2 = False
|x rem n ==0 =False
=isPrime x (n-1)

prime :: Int -> Bool
prime x = isPrime x (x-1)

primeList::[Int]->Bool
primeList []=True
primeList [x:xs]
|not (prime x) = False
= primeList xs

f2::[[Int]]->[[Int]]
f2 list = filter primeList list

//Start = f2 [] //[]
//Start = f2 [[],[4,5,6],[7,11],[7..11]] //[[],[7,11]]
//Start = f2 [[1..10],[2,3,7,5],[1,3,5,7],[21]] //[[2,3,7,5]]


// 3.  Delete the n-th element of each sublist in the list.
f33 :: [Int] Int -> [Int]
f33 [] _ = []
f33 list n = take (n-1) list ++ drop n list

f3 ::[[Int]] Int -> [[Int]]
f3 [] _ = []
f3 [x:xs] n= [f33 x n]++f3 xs n
//Start = f3 [1,2,3,4,5] 1
//Start = f3 [[1,2,3],[3],[4,5,6,7],[],[0,1,6,3,5]] 3  //[[1,2],[3],[4,5,7],[],[0,1,3,5]]
//Start = f3 [[1,2,6,8,3],[9,3],[0,5,0,6,7],[],[0,1,6,3,5,8]] 3  //[[1,2,8,3],[9,3],[0,5,6,7],[],[0,1,3,5,8]]
//Start = f3 [[0],[3],[4,5,6],[],[0,1,6,9,7,3,5]] 3  //[[0],[3],[4,5],[],[0,1,9,7,3,5]]

