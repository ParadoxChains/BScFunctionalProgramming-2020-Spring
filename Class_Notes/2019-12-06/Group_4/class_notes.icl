module class_notes
import StdEnv

/*
A set of functions and types.

A set of functions with the same name but different operations
*/

func :: a -> a | +, one a
func x = x + one
//Start = func 4 //5
//Start = func 3.14 //4.14
//Start = func "Hello World "

//class Map (a -> b) a :: (a -> b) a -> b
class MyFunc someType :: someType -> someType

instance MyFunc Int 
where
    MyFunc x = x + 1
//Start = MyFunc 4 //5

instance MyFunc Real
where
    MyFunc x = (sqrt x)^3.0
//Start = MyFunc 3.14 //5.56409417605418

instance MyFunc String
where
    MyFunc x = x+++x
//Start = MyFunc "Hello World " //"Hello World Hello World "

class Ord a | instance < a
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