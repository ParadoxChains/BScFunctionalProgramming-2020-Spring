module hw05g1
import StdEnv

/*
Write a function which takes an integer and returns
True(boolean value) if the given number is a factorial
of some integer number
*/
//isFactorial::Int->Bool
//Start=isFactorial 34 //False
//Start=isFactorial 120 //True
//Start=isFactorial  1 //True
//Start=isFactorial -485//False

/*
Write a function which takes two positive integer numbers and
gives the greatest common divisor using only the Euclidean algorithm.
Definition for Euclidean algorithm : https://en.wikipedia.org/wiki/Euclidean_algorithm
Example : euclidGcd 60 48 will equal to 12
*/
//euclidGcd :: Int Int -> Int
//Start = euclidGcd 40320 181440 //20160
//Start = euclidGcd 60 24 //12
//Start = euclidGcd 210 -280 //70


/*
Write a function which takes a list of sublists of integers and
gives a list of tuples, every tuple should contain the minimum
and the maximum of the sublist.
Example : minMaxTuple [[1,2,3],[4,5,6]] this should output [(1,3),(4,6)]
Note : you have to use map or list comprehension.
Advice : Look up for predefined functions for minimum value
and maximum value finders.
Ignore empty lists.
*/
//minMaxTuple :: [[Int]] -> [(Int,Int)]
//Start = minMaxTuple [[4,3,5,6],[7,2,76,2,6],[2,4..24],[]] //[(3,6),(2,76),(2,24)]
//Start = minMaxTuple [[1],[2]] //[(1,1),(2,2)]
//Start = minMaxTuple [] //[]

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
