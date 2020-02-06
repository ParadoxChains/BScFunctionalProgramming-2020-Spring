module exercises
import StdEnv
// 5. using map extract only the first
// elements of the sublists in 
// [[1,2], [3, 4, 5], [6, 7]] => [1,3,6]
firsts :: [[Int]] -> [Int]
//firsts bigList = map hd bigList
//firsts bigList = map (\subList = hd subList) bigList
//firsts bigList = map (\[a:b]=a) bigList
//firsts bigList = [hd subList\\subList<-bigList]
firsts bigList = [a\\[a:b]<-bigList]

//Start = [2*x\\x<-[1..10]|isOdd x]

// [1,2,3] -> hd [1,2,3]
// [1,2,3] -> [a:rest] a


splitList :: [Int] -> [[Int]]
splitList ourList = [ [x\\x<-ourList & y<-[1..(length ourList)]|isOdd y] , [x\\x<-ourList & y<-[1..(length ourList)]|isEven y] ]

Start = splitList [1,3..20]

//(1,"Hello",False,isEven)
firstElem ourTuple = fst ourTuple
//Start = firstElem (1,"hello",False)
//sumTriple ourTriple = fst3 ourTriple + snd3 ourTriple + thd3 ourTriple
sumTriple (a,b,c) = a+b+c

//Start = foldr (\x y = x+y )  0 [1..5]


reverseList :: [Int] -> [Int]
//reverseList ourList = foldr (\ nextElem currentList = currentList++[nextElem]) [] ourList
reverseList ourList = foldr theOperation [] ourList
theOperation nextElem currentList = currentList++[nextElem]
//[1,2,3,4,5]
//FIRSTELEM++[5]++[4]++[3]++[2]++[1]
//[]++[5]++[4]++[3]++[2]++[1]