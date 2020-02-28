module recursionlists
import StdEnv

//Recursion
//When you call a function from itself

fun :: Int -> Int
fun x
| x > 100 = x
= fun (x+1)

//Start = fun 1
//Start = fun 1
//Start = fun (1 + 1)
//Start = fun ((1 + 1) + 1)

addNumbers :: Int Int -> Int
addNumbers x 0 = x
addNumbers x y
| y < 0 = addNumbers (x-1) (y+1)
//| y < 0 = abort "oh no"
= addNumbers (x+1) (y-1)

//add 2 3 = 2 + 1 + 1 + 1

//add 2 3 = 1 + add 2 2
//1 + add 2 2 = 1 + 1 + add 2 1
//1 + 1 + add 2 1 = 1 + 1 + 1 + add 2 0
//1 + 1 + 1 + 2
//Start = addNumbers 2 3
//Start = addNumbers 2 -3

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

fac :: Int -> Int
fac n = facAux n 1

facAux :: Int Int -> Int
facAux 0 acc = acc
facAux n acc = facAux (n-1) (acc * n)

//f 3
//fa 3 1
//fa 2 (1*3)
//fa 1 ((1*3)*2)
//fa 0 (((1*3)*2)*1)
//fa 0 (((1*3)*2)*1) = (((1*3)*2)*1)

//Lists
//collection of things of the same type
//[1,2,3] [Int]
//[1..10]
//[1,3..10] [Int]
//[1, 2.0..13] //compile error
//[2,4,8..100] //compile error
//Start = ['a'..]
//Start = ['a','c'..'z']

//[3:[4..9]] [3,4,5,6,7,8,9] [Int]
//[ asinglething : [alltheotherstuff] ]
//[ 3 : [4,5,6,6]]
//Start = [ [4] : [6..10]] //[[Int]]
//Start = [ [4] : [[3,2,4],[1..10]]]
//         [Int] : [ ofwhat's on that side ]
//         [Int] : [  [Int]   ]   

//Start = hd [1..10] //1 Int
//Start = tl [1..10] //[2,3,4,5,6,7,8,9,10] [Int]

sumList :: [Int] -> Int
sumList aList
//| aList == [] = 0
| isEmpty aList = 0
= hd aList + sumList (tl aList)
//sL  [Int] =  Int + ([Int] -> Int)
//sL [Int] = Int 

//[1,2,3,4] = 1  + 2 + 3 + 4

doubleList :: [Int] -> [Int]
doubleList [] = []
//doubleList [first:rest] = [2*first] ++ doubleList rest
doubleList [first:rest] = [ 2*first : doubleList rest]
//[1,2,3,4] -> [2,4,6,8]
//[a:b] a= 1 Int   b = [2,3,4] [Int]

//dL [1,2,3,4] -> f = 1 r= [2,3,4]
//[2 * 1] ++ dL [2,3,4]  f = 2 r = [3,4]
//[2*1] ++ [2*2] ++ dL [3,4] f=3 r=[4]
//[2*1] ++ [2*2] ++ [2*3] ++ dL [4] f=4 r=[]
//[2*1] ++ [2*2] ++ [2*3] ++ [2*4] dL []
//[2*1] ++ [2*2] ++ [2*3] ++ [2*4] ++ []
//[2] ++ [4] ++ [6] ++ [8] ++ []
//[2,4,6,8]

//[1..10]
//[a,b,c:d]
//a = 1 b = 2 c = 3 d = [4,5,6,7,8,9,10]

//process [a,b,c:d]
//dosomething a c ++ recurse [b:d]
//dosomething (hd list) (hd(tl(tl list))) ++ recurse (hd(tl list))++tl(tl(tl list))