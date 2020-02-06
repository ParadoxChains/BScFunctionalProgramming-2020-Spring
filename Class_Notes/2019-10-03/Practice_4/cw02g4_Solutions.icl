module cw02g4_Solutions
import StdEnv

// Reverse the list recurievely
f1 :: [Int] -> [Int]
f1 aList
| isEmpty aList = []
=[last aList : f1 (init aList)]
// Start = f1 [] // []
// Start = f1 [1,2,3,4,5] // [5,4,3,2,1]
//Start = f1[1,2,3]
//^
//Start
//f1 [1,2,3]
//[last [1,2,3] : f1 (init [1,2,3])]
//[last [1,2,3] : f1 [1,2]]
//[last [1,2,3] : [last [1,2,] : f1 (init [1,2])]]
//[last [1,2,3] : [last [1,2] : f1 [1]]]
//[last [1,2,3] : [last [1,2] : [last [1] : f1 (init [1])]]]
//[last [1,2,3] : [last [1,2] : [last [1] : f1 []]]]
//[last [1,2,3] : [last [1,2] : [last [1] : []]]]
//[last [1,2,3] : [last [1,2] : [1 : []]]]
//[last [1,2,3] : [last [1,2] : [1]]]
//[last [1,2,3] : [2 : [1]]]
//[last [1,2,3] : [2,1]]
//[3 : [2,1]]
//[3,2,1]



// Generate every odd number from 1 to n (n is function parameter)
f2 :: Int -> [Int]
f2 n
| n <=0 = []
= filter isOdd [1..n]

//Start = filter isOdd [1..10]
// Start = f2 1  // [1]
// Start = f2 10 // [1,3,5,7,9]
// Start = f2 (~4) // []

//function_name :: type1 type2 type3 -> typeReturn
//typeReturn function_name(type1, type2, type3);

// Replicate the elements of a list a given number of times. 
// If list is [1,2,3] and given number 2 -> [1,1,2,2,3,3]
f3 :: [Int] Int -> [Int]
f3 aList num
| num <= 0 = []
| isEmpty aList = []
= (repeatn num (hd aList)) ++ f3 (tl aList) num
//Start = repeatn 10 3
// Start = f3 [1,1,3,4] 3 // [1,1,1,1,1,1,3,3,3,4,4,4]
// Start = f3 [1,2,3] 2 // [1,1,2,2,3,3]
// Start = f3 [] 100 // []
// Start = f3 [1..] (~45) // []

f3LAZY myList num = flatten[repeatn num elem\\elem<-myList]
Start = f3LAZY [1,2,3,4] 5








