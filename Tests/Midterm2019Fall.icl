module Midterm2019Fall
import StdEnv

/*
1.
Given a list of sublists of Int
Write a function which returns a list containing
the minimum of every sublist
You should use foldr when finding the minimum.
Ignore empty sublists.
*/
//foldr (\x y = min x y) x [2,4,2,6,1,4]
minListFoldr :: [Int] -> [Int]
minListFoldr [] = []
minListFoldr [first:rest] = [foldr (\x y = min x y) first rest]
//Start = minListFoldr [1,4,4,2,6, -13871]
GetMin :: [[Int]] -> [Int]
GetMin biglist = flatten [minListFoldr sublist\\sublist<-biglist]
//Start = GetMin [[42, 420], [24, 240]] // [42, 24]
//Start = GetMin [[], [1], [2,3], [4,5,6]] // [1, 2, 4]
//Start = GetMin [[], [1], [2, ~3], [4, ~5, 6]] // [1, -3, -5]
//Start = GetMin [[]] // []


/*
2.
Given a list of tuples, return a single tuple which is
the sum of all tuple (x,y) in which x,y have the same parity (odd, odd)/(even, even)
minus the sum of all tuple (x,y) in which x,y dont have the same parity (odd, even)/(even, odd)
For example:
TupleSum [(1, 2), (4, 4)]
(4,4) has the same parity. We take that and subtract (1,2), which has opposite parity.
*/
//(1,1) (2,2) (1,3) = (1+2-1,1+2-3)

TupleSum :: [(Int, Int)] -> (Int, Int)
TupleSum list = same - diff
where
    same = sum[(a,b)\\(a,b)<-list|isEven a == isEven b] 
    diff = sum[(a,b)\\(a,b)<-list|isEven a <> isEven b]

instance + (Int,Int) where + (a,b) (c,d) = (a+c,b+d)
instance - (Int,Int) where - (a,b) (c,d) = (a-c,b-d)
instance zero (Int,Int) where zero = (0,0)
//Start = (1,2) + (3,4)
//Start = sum[(1,2),(3,4)]
//Start = TupleSum [] // (0,0)
//Start = TupleSum [(1, 2)] // (-1, -2)
//Start = TupleSum [(1, 2), (4, 4)] // (3, 2)
//Start = TupleSum [(2, 6),(3, 4),(1, 2),(5, 9),(3, 6)] //(0,3)


/*
3.
Write a function that takes a list of tuples,
each tuple consisting of a predicate function and
a list of Int.
Return a list containing the sum of the sublists
where all elements return True for the predicate.
For example:
Start = conditionalFun [(isEven,[1..10]),(isOdd,[1,3,5,7]),(((<)3),[5..10])]
[1..10] does not return True to isEven for all elements.
[1,3,5,7] returns True for isOdd for all elements. We sum it to 16, add to list.
[5..10] returns True for greater than 3 for all elements. We sum to 45, add to list.
*/
//(cond, [Int])
conditionalFun :: [((Int->Bool),[Int])] -> [Int]
conditionalFun biglist  = [sum sublist\\(cond,sublist)<-biglist| and(map cond sublist) ]
//Start = conditionalFun [(isEven,[1..10]),(isOdd,[1,3,5,7]),(((<)3),[5..10])] //[16,45]
//Start = conditionalFun [((\x = True),[4,7..35]),((\x = False),[1..])] //[209]
//Start = conditionalFun [(isEven,[]),(isOdd,[])] //[0,0]
//Start = conditionalFun [] //[]


/*
4.
Write a function which takes a list of numbers and returns a list
containing only the palindromes.
A palindrome is a number or word which is identical when
read backwards and forwards.
For example: 123 is NOT a palindrome. 12321 is a palindrome.
*/
isPal :: Int -> Bool
isPal x = list == reverse list
where
    list = intList x

intList :: Int -> [Int]
intList x
| x < 10 = [x]
= intList (x/10)++[(x rem 10)]

//Start = intList 458512512
//Start = isPal 1234
//Start = isPal 12321

Palindromes::[Int]->[Int]
Palindromes list = filter isPal list
//Start = Palindromes [1,212,43,55,727,123,100] // [1,212,55,727]
//Start = Palindromes [76,89,1223,998]//[]
//Start = Palindromes []//[]
//Start = Palindromes [33]//[33]


/*
5.
Write a function which generates a list of the first n leap years starting from
a year x. If either of the arguments is negative output an empty list.
A leap year is divisible by 4 but is NOT divisible by 100 UNLESS it is divisible by 400
From Wikipedia:
if (year is not divisible by 4) then (it is a common year)
else if (year is not divisible by 100) then (it is a leap year)
else if (year is not divisible by 400) then (it is a common year)
else (it is a leap year)
*/
isLeapYear :: Int -> Bool
isLeapYear x
| x rem 4 <> 0 = False
| x rem 100 <> 0 = True
| x rem 400 <> 0 = False
= True

//Start = isLeapYear 2100

LeapYears :: Int Int->[Int]
LeapYears year n
| year < 0 || n < 0 = []
= take n [x\\x<-[(year+1)..]|isLeapYear x]
//Start=LeapYears 1999 4 // [2000,2004,2008,2012]
//Start = LeapYears 1804 7 //[1808,1812,1816,1820,1824,1828,1832]
//Start = LeapYears -2000 4 //[]
//Start = LeapYears 2000 -9//[]


/*
6.
Write a function that takes a number and determine whether it is a perfect number or not!
A perfect number is a natural number that equals the sum of all its proper divisors.
A proper divisor is every divisor of a number excluding the number itself.
Example : isPerfect 6 // True
(Because the proper divisors of 6 are 1, 2 and 3 so their sum is equal
to 6 so it is true)
*/
propDiv :: Int -> [Int]
propDiv x = [n\\n<-[1..(x-1)]|x rem n == 0]

//Start = propDiv 10

isPerfect :: Int -> Bool
isPerfect x
| x <= 0 = False
= x == sum (propDiv x)
//Start = isPerfect 6 //True
//Start = isPerfect 496 //True
//Start = isPerfect 11//False
//Start = isPerfect 1 //False
//Start = isPerfect 0 //False
//Start = isPerfect -1 // False


/*
7.
Given two integers, return a list of all common divisors
of two intergers (excluding 1)
*/
intersect :: [Int] [Int] -> [Int]
intersect x y = [n\\n<-x|isMember n y] ++ [n\\n<-y | isMember n x]

//Start = intersect [1..10] [5..20]
div :: Int -> [Int]
div x = [n\\n<-[2..x]|x rem n == 0]

divisors::Int Int -> [Int]
divisors x y = removeDup (intersect (div x) (div y))
//Start = divisors 6 12 //[2,3,6]
//Start = divisors 7 12 //[]
//Start = divisors 9 15 //[3]
//Start = divisors 128 64 //[2,4,8,16,32,64]


/*
8.
Given a list of intergers
find all the cube numbers(n^3) and write (n) to the first list; for example 8 -> 2
(A cube number is a number that is the product of three numbers which are the same)
find all the numbers which are powers of 2 (2^n) and write the exponent n to the
second list; for example 64 -> 6
*/

cubeRootTest :: Int -> Bool
cubeRootTest x = not(isEmpty[n\\n<-[1..x]|n*n*n == x])

cubeRoot :: Int -> Int
cubeRoot x = hd[n\\n<-[1..x]|n*n*n == x]
//Start = cubeRoot 8

powerOf2Test :: Int -> Bool
powerOf2Test x = isMember x list
where
    pow2 = [2^a\\a<-[0..]]
    list = takeWhile ((>=)x) pow2

cubes2::[Int]->([Int],[Int])
cubes2 list = ([cubeRoot x\\x<-list|cubeRootTest x], [ toInt((ln (toReal x))/(ln 2.0)) \\x<-list | powerOf2Test x])
//Start = cubes2 [64, 16, 24, 15, 1 , 8] //([4,1,2],[6,4,0,3])
//Start = cubes2 [1..10] //([1,2],[0,1,2,3])
//Start = cubes2 [25..60] //([3],[5])


/*
9.
Write a function that will take a list of Integers and 
will return a list of tuples (a,b) where b is every prime index of the given 
list and a is the value of the list at that index.
Ignore 1 as a prime.
*/
isPrime :: Int -> Bool
isPrime x
| x <= 1 = False
= isEmpty[n\\n<-[2..(x-1)]|x rem n == 0]

primeList :: [Int]
primeList = [x\\x<-[1..]|isPrime x]

OnlyPrimePosition::[Int]->[(Int,Int)]
OnlyPrimePosition list = [(list!!(i-1),i)\\i<-indices]
where
    len = length list
    indices = takeWhile ((>=)len) primeList
//Start=OnlyPrimePosition []//[]
//Start=OnlyPrimePosition [1,5,8]//[(5,2),(8,3)]
//Start=OnlyPrimePosition [1..19]//[(2,2),(3,3),(5,5),(7,7),(11,11),(13,13),(17,17),(19,19)]
//Start=OnlyPrimePosition [1,-5,4,3,6,-5,-7,9,-10]//[(-5,2),(4,3),(6,5),(-7,7)]


/*
10.
Write function to calculate n-th Tribonacci number. 
The nth Tribonacci number is defined by the equation:
T(n) = T(n-1) + T(n-2) + T(n-3)
With the starting parameters:
T(0) = 0, T(1) = 0, T(2) = 1
Your solution must be implemented efficiently via
tail recursion.
*/
T :: Int -> Int
T 0 = 0
T 1 = 0
T 2 = 1
T x
| x > 2 = TAux 0 0 1 x
= 0

TAux :: Int Int Int Int -> Int
TAux a b c n
| n > 3 = TAux b c (a+b+c) (n-1)
= c
//Start = T 1 // 0
//Start = T 10 // 44
//Start = T 20 // 19513
//Start = T 50 // 1697490356184
//Start = T 100 // 4130554068881925393


/*
11.
An m-digit Armstrong Number is a number which is equal to sum of digit’s m-th powers.
For example - 153 is a 3 digit Armstrong number: 153 = (1*1*1) + (5*5*5) + (3*3*3).
Write a function which finds the first n Armstrong Numbers
*/
armstrong :: Int -> [Int]
armstrong x = take x [n\\n<-[1..]|isArm n]

isArm :: Int -> Bool
isArm x = x == sum[n^m\\n<-list]
where
    list = intList x
    m = length list
//Start = armstrong 9 // [1,2,3,4,5,6,7,8,9]
//Start = armstrong 15 // [1,2,3,4,5,6,7,8,9,153,370,371,407,1634,8208]
//Start = armstrong 20 // [1,2,3,4,5,6,7,8,9,153,370,371,407,1634,8208,9474,54748,92727,93084,548834]
//Start = armstrong 21 // [1,2,3,4,5,6,7,8,9,153,370,371,407,1634,8208,9474,54748,92727,93084,548834,1741725]


/*
Test Vectors, for your convenience.*/
a = {x0 = 1, x1 = 2, x2 = 1}
b = {x0 = 3, x1 = 2, x2 = 3}
c = {x0 = 1.0, x1 = 2.0, x2 = 3.0}
d = {x0 = 2.5, x1 = 5.0, x2 = 7.5}
e = {x0 = 4.0, x1 = 5.0, x2 = 6.0}
f = {x0 = 5, x1 = 10, x2 = 5}

:: Vector3 a = {x0::a, x1::a, x2::a}
instance + (Vector3 a) | + a
where
    + x y = {x0 = x.x0 + y.x0, x1 = x.x1 + y.x1, x2 = x.x2 + y.x2}
instance - (Vector3 a) | - a
where
    - x y = {x0 = x.x0 - y.x0, x1 = x.x1 - y.x1, x2 = x.x2 - y.x2}
instance == (Vector3 a) | Eq a
where
    == x y = and[x.x0 == y.x0, x.x1 == y.x1, x.x2 == y.x2]

instance < (Vector3 a) | Ord, toReal a
where
    < x y = dx < dy
    where
        dx = (toReal x.x0)^2.0 + (toReal x.x1)^2.0 + (toReal x.x2)^2.0 
        dy = (toReal y.x0)^2.0 + (toReal y.x1)^2.0 + (toReal y.x2)^2.0 


/*
12.
Define the record type Vector3 taking type 'a'
and define its instances for +,-,Eq,Ord,Zero.
Ord should be defined as one Vector3 is smaller than
another Vector3 when their distance from the origin
is smaller.
Distance from origin of a vector (x0,x1,x2) can be
calculated by the square root of (x0^2 + x1^2 + x2^2)
Test Vectors and Operations.
a = <1,2,1>
b = <3,2,3>
Zero = <0,0,0>
a + b = <4,4,4>
a - b = <-2,0,-2>
a == b = False
a == a = True
a < b = True
a > b = False
*/

/*
13.
Using your defined Vector3 record, determine if two Vector3
are linearly dependent.
Two vectors are linearly dependent if multiplying every component
of one vector with a factor will give you the other vector.
For example:
<1, 2, 3> and <2.5, 5, 7.5> are linearly dependent by a factor of
2.5
Test Vectors and Results
<1.0,2.0,3.0> <4.0,5.0,6.0> = False
<1.0,2.0,3.0> <2.5,5.0,7.5> = True
*/

linearDependent :: (Vector3 Real) (Vector3 Real) -> Bool
linearDependent x y = a == b && b == c
where
    a = x.x0 / y.x0
    b = x.x1 / y.x1
    c = x.x2 / y.x2
//Start = linearDependent c d
/*
14.
One of the most important operations in Ray Tracing is calculating the determinant.
Calculate the determinant for two 3D vectors.
Additional Information:
Your three dimensional vector should be defined above as Vector3.
The determinant of two 3D vectors 'a' and 'b' can be calculated by:
x0 = (a.x1 * b.x2 - a.x2 * b.x1)
x1 = -1 * (a.x0 * b.x2 - a.x2 * b.x0)
x2 = (a.x0 * b.x1 - a.x1 * b.x0)
Test Vectors and Results
<1,2,1> x <3,2,3> = <4,0,-4>
<3,2,3> x <1,2,1>  = <-4,0,4>
<1,2,1> x <5,10,5> = <0,0,0>
*/
determinant3DVector :: (Vector3 Int) (Vector3 Int) -> (Vector3 Int)
determinant3DVector a b = {x0 = t, x1 = u, x2 = v}
where
    t = (a.x1 * b.x2 - a.x2 * b.x1)
    u = -1 * (a.x0 * b.x2 - a.x2 * b.x0)
    v = (a.x0 * b.x1 - a.x1 * b.x0)

//Start = determinant3DVector a f

/*
15.
For Ray Tracing, we can record the result as (Red, Green, Blue) or RGB values for every pixel in a file. The file extension is called ppm.
TASK: Create a 6x8 matrix of RGB tuples which holds the values for the flag of Hungary.

Requirement: Use list comprehension.
Hint: Partition the problem into three smaller 2x8 matrices, one for each color, and concatenate them in the end.

Additional Information:
a. RGB values vary from 0 to 255. Use simple color combination to create colors
Ex: RED = (255,0,0)
Ex: GREEN = (0,255,0)
Ex: WHITE = (255,255,255)
b. The Hungarian flag is divided into three equal horizontal rectangles, colored red, white and green, from top to bottom.

Expected result:
[[(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0)],
 [(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0)],
 [(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255)],
 [(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255)],
 [(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0)],
 [(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0)]]
*/
printHungarianFlag :: [[(Int, Int, Int)]]
printHungarianFlag = [[(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0)],
 [(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0),(255,0,0)],
 [(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255)],
 [(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255),(255,255,255)],
 [(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0)],
 [(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0),(0,255,0)]]