module class_notes
import StdEnv

/*
Class of functions or a class of types.
*/

func :: a -> a | one, + a
func x = x + one
//Start = func 4 //5
//Start = func 3.14 //4.14
//Start = func "Hello World!"

//class Map (a->b) a :: (a->b) a -> b
class MyFunc someType :: someType -> someType
instance MyFunc Int 
where
    MyFunc x = x + 1
//Start = MyFunc 4 //5
instance MyFunc Real
where
    MyFunc x = (sqrt x )^3.0
//Start = MyFunc 3.14 //5.56409417605418
instance MyFunc String
where
    MyFunc x = x +++ x
//Start = MyFunc "Hello World " //"Hello World Hello World "


/*sumTuple :: (a,a) (a,a) -> (a,a) | + a
sumTuple (a,b) (c,d) = (a+c,b+d)*/

