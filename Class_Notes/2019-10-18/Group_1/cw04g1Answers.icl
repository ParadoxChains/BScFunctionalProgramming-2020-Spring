module cw04g1Answers
import StdEnv


// 1. For every sublist, eliminates its elements
// Until the current element is a prime number
// Requirement: 
//  - Use list comrehension to determin the prime number!
//  - Use map instead of recursion
//  - Use dropWhile

prim :: Int-> Bool
prim 1 = False
prim n = [x\\x<-[2..(n-1)]|n rem x ==0] == []


f1 :: [[Int]] -> [[Int]]
f1 list = map (dropWhile (not o prim)) list


//Start = f1 [[1, 2, 3, 4], [9, 7, 6, 5, 4, 3, 0], [3, 5, 7, 9], [], [128, 64, 32]] // [[2,3,4],[7,6,5,4,3,0],[3,5,7,9],[],[]]
//Start = f1 [[1], [4], [2]] // [[],[],[2]]
//Start = f1 [[5..10], map (\x = x + 5) [1..4], [], [4,12,8,5, 4]] // [[5,6,7,8,9,10],[7,8,9],[],[5,4]]

//2. A positive number in the form like: 10, 200, 8, 1000, 40, 1, 9, 7000, 30000000
// (which has only one non-zero digit at first place) is called a "clean number"(0 is not included)
// find all clean numbers in the list of lists and write to a list

cleanNum:: Int -> Bool
cleanNum n
|n <= 0 = False
|n < 10 = True
|n rem 10 <>0 = False
= cleanNum (n/10)

f2 :: [[Int]] -> [Int]
f2 list = flatten (map (filter cleanNum) list)


//Start = f2 [[1,2,7,10,50,102,33],[],[0,9,90],[11,980,20]] //[1,2,7,10,50,9,90,20]
//Start = f2 [[1..20],[10,20..60],[30,20.. -10]]//[1,2,3,4,5,6,7,8,9,10,20,10,20,30,40,50,60,30,20,10]

//3. find the middle element of each sublists of list.(hint:use !!)
// list of even length like [0,1,2,3] choose 2
// add them together using foldr
// suggest using only one function

f3 :: [[Int]] -> Int
f3 list = foldr (+) 0 (map (\x = x !!((length x)/2)) list)


//Start =f3 [[1],[1,2],[1,2,3]] //5
//Start =f3 [[1],[1,2],[1,2,3],[3,3,0,8,9]] //5
//Start = f3 [[10,20,30],[1,3]] //23