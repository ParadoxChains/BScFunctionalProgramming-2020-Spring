module listfun
import StdEnv

//lists , .. : \\

//Start = [1,2,3:[4..10]]
// [result1] ++ [result2]
// [result1 , result2 ]
// [result] ++ [list of other results]
// [result :  [list of other results]]

//Start = [ 2*n  \\ n<-[1..10] ]
// [  stuff that goes into your list \\  ranges   |  optional conditions ]

//Start = [ 2^n \\ n<-[1..10]]
//Start = [ n \\ n<-[1..10] | isOdd n ]
//Start = [ 1 \\ n<-[100..200]]
//Start = [ a+b \\ a<-[1..5] & b<-[] ]
//Start = [ (a,b) \\ a<-[1..10] , b<-[1..10]  ]
//Start = [a \\ a<-[1..5] , b<-[1..a], c<-[1..b]]

//Start = [ 2^x \\ x<-[1..] | 2^x <=100 && ( 2^x )>0]

//Start = [ a + b \\ a<-[-10..10] , b<-[-10..10] | isEven b && (a+b)>0 ]

genSeq :: Int -> [Int]
genSeq n = [ (-1)^x\\ x<-[1..n]  ]

//Start = genSeq 10
//[1,2,3,4,5,6,7,8,10]]

//Start =  [1..5] !! 4

myList = [a+b*c\\a<-[1..5],b<-[1..7],c<-[1..3]]
Start =  myList !! ((length myList)/2)
extractMid :: [Int] -> Int
extractMid list = list !! ((length list)/2)

//Start = extractMid [1..5]