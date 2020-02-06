module cw06g1
import StdEnv

//  It is hypothesized that every even number greater than two can be expressed as the sum of two primes. 
//  For example, 4 = 2+2, 6 = 3+3, 8 = 3+5. 
//  Check if this is true for all even numbers in the range 4 to n? 
//  Hint/Requirement: Use list comprehension

// check :: Int -> Bool

// Start = check 1000 // True
// Start = check 100000 // True
// Start = check 500 // True
// Start = check 10 // True


// Given three Vectors in 2D, decide if their endpoint lie on a same line.
// Hint1: Points are on a same line, if area of triangle formed by these points is 0.
// Hint2: https://www.dummies.com/education/math/algebra/finding-the-area-of-a-triangle-using-its-coordinates/
// :: Vector2 = {x :: Real, y :: Real}
// collinear :: Vector2 Vector2 Vector2 -> Bool

// Start = collinear {x = 0.0, y = 0.0} {x = 1.0, y = 0.0} {x = 3.0, y = 0.0} // True
// Start = collinear {x = 0.0, y = 0.0} {x = 1.0, y = 0.0} {x = 3.0, y = 1.0} // False
// Start = collinear {x = 0.0, y = -1.0} {x = 2.0, y = 0.0} {x = 3.0, y = 0.0} // False
