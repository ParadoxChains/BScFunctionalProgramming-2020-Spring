module cw02g1_Solutions
import StdEnv

// 1. Compute the sum of the list excluding the largest and the smallest number
f1 :: [Int] -> Int
f1 listA = sum(init(tl (sort listA)))
//Start = sum(init(tl[1..5]))

//Start = f1 [1..5] //  9
//Start = f1 [4,6,2,7,1,9] //  19
//Start = f1 [-4,6,2,7,1,9] // 16

// 2. Replace every second number from the list by 1,2,3...
f2 :: [Int] -> [Int]
f2 myList = f2aux myList 0 1

f2aux myList pos ins
| pos > length myList = myList
| isOdd pos = f2aux (updateAt pos ins myList) (pos+1) (ins+1)
| isEven pos = f2aux myList (pos+1) ins
//[5,23,73,7,3,7,32,6,8]
//[1,2,3,4,5,6,7,8,....]
//[5,1,73,2,3,3,32

//Start = f2 [] //[]
//Start = f2 [4] //[4]
//Start = f2 [6,4] //[6,1]
//Start = f2 [6,6,6,6] //[6,1,6,2]
//Start =  f2 [1,9,0,2,4,7,0,5,1,8,3,0,1,2] // [1,1,0,2,4,3,0,4,1,5,3,6,1,7]

// 3. Divide a list of integer into two lists
// One containing even numbers and one containing odd numbers
//[1,2,3,4,5,6] -> [[2,4,6],[1,3,5]]
f3::[Int] -> [[Int]]
f3 myList = [(filter isEven myList), (filter isOdd myList)]
//Start = filter isEven [1..10]
Start = f3 [1..6] //[[2,4,6],[1,3,5]]
//Start = f3 [34..43]  //[[34,36,38,40,42],[35,37,39,41,43]]