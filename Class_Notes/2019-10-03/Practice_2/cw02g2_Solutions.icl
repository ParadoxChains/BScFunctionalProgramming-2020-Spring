module cw02g2_Solutions
import StdEnv

a = 1
b = 3
c = 57
/*
auto c()
{
  return 57;
}
*/
//Start = [a,b..c]
//^
//Start
//[a,b,..c]
//[1,3,..57]

// 1. Compute the product of odd numbers from 1 to n using recursion
prodOdd :: Int -> Int
prodOdd n
| n == 1 = 1
| n <=0 = 0
| isEven n = prodOdd(n-1)
= n * prodOdd(n-2)

prodOddList n = prod(filter (\x = x <= n) (filter isOdd [1..]))
// Start = prodOdd 7 // 105
// Start = prodOdd 6 // 15
// Start = prodOdd 1 // 1
// Start = prodOdd (~54) //0

isNotZero :: Int -> Bool
isNotZero n = n <> 0

// 2. Remove all '0' from the list
remZero :: [Int] -> [Int]
remZero myList = filter isNotZero myList


// Start = remZero [1,9,0,2,4,7,0,5,1,8,3,0,1,2] // [1,9,2,4,7,5,1,8,3,1,2]
// Start = remZero [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] // []
// Start = remZero [1,0,(~1),0,0,2,0,0,0,(~2),0,0,0,0,3] // [1,-1,2,-2,3]

// Start = filter isEven [1..5]
// ^
// Start
// filter isEven [1..5]
// filter isEven [1,2,3,4,5]
// isEven 1 -> False
// []
// isEven 2 -> True
// [2]
// isEven 3 -> False
// [2]


// 3. Compute the difference between the first and the last element of each sublist.
sums :: [[Int]] -> [Int]
sums [] = []
sums [a:b]
| isEmpty a = [0:sums b]
| length a == 1 = [0: sums b]
= [abs((hd a)-(last a)):sums b]
// [x : xs]
// [2:[3..5]] = [2,3,4,5]
Start = sums [[1,2], [3,4,5], [6,5,9,7], [], [8]] // [1,2,1,0,0]




