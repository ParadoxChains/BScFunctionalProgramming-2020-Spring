module hw05g4
import StdEnv

/*
Write a function that will take a predicate (Int->Bool),
a function (Int->Int), and a list of integers which applies
the function (Int->Int) only to the elements of the list
that satisfy the predicate (Int->Bool), 
and replace the other numbers with 0's.
*/
//applyFunOnSomeElements:: (Int->Bool) (Int->Int) [Int]->[Int]
//Start=applyFunOnSomeElements isEven inc [1..10]//[0,3,0,5,0,7,0,9,0,11]
//Start=applyFunOnSomeElements ((<)0) (\x=x^2) [-4..8]//[0,0,0,0,0,1,4,9,16,25,36,49,64]
//Start=applyFunOnSomeElements ((<)0) (\x=x^2) []//[]

/*
Write a function which takes a number and gives a list of the
proper divisors for this number.
Definition for proper divisor : A proper divisor of a positive
integer n is any divisor of n other than n itself. Thus, 
prime numbers have exactly one proper divisor, 1, and every
other number has at least two proper divisors.
Example : propDiv 6 will equal to [1,2,3] 
*/
//propDiv :: Int -> [Int]
//Start = propDiv 10 //[1,2,5]
//Start = propDiv (1*2*3*5*7*11*13) //[1,2,3,5,7,11,13]
//Start = propDiv 0 //[]
//Start = propDiv -457457 //[]
//Start = propDiv 1 //[]

/*
Write a function which takes two lists of integers 
and returns a list of tuples (a,b) where 
a is element of the first list and b is element of the 
second list and a and b are realtively prime numbers 
(All the posible pairs should be listed)
*/
//allCombinations::[Int] [Int] ->[(Int,Int)]
//Start=allCombinations [2,4..12] [80,84..100]//[]
//Start=allCombinations [1..5] [2..7]  
//[(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,3),(2,5),(2,7),(3,2),(3,4),(3,5),(3,7),(4,3),(4,5),(4,7),(5,2),(5,3),(5,4),(5,6),(5,7)]
//Start=allCombinations [1,1,1,1,1] [0,0,0,0] //[(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0),(1,0)]
//Start=allCombinations [1,4,5,3,46,3,34] [2,8,6,68,5,33,1] 
//[(1,2),(1,8),(1,6),(1,68),(1,5),(1,33),(1,1),(4,5),(4,33),(4,1),(5,2),(5,8),(5,6),(5,68),(5,33),(5,1),(3,2),(3,8),(3,68),(3,5),(3,1),(46,5),(46,33),(46,1),(3,2),(3,8),(3,68),(3,5),(3,1),(34,5),(34,33),(34,1)]

:: Vector2 a = {v0 :: a, v1 :: a}

instance ==   (Vector2 a) | == a   where == vector0 vector1	= vector0.v0 == vector1.v0 && vector0.v1 == vector1.v1

instance zero (Vector2 a) | zero a where zero	= {v0 = zero, v1 = zero}

instance one  (Vector2 a) | one a  where one 	= {v0 = one, v1 = one}

instance ~    (Vector2 a) | ~ a    where ~ vector0	= {v0 = ~vector0.v0, v1 = ~vector0.v1}

instance +    (Vector2 a) | + a    where + vector0 vector1	= {v0 = (vector0.v0 + vector1.v0), v1 = (vector0.v1 + vector1.v1)}

instance -    (Vector2 a) | - a    where - vector0 vector1	= {v0 = (vector0.v0 - vector1.v0), v1 = (vector0.v1 - vector1.v1)}

instance *    (Vector2 a) | * a    where * vector0 vector1	= {v0 = (vector0.v0 * vector1.v0), v1 = (vector0.v1 * vector1.v1)}

instance /    (Vector2 a) | / a    where / vector0 vector1	= {v0 = (vector0.v0 / vector1.v0), v1 = (vector0.v1 / vector1.v1)}

//Start	= {v0 = 5, v1 = 6} + one //(Vector2 6 7)


:: Vector3 a = {x0 :: a, x1 :: a, x2 :: a}

/*
Implement instances : zero, one, ~, +, -, *, /  for the Vector3 type( you can refer to Vector2)
 e.g. instance ==   (Vector3 a) | == a   where == vector0 vector1	= vector0.x0 == vector1.x0 && vector0.x1 == vector1.x1 && vector0.x2 == vector1.x2
*/
instance ==   (Vector3 a) | == a
instance zero (Vector3 a) | zero a
instance one  (Vector3 a) | one a
instance ~    (Vector3 a) | ~ a
instance +    (Vector3 a) | + a
instance -    (Vector3 a) | - a
instance *    (Vector3 a) | * a
instance /    (Vector3 a) | / a

/*
Use mathematical knowledge related to vector dot product to implement the following function:
*/
Vec3dotProduct :: (Vector3 a) (Vector3 a) -> a  | *,+ a

//Start = Vec3dotProduct {x0 = 1.5, x1 = 2.6, x2 = 3.0} {x0 = 5.0, x1 = 2.6, x2 = 4.5} //27.76 

/*
Use mathematical knowledge related to vector cross product to implement the following function:
*/
Vec3crossProduct ::  (Vector3 a) (Vector3 a) ->  (Vector3 a) | *,-a

//Start = Vec3crossProduct {x0 = 1.5, x1 = 2.6, x2 = 3.0} {x0 = 5.0, x1 = 2.6, x2 = 4.5} //(Vector3 3.9 8.25 -9.1)
