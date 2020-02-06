module exercises
import StdEnv

// 5. using map extract only the first
// elements of the sublists in 
// [[1,2], [3, 4, 5], [6, 7]] => [1,3,6]
firsts :: [[Int]] -> [Int]
//firsts bigList = map hd bigList
//firsts bigList = map (\[a:rest] = a) bigList
//firsts bigList =[hd subList\\subList<-bigList]
firsts bigList = [a\\[a:b]<-bigList]


something bigList = [ x^2\\x<-[a\\[a:b]<-bigList] ]
//Start =  [x+2\\x<-[1..10] | isEven x]
//[ these go into your list \\ make your variables | filter ]

//[1,2,3] -> hd [1,2,3] or [1,2,3] -> [a:rest] a


//Start = firsts [[1,2], [3, 4, 5], [6, 7]] // [1,3,6]


// 13. Delete the last element of each sublist of a list.
// E.g. for [[1,2,3],[5,6],[],[7,8,9,10]] the result is [[1,2],[5],[],[7,8,9]]
//lastdel :: [[Int]] -> [[Int]]
lastdel bigList = [init subList\\subList <- bigList ]

//[1,2,3,4,5,6]
splitList :: [Int] -> [[Int]]
splitList ourList = [ [x\\x<-ourList & y<-[1..(length ourList)]|isOdd y], [x\\x<-ourList & y<-[1..(length ourList)]|isEven y] ]

firstElem :: (Int, Int, Int, Int) -> Int
//firstElem ourTuple = fst3 ourTuple
firstElem (a,b,c,d) = a

//Start = firstElem (1,2,3,4)


sumTriple :: (Int, Int, Int) -> Int
//sumTriple ourTuple = fst3 ourTuple + snd3 ourTuple + thd3 ourTuple
sumTriple (a,b,c) = a + b + c




