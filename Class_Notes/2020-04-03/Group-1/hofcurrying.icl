module hofcurrying
import StdEnv

/*
Currying: treats equivalently the following two types
Int Int -> Int
Int -> (Int -> Int)
*/

//Start = map ((+)1) [1..10]
//Start = filter isEven [1..10]

//Start = 2 + 3
//Start = (+) 2 3 //prefix
//Start = ( (+) 2  ) //this is missing a parameter = 2 + ????????
//Start = ( (+) 2 ) 3 // 2 + ????? -> grabs the 3 from outside.
//Start = ( (-) 2 ) 3 // -1 -> (-) 2 ??? -> (-) 2 3 -> 2 - 3
//Start = ((-) 2) (2+4)
//Start = ((-) 2 ) filter  //OH NO ERROR

//Start = foldr (+) 0 [1..3] // (+) 1 ((+) 2 ((+) 3 0)) //6
//Start = foldr (-) 0 [1..5] //1-(2-(3-(4-(5-0)))) //3
// (-) arg1 arg2  -> (-) lastElement result/initial

//map filter takeWhile dropWhile [ \\ ]

// foldr func neutralElement [listofElementstoProcess]
//Start = foldr (+) 0 [1..5]
//Start = foldr (*) 1 [1..5]
//Start = foldr (\ newElement list = [newElement * 2] ++ list) [] [1..10] //[2,4,6,8,10,12,14,16,18,20]
//Start = map ((*) 2) [1..10] 
//Start = foldr (\ newElement list | isEven newElement = [newElement^3] ++ list = list ) [] [1..10]
//Start = [n^3 \\ n <- [1..10] | isEven n]
//Start = foldr (\ newElement list | isEven newElement && (newElement > 5) = [newElement^3] ++ list = list ) [] [1..10]


/*
Given a list of numbers give us the squares of all prime numbers that are less than a Int n.
*/

//prime numbers
isPrime :: Int -> Bool
isPrime x = and[ x rem n <> 0\\ n<-[2..(x-1)]]
//isPrime x = isEmpty[ n \\ n<-[2..(x-1)] | x rem n == 0]

//Start = (\x = [2..(x-1)]) 8 //generate a list of possible divisors [2,3,4,5,6,7]
//Start = (\x = [ x rem n <> 0\\ n<-[2..(x-1)]]) 8 //[False,True,False,True,True,True]
//Start = (\x = [ n \\ n<-[2..(x-1)] | x rem n == 0]) 8 //[2,4] a list of divisors of 8

//and[True,True,True] = True
//and[True, False, True,True] = False

//Start = isPrime 8

//get a list of squares
listSquares :: [Int] -> [Int]
listSquares list = [ elem^2 \\ elem <- list]

//Start = listSquares [1..10]

//less than int n
lessThanN :: [Int] Int -> [Int]
lessThanN list n = filter (\x = x<n) list

//Start = lessThanN [1..10] 5

finalFunc :: [Int] Int -> [Int]
//finalFunc list x = listSquares(lessThanN (filter isPrime list) x)
finalFunc list x = squaresList
where
    primes = filter isPrime list
    lessN = lessThanN primes x
    squaresList = listSquares lessN


//Start = finalFunc [1..10] 5 //[1,4,9]

/*
foldr (\ newElement list = [newElement * 2] ++ list) [] [ifejfije]
*/

// we have a number like 4.39857483984758439 and we want to get just 4
//Start = toInt 4.39857483984758439 //4 typecasting
// we have a number like 4.39857483984758439 and we want to get just .39857483984758439
decimalPart :: Real -> Real 
decimalPart x = result 
where
    intVer = toInt x
    result = x - (toReal intVer)

// decP x = x - (toReal (toInt x))

//Start = decimalPart 4.39857483984758439 //.39857483984758439

funcAdd :: someTypeA someTypeB -> Real | toReal someTypeA & toReal someTypeB //type restriction <- class restriction
funcAdd a b = result
where
    x = toReal a
    y = toReal b 
    result = x + y

//Start = funcAdd 3 4 //7
//Start = funcAdd 4.5 1.2 //5.7
//Start = funcAdd 3 2.4 //5.4 
//Start = funcAdd True False

equals :: someTypeA someTypeA -> Bool | == someTypeA
equals a b = a == b 

//Start = equals (1,2) (1,2) 


//Start = foldr (\ newElement list | isPrime newElement = [newElement] ++ list ++ [newElement] = list ) [] [1..10]

filterMe :: (Int-> Bool) [Int] -> [Int]
// filterMe _ [] = []
// filterMe cond [x:xs]
// | cond x = [x] ++ filterMe xs
// = filterMe xs
filterMe cond list = filter cond list 

//Start = foldr (\newElement list = [newElement*2] ++ list) [] [1..10] //foldr curries from back of list first, then curries the result list
//Start = foldl (\list newElement = list ++ [newElement*2] ) [] [1..10] //foldl curries from front of the list first, then curries the result list

// Start = foldr (\ x y = x * y) 1 [1..5]
// Start = foldl (\ y x = x * y) 1 [1..5]