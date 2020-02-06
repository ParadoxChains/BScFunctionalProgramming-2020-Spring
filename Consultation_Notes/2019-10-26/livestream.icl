module livestream
import StdEnv

/*
funcA :: [Int] -> [Int]
funcA x = x

Start = (funcA 3)!!1
*/

//Start = funcB []
//Start rule can not be overriden.

//Start = sum reverse [1..10]
//        sum   arg1   arg2
/*
Type error [livestream.icl,12,Start]: near funcB : cannot unify demanded type with offered type:
 [v1] -> v2
 [Int]
*/

/**
  * 40 pts
  * Write a function that takes a predicate (a -> Bool function) and
  * a list of sublists of integers and returns the sum of all elements that
  * return True on both  or one of the two predicates depending on
  * the given parameter "or"/"and".
  */
/*
FilterSum :: (Int -> Bool) String (Int -> Bool) [[Int]] -> Int
FilterSum pred1 "and" pred2 list = FilterSumAux pred1 and pred2 list
FilterSum pred1 "or" pred2 list = FilterSumAux pred1 or pred2 list

FilterSumAux :: (Int -> Bool) ([Bool]->Bool) (Int -> Bool) [[Int]] -> Int
FilterSumAux pred1 op pred2 list = [x\\x<-list| op[pred1 x ,pred2 x]]*/
//Start = filter isEven [1..10]
//Start = [x\\x<-[1..10]|isEven x]
//Start = [x\\x<-[1..10]| isEven x && ((<)4) x ]
//Start = [x\\x<-[1..10]| and[isEven x, ((<)4) x] ]  //a && b -> and[a,b]
//Start = [x\\x<-[1..10]|isEven x || ((<)4) x]
//Start = [x\\x<-[1..10]| or[isEven x ,((<)4) x]] //a || b -> or[a,b]

//Start = FilterSum isEven "or" ((<) 3) [[1..5],[-2..10]] //60
//Start = FilterSum ((<)10) "and" (\x=isEmpty[div\\div<-[2..(x-1)]|x rem  div == 0]) [[1..20],[90..100],[1..10]] //157
//Start = FilterSum isOdd "or" isEven []//0

:: MyRec a b c = { x :: Int, y :: Real, z :: a}

:: Person myType = { firstName :: String, surname :: String, age :: Int, birthdate :: (Int,Int), isDead :: Bool, extra :: myType}

//Start = {firstName = "Evan", surname = "Sitt", age = 1, birthdate = (12,9), isDead = True, extra = "defenestrate"}

Evan :: (Person Int)
Evan = {firstName = "Evan", surname = "Sitt", age = 1, birthdate = (12,9), isDead = True, extra = 42}
Hossam :: (Person Int)
Hossam =  {firstName = "Hossam", surname = "Abdin", age = 69, birthdate = (1,1), isDead = False, extra = 8}
Viktoria :: (Person Int)
Viktoria = {firstName = "Viktoria", surname = "Zsok", age = 58, birthdate = (6,6), isDead = True, extra = 3}
//Start = Evan

//Start = Evan == Evan
//Start = Evan <> Hossam
(samePerson) :: (Person a) (Person b) -> Bool
(samePerson) p1 p2 = p1.firstName == p2.firstName && p1.surname == p2.surname && p1.birthdate == p2.birthdate

//Start =  Evan samePerson Evan
instance == (Person a) where == p1 p2 = p1.firstName == p2.firstName && p1.surname == p2.surname && p1.birthdate == p2.birthdate

//Start = isMember Evan [Evan,Hossam]
//Start = sort [Evan,Hossam,Viktoria]
instance < (Person a) where < p1 p2 = p1.age < p2.age

//Start = Evan + Hossam - Viktoria
//Start = Evan - Hossam
//instance + (Person a) | + a where + p1 p2 = {firstName = p1.firstName, surname = p1.surname, age = p1.age + p2.age, birthdate = p1.birthdate, isDead = p1.isDead || p2.isDead, extra = p1.extra + p2.extra}
instance + (Person a) | + a where + p1 p2 = {p1 & age = p1.age + p2.age, isDead = p1.isDead || p2.isDead, extra = p1.extra + p2.extra}
instance - (Person a) | - a where - p1 p2 = {p1 & age = p1.age - p2.age, isDead = p1.isDead && p2.isDead, extra = p1.extra - p2.extra}
instance zero (Person a) | zero a where zero = {firstName = "John", surname = "Doe", age = 0, birthdate = (0,0), isDead = True, extra = zero}

//Start = sum[Evan,Hossam,Viktoria]

sumTriple :: (Int,Int,Int,Int,Int) -> Int
//sumTriple x = fst3 x + snd3 x + thd3 x //pain in the butt and messy code
sumTriple (a,b,c,d,e) = a + b + c + d + e //make life nice for yourself.

//Start = sumTriple (1,2,3,4,5)

:: Fraction = { num :: Int, den :: Int}

addFraction :: Fraction Fraction -> Fraction
//addFraction p q = {num = ( p.num*q.den + q.num*p.den ), den= (p.den * q.den)} //pain in the absolute BUTT to read and debug and omg messy as hell and long to type.
addFraction p q = {num = (a*d + b*c), den = (b*d)} //easier to read easier to debug life is nice <3
    where
    a = p.num
    b = p.den
    c = q.num
    d = q.den

// a/b + c/d = (a*d + b*c)/(b*d)
half :: Fraction
half = {num = 1, den = 2}
third :: Fraction
third = {num = 1, den = 3}

//Start = addFraction half third