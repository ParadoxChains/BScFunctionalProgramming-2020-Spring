module class_notes
import StdEnv

/*
Abstract data type is basically
redefining a specific type case.
*/

:: Age :== Real
instance == Age where == a b = abs(a) == abs (b)
:: Person = {name::String, age :: Age}

addAge :: Person Age -> Person
addAge p n = {p & age = p.age + n}

getAge :: Person -> Age
getAge p = p.age

birthday :: Person -> Person
birthday p = {p& age = p.age+1.0}

:: Date :== (String,Int)
instance toString Date
where
    toString (m,d) = "Month: "+++m+++" Day: "+++(toString d)
//Start = toString("January",5)

:: Stack a :== [a]

newStack :: (Stack a)
newStack = []

concatLists :: [a] [a] -> [a]
concatLists a b = a ++ b
concatStack :: (Stack a) (Stack a) -> (Stack a)
concatStack a b = a ++ b

:: Quadruple a b c d :== (a,b,c,d)
fst4 :: (Quadruple a b c d) -> a
fst4 (x,_,_,_) = x
rotate :: (Quadruple a b c d) -> (Quadruple b c d a)
rotate (a,b,c,d) = (b,c,d a)
//Start = fst4("fefe",True,123,0.3435)