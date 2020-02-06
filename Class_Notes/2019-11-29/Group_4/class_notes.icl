module class_notes
import StdEnv

/*
Abstract data types
are a way to make a special
type case. :)
*/
isEqualTo :: a a -> Bool | Eq a
isEqualTo x y = x == y

class Eq a :: a -> bool

instance Eq Int
where Eq x = True

instance Eq String
where Eq x = True

:: Age :== Real

:: Person = {name:: String, age::Age}

birthday :: Person -> Person
birthday p = {p&age=p.age+1.0}

addAge :: Person Age -> Person
addAge p n = {p&age=p.age+n}

getAge :: Person -> Age
getAge p = p.age

:: DoggyPile a :== [a]

concatLists :: [a] [a] -> [a]
concatLists a b = a ++ b
concatPiles :: (DoggyPile a) (DoggyPile a) -> (DoggyPile a)
concatPiles a b = a ++ b

instance toString (DoggyPile a) | toString, Eq a
where
    toString [] = ""
    toString [first:rest] = "x = "+++toString first +++"\n" +++ toString rest

// fst(a,b) = a
//fst3(a,b,c) = a
//fst4????

:: Quadruple a b c d :== (a,b,c,d)

fst4 :: (Quadruple a b c d) -> a 
fst4 (x,_,_,_) = x

//Start = fst4 ("fjeifjei",True,1, 4924.2515215)

:: Queue a :== [a]
:: Stack a :== [a]

stackToQueue :: (Stack a) -> (Queue a)
stackToQueue x = [n\\n<-x]

newStack :: (Stack a)
newStack = []

addElem :: (Stack a) a -> (Stack a)
addElem list elem = list ++ [elem]

inStack :: a (Stack a) -> Bool | Eq a 
inStack x stack = isMember x stack