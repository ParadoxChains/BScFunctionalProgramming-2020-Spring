module tuplesFun
import StdEnv

/*
Tuples are a way to put things together easily.
*/

list1 = [1124,523532,6757]
list2 = ["James","Jack","John"]
//nolist = ["james",1124]
//pair
james :: (String, Int)
james = ("James",1124)

//Start = fst james //"James"
//Start = snd james //1124
//fst and snd ONLY work on tuples of 2 elements

//Start = thd3("James", 1124, True)

//Start = fourth("James",1124,True,'a')

//Start = ("James") //singleton tuples do not exist

func1 :: Int Int -> (Int,Int)
func1 x y = (x,y)
//[ something , other ]
//Start = func1 2 3 //(2,3)

//Start = [  ( a , b )  \\ a<-[1..7], b<-[a..7]  | a+b == 7 ] //[(1,6),(2,5),(3,4)]
func2 :: Int -> [(Int,Int,Int,Bool)]
func2 n =  [  ( a , b , b-a, isEven a && isEven b)  \\ a<-[1..n], b<-[a..n]  | a+b == n ]

//Start = func2 100

//dictionary/map/key pairings
Bank :: [(String,Int)]
Bank = [("John",467),("Jim",0),("Jack",900000001),("Evan",-384859493)]

lookUp :: String [(String,Int)] -> Int
//lookUp name accountsList = snd(hd[  account \\ account<-accountsList | fst account == name ])
lookUp name accountsList = hd[ accountBalance \\  ( accountName, accountBalance) <- accountsList | accountName == name]

//Start = lookUp "Evan" Bank

updateAccount :: [ ( String, Int) ] -> [ ( String, Int, Bool) ]
//updateAccount accountsList = [ ( fst account, snd account, snd account > 0 ) \\  account<-accountsList ]
updateAccount l = [(a,b,b>0)\\(a,b)<-l]

//Start = updateAccount Bank //[("John",467,True),("Jim",0,False),("Jack",900000001,True),("Evan",-384859493,False)]

stimulus :: [ ( String, Int, Bool ) ] -> [ ( String, Int, Bool ) ]
//stimulus accountsList = map (\account | thd3 account == False = (fst3 account, (snd3 account)+1000, True ) = account  ) accountsList
stimulus accountsList = map (\( a, b, c) | c == False = (a, b+1000, True ) = (a,b,c)  ) accountsList

//Start = stimulus (updateAccount Bank)

/*
ask a server for a status on an ip address 10.0.0.1
[10,0,0,1] :: [Int]
(10,0,0,1) :: (Int,Int,Int,Int)
(a,b,c,d)

((10,0,0,1) ,  (True,"node 1",["john","james","jack"]) )
*/


// 7. Check if a list contains 2 equal elements one after the other
// (it can be anywhere in the list)
// for [1,2,3,3,3,2,4,5] is True for [1 .. 5] is False

function :: [Int] -> Bool
function [x] = False
function [] = False
function [x,y:xs]
| x == y = True 
= function [y:xs]  

 

Start = function [1,2,3,3,5] 
// x = 1, y = 2
//False

//  [  \\  a<-[1..3] & b<-[1..3] ]
// a=1 b=1
// a=2 b=2
// a=3 b=3

// [ \\  a<-[1..3] , b<-[1..3] ]
// a=1 b=1
// a=1 b=2
// a=1 b=3
// a=2 b=1
// a=2 b=2
// a=2 b=3
// a=3 b=1
// a=3 b=2
// a=3 b=3
 

