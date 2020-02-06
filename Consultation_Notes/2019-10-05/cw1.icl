module cw1

import StdEnv

// 1. Using recursive function generate a list with elements from 1 to x,
// x is function parameter (a dot-dot expression is not good).

//Recursion is Recursive.
//Repeated action: Adding elements to a list.
//Stop condition: When we add enough elements.
listGen :: Int -> [Int]
//listGen x = [1..x]
listGen x
| x<=0 = []
| x==1 = [1]
= (listGen (x-1)) ++[x]

//listGen 5 = (listGen 4) ++[5] //[1,2,3,4,5]
//(listGen 4) = listGen 3 ++[4]// [1,2,3,4]
//listGen 3 = listGen 2 ++[3] //[1,2,3]
//listGen 2 = listGen 1++[2] //[1,2]
//listgen 1 = [1] //[1]
// contain everything else->[Int]++[Int]<-contain x
//Start = listGen 10 //[1,2,3,4,5,6,7,8,9,10]
//Start = listGen 0 //[]
//Start = listGen -87345834 //[]

//Adding a single element to a list. The simple case.
//Start = [1,2,3] ++ [4] //[1,2,3,4] <- '++'works between 2 lists.
//Start = [1,2,3] ++ 4 //Type error Int [Int] Int [v4]
//Start = [1:[2,3,4]] //[1,2,3,4] <- 1 is a single element
//Start = [[1]:[2,3,4]] //Type [v4][v6] [[Int]] [Int]

/*
how does the compiler
know
that
( something) is a list
*/
// [ ] <- in between these two.
// But the (listgen(x-1)) doest have the []

//so we use ":" to divide the list to sublists then we use "++" to connect them again?
//[1,2,3,4,5] -> [a:b] // a=1 b=[2,3,4,5]
//[1,2,3,4,5] -> [a,b,c:d] //a=1 b=2 c=3 d=[4,5]
//[1:[2,3,4,5]] //[1,2,3,4,5]
//[1,2,3:[4,5]] //[1,2,3,4,5]
//[1,2,3:function_that_returns_rest_of_elements]

//Oh, so, if we type, for example, [[1,2,3,4]:[5,6,7,8]].
//The head will be 1,2,3,4 and tail ,5,6,7,8 ?
//^^^^COMPILE ERROR^^^^

// 2. Compute the sum of each sublist.
// [[1,2], [3,4,5], [6,5,9,7], [], [8]] -> [3,12,27,0,8]

lalalala :: [[Int]] -> [Int]
lalalala bigList
| isEmpty bigList = []
| isEmpty(hd bigList) = [0:lalalala (tl bigList)]
= [sum(hd bigList):lalalala (tl bigList)]


lalalala2 :: [[Int]] -> [Int]
lalalala2 bigList = map sum bigList

lalalala3 :: [[Int]] -> [Int]
lalalala3 bigList = [sum x\\x<-bigList]

//Repeated Action: Sum a sublist. Add it to biglist.
//Stop condition: We have added all the sums of the sublists
//How do we add up a list?
//sum list :D
//Start = sum [1,2,3,4] //10
//Start = lalalala [[1,2], [3,4,5], [6,5,9,7], [], [8]]

// 3. Insert x as first element in every sublist of a list.
// if the sublist was empty then x will be the only element in the new sublist.
// [[1,2], [3,4,5], [6,5,9,7], [], [8]] 100 -> [[100,1,2], [100,3,4,5], [100,6,5,9,7], [100], [100,8]]

insx :: [[Int]] Int -> [[Int]]
insx [] _ = []
insx bigList insMe = [[insMe:(hd bigList)]:insx (tl bigList) insMe]

insx2 bigList insMe = map (\subList = [insMe:subList]) bigList
insx3 bigList insMe = [[insMe:subList]\\subList<-bigList]

//Start = [1: [2,3,4,5]]
//Start = [1]++[2,3,4,5]
//Start = insertAt 0 1 [2,3,4,5]
//Start = insertAt ((length[12,3,4,5,6,7,87])/2) 999 [12,3,4,5,6,7,87]

//Start = insx  [[1,2], [3,4,5], [6,5,9,7], [], [8]] 100


//cloogle.org
// abs -> StdOverloaded
// hd -> StdLists
// fst -> StdTuple
// o -> StdFunctions







