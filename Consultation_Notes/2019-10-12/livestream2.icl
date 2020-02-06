module livestream2
import StdEnv

//Starting with RECURSION
/*
Recursion is repeating something.
Recursion has two parts.
    1. What is the repeated action?
        a. What are we doing over and over again?
        b. How does it repeat?
    2. What is the stop condition?
        a. When do we stop the recursion?
        b. How do we stop the recursion?
        c. What do we do after we stop the recursion?
*/

//Side recursion
//factorial :: Int -> Int
//factorial 4 = 4*3*2*1
/*
    1. What is the repeated action?
        a. What are we doing over and over again? -> multiplication
        b. How does it repeat? -> multiply by the next number down.
    2. What is the stop condition?
        a. When do we stop the recursion? -> when we hit 1
        b. How do we stop the recursion? -> multiply by 1
        c. What do we do after we stop the recursion? -> nothing else
*/

//code a basic step first
//Start = 4*3*2*1
factorial :: Int -> Int
factorial 0 = 1
factorial 1 = 1
factorial n
| n<0 = 0
= n*factorial (n-1) //builds off to the side. ->
//factorial 4 = 4 * factorial 3 = 4 * 3 * factorial 2 = 4*3*2*factorial 1 = 4*3*2*1
//factorial 0 = 1
//factorial -3435435 = 0


//Nested recursion
//we want to square a number repeatedly
//(((5)^2)^2)^2

//squaringThis :: Int Int -> Int
/*
    1. What is the repeated action?
        a. What are we doing over and over again? -> squaring
        b. How does it repeat? -> squaring inside of parenthesis
    2. What is the stop condition?
        a. When do we stop the recursion? -> when we've squared enough
        b. How do we stop the recursion? -> return that number itself
        c. What do we do after we stop the recursion?
*/
//Start = (5)^2
squaringThis :: Int Int -> Int
squaringThis num 0 = num
squaringThis num howMany = (squaringThis num (howMany-1))^2

//Start = squaringThis 2 3 //((((2)^2)^2)^2)

//Recursion with lists :D
// rewrite the function repeatn
// repeatn :: Int a -> [a]
//Start = repeatn 10 "Hello!"
//["Hello!","Hello!","Hello!","Hello!","Hello!","Hello!","Hello!","Hello!","Hello!","Hello!"]

//Side recursion
//Repeated action: putting elements into a list.
//Stop condition: when we've put enough elements into the list.
//Start = [1,2,3,4,5]++[6] //[1,2,3,4,5,6]
repeatnSide :: Int Int -> [Int]
repeatnSide 0 _ = []
repeatnSide howMany elem
| howMany < 0 = []
= [elem] ++ repeatnSide (howMany-1) elem
//Start = repeatnSide 10 5
//[5,5,5,5,5,5,5,5,5,5]

//Nested recursion
//Repeated action: putting elements into a list.
//Stop condition: when we've put enough elements into the list.
//Start = [5:[5]] //[5,5]
//Start = [5:[4:[3:[2:[1]]]]] //[5,4,3,2,1]
repeatnNest :: Int Int -> [Int]
repeatnNest 0 _ = []
repeatnNest howMany elem
| howMany < 0 = []
= [elem:repeatnNest (howMany-1) elem]
//Start = repeatnNest 10 5
//[5,5,5,5,5,5,5,5,5,5]

//Tail Recursion
/*
Tail recursion is recursion that is linear in time.
It takes advantage of tail recursion optimization which
is done by almost every modern compiler.
It requires an additional variable, called an accumulator.
*/
//We MUST complete evaluation at each step!!!
repeatnTail :: Int Int -> [Int]
repeatnTail howMany elem
| elem < 0 = []
= repeatnTailAux howMany elem []

repeatnTailAux :: Int Int [Int] -> [Int]
repeatnTailAux 0 _ accum = accum
repeatnTailAux howMany elem accum = repeatnTailAux (howMany-1) elem (accum ++ [elem])
//Start = repeatnTail 10 5
//[5,5,5,5,5,5,5,5,5,5]
/*
f 3 5 = fa 3 5 []
fa 3 5 []
fa 2 5 [5]
fa 1 5 [5,5]
fa 0 5 [5,5,5]
*/
//addUp 2 5 = 2+ 3+4+5
addUp :: Int Int -> Int
addUp a b
| a > b = addUp b a
= addUpAux a b []

addUpAux :: Int Int [Int] -> Int
addUpAux a b accum
| a > b = sum accum
= addUpAux (a+1) b (accum++[a])
/*
au 2 5
aua 2 5 []
aua 3 5 [2]
aua 4 5 [2,3]
aua 5 5 [2,3,4]
aua 6 5 [2,3,4,5]
*/

/*
Given a list sublists of numbers, keep only
the sublists that have all prime numbers.
*/
//filter :: (a->Bool) [a] -> [a]
//Start = filter isEven [1,2,3,4,5] //[2,4]
//Start = filter condEven [[2,4..20],[23,25],[1..5],[2,4,6]]
condEven :: [Int] -> Bool
condEven ourList = and(map isEven ourList)
//Start = condEven [1,2,4,6,8]
// map func [a,b,c] -> [func a, func b, func c]

//Start = primeListFilter [[1,2,3],[4,9,25],[1,3,7,12,14],[]]
primeListFilter :: [[Int]] -> [[Int]]
primeListFilter ourList = filter condPrime (filter notEmpty ourList)

notEmpty :: [Int] -> Bool
notEmpty someList = not(isEmpty someList)

condPrime :: [Int] -> Bool
condPrime ourList = and(map isPrime ourList)

isPrime :: Int -> Bool
isPrime n = not(or(map (dividable n) [2..(n-1)]))

dividable :: Int Int -> Bool
dividable n check = n rem check == 0

//Start = isPrime 10


/*
map something (map someotherthing somelist)
map (map something) somelist
*/
add3 n = n+3
times2 n = n*2

//Start = map add3 (map times2 [1..5]) //[5,7,9,11,13]
// map add3 [2,4,6,8,10]
// [5,7,9,11,13]
//Start = map (map add3) [[1..5],[5,8,3],[],[0]] //[[4,5,6,7,8],[8,11,6],[],[3]]
// [ map add3 [1..5], map add3 [5,8,3], map add3 [], map add3 [0] ]
// [ [4,5,6,7,8], [8,11,6], [], [3] ]