module lastclass
import StdEnv

/*
Today we will cover:
    - Arrays/String
    - Type Aliasing
    - Instances
*/

//Start = "Last Practice class!"

something :: {Int}
something = {1,2,3,4,5}

//Start = something.[2] //gets us the index 2 element

//with an array you can not use .. constructor

//Start = {1,3..5} //does not work

//Start = something
//Start :: {Int}
//Start = {1,2,3,4,5}

//arrays can not use the : constructor
//[a:b]  [a,b,c:d]

//arrays CAN use the , constructor and the \\ constructor

blah :: {Int}
blah = {x \\ x<-[1..100] | isOdd x}

//Start = blah

lol :: {Int}
lol = {x \\x <-: blah  | x>50 }

//Start = size lol

//[1,2,3,4,5]
//{1,2,3,4,5}

//string is actually #{Char}

myName = "Evan"

initial :: String -> Char
initial x = x.[0]

//Start = initial myName //'E'

//Start = size myName

reverseString :: String -> String
reverseString x = result
where
    l = [ elem  \\ elem <-: x ] //built a list from an array
    m = reverse l 
    result = { elem \\ elem <- m} //construct an array from a list

//Start :: String
//Start = reverseString myName

//given an array of strings, filter out the ones that are palindromes
myArr :: {String}
myArr = {"racecar","hello","mmmmmmmmmmmmmmmmmmmmmmm","blah",""}

//Start = myArr.[1].[(size myArr.[1])-1]

isPal :: String -> Bool
isPal x = l == reverse l
where
    l = [e\\e<-:x]

//Start = isPal "racecar"
palList :: {String} -> {String}
palList myArr = { aString \\ aString <-:myArr  | isPal aString && size aString < 10 && size aString > 0}

// not(isPal x) == (not o isPal) x

//Start = palList myArr

isPalindrome :: Int -> Bool
isPalindrome x = l == reverse l
where
    arr = toString x
    l = [e\\e<-:arr]

//Start = isPalindrome 123454321

numDigits :: Int -> Int
numDigits x = size (toString x)

//Start = numDigits 23456789


:: MyType :== Int

func :: MyType -> MyType
func x = inc x

func2 :: MyType -> Bool
func2 x = x > zero

y :: MyType
y = 3456789

//Start = func2 2.0

//Start = numDigits y

:: StupidType :== (Int,String)

func3 :: StupidType -> String
func3 (a,b) = b

//Start = func3 (4567,"hello")

:: MyListType a :== [a]

myReverse :: (MyListType a) -> (MyListType a)
myReverse x = reverse x

//String :== #{Char}

:: Date = {day::Int, month :: Int, year :: Int}

daya :: Date
daya = {day = 1, month = 1, year = 2000}

dayb :: Date
dayb = {day = 1, month = 1, year = 2000}

dayc :: Date
dayc = {day = 3, month = 1, year = 2000}

listodays :: [Date]
listodays = [daya,dayb,dayc]

(equals) :: Date Date -> Bool
(equals) {day = d1, month = m1, year = y1} {day = d2, month = m2, year = y2} = and[ d1==d2, m1==m2, y1==y2 ]

instance == Date
where
    (==) {day = d1, month = m1, year = y1} {day = d2, month = m2, year = y2} = and[ d1==d2, m1==m2, y1==y2 ]

instance < Date
where
    (<) {day = d1, month = m1, year = y1} {day = d2, month = m2, year = y2} = or[ y1<y2, y1==y2 && m1<m2, y1==y2 && m1==m2 && d1<d2 ]

//Start = daya equals dayb
//Start = isMember daya listodays
//Start = sort listodays
//Start = daya == dayc
//Start = daya >= dayc

/*
class Ord a | < a
where
	/**
	 * Greater than.
	 * 
	 * @result True iff the first value is strictly greater than the second value.
	 */
	(>) infix 4 :: !a !a -> Bool | Ord a
	(>) x y :== y < x

	/**
	 * Smaller than or equal to.
	 * 
	 * @result True iff the first value is smaller than or equal to the second value.
	 */
	(<=) infix 4 :: !a !a -> Bool | Ord a
	(<=) x y :== not (y < x)

	/**
	 * Greater than or equal to.
	 * 
	 * @result True iff the first value is greater than or equal to the second value.
	 */
	(>=) infix 4 :: !a !a -> Bool | Ord a
	(>=) x y :== not (x < y)

	/**
	 * The minimum of two values.
	 */
	min :: !a !a -> a | Ord a
	min x y :== case (x < y) of
		True -> x
		_ -> y

	/**
	 * The maximum of two values.
	 */
	max :: !a !a -> a | Ord a
	max x y :== case (x < y) of
		True -> y
		_ -> x

class PlusMin a | + , - , zero a

class + a
where
	/**
	 * Add `arg1` to `arg2`.
	 */
	(+) infixl 6 :: !a !a -> a

instance + a 
where
    (+) x y = irjrghtiegtoirgtnhi

2 + 3 - 4 / 6 ^ 2 - - 4

NOT CLEAN SYNTAX 
(a/b)  (c/d)  =  a*d == b*c
*/


