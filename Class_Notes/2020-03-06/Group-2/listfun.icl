module listfun
import StdEnv

//lists [a,b,c,d]
//constructors , : .. \\
//Start = [ 1,2,3 : [4..10] ]
// [1] ++ [2] ++ [3] ++ [ 4,5,6,7,8,9, 10]
//  [result1] ++ [result2] ++ [result3]
// [result1 , result2, result3   ]

//Start = [ (x,y) \\ x<-[1..10] , y<-[1..10] | isEven x && isOdd y ]
// [ whatever goes in your list \\   ranges   |   conditions    ]
//Start = [ 2^x \\ x<-[1..] ]
//Start = [ 3 * x \\ x<-[1..100] | isEven x ]
//    3)doSomething, add to list  1)Start here   2)checks condition
//Start = [ 1 \\ n<-[1..100]]
// [1..10] [100..200]
//Start = [ x+y \\ x<-[1..10] & y<-[100..]  ]

fib :: Int -> Int
fib x = fibAux x 0 1

fibAux :: Int Int Int -> Int
fibAux 0 a _ = a
fibAux x a b = fibAux (x-1) b (a+b)

//Start = fib 8
fibList :: Int -> [Int]
fibList x = [ fib n \\ n<-[0..100]   | fib n <= x  && fib n >= 0]

//Start = fibList 100

//Start = [ 1,2,3 : [ n*2 \\ n<-[3..10] | isEven n]   ]
//        Int    :  [Int]

//Start = [ a \\ a<-[1..10] , b<-[1..a]]

myList = [ a+b \\ a<-[1..10] , b<-[1..5]]
//Start = myList !! ((length myList)-1)

func :: [Int] -> [Int]
func [] = //do something else
func [x] = //pattern matches a list of one element
func [a:b] = //pattern match a to first element, b is everything else.
func list = //do something to the list
