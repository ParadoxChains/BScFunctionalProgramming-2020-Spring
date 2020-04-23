module records

import StdEnv

// Records

// Basics

// Update operator


// Given three Vectors in 2D, decide if their endpoint lie on a same line.
// Hint1: Points are on a same line, if area of triangle formed by these points is 0.
// Hint2: https://www.dummies.com/education/math/algebra/finding-the-area-of-a-triangle-using-its-coordinates/
// :: Vector2 = {x :: Real, y :: Real}

// Start = collinear {x = 0.0, y = 0.0} {x = 1.0, y = 0.0} {x = 3.0, y = 0.0} // True
// Start = collinear {x = 0.0, y = 0.0} {x = 1.0, y = 0.0} {x = 3.0, y = 1.0} // False
// Start = collinear {x = 0.0, y = -1.0} {x = 2.0, y = 0.0} {x = 3.0, y = 0.0} // False


// You are given a point and triangle. Determine if point lies inside triangle.
// Hint: https://stackoverflow.com/questions/2049582/how-to-determine-if-a-point-is-in-a-2d-triangle
// You have to write records for Point and Triangle. Point should be represented as two Real coordinates x and y. 
// Triangle is represented as three Points a,b and c.

// isInside :: Point Triangle -> Bool

// Start = isInside {x = 0.0, y = 0.0} {a = {x = 1.0, y = 1.0}, b = {x = -1.0, y = 1.0}, c = {x = 0.0, y = -1.0}} // True
// Start = isInside {x = 3.0, y = 4.0} {a = {x = 1.0, y = 1.0}, b = {x = -1.0, y = 1.0}, c = {x = 0.0, y = -1.0}} // False
// Start = isInside {x = 0.0, y = 0.0} {a = {x = 0.0, y = 0.0}, b = {x = 0.0, y = 0.0}, c = {x = 0.0, y = 0.0}} // True
// Start = isInside {x = 0.0, y = 1.0} {a = {x = -1.0, y = 1.0}, b = {x = 1.0, y = 1.0}, c = {x = 1.0, y = 1.0}} // True

// Given three points, write a function which decides if a they form a
// Right Triangle (triangle which has three equal sides).
// :: Point = {x :: Real, y :: Real}

// f1::Point Point Point -> Bool

//Start = f1 p1 p2 p3 
// Start = f1 {x=(-4.0) , y=(-2.0)} {x=(-3.0) , y=(7.0)} {x=(4.0) , y=(-2.0)} //False
// Start = f1 {x=(0.0) , y=(3.0)} {x=(4.0) , y=(0.0)} {x=(0.0) , y=(0.0)} //True

// Given a list of distinct name and a list of grade. 2 lists have the same length
// Generate a list of Person corresponding to the name list
// the grades of all Person should be the average of the 2nd list.
// Hint: The record Person should contain at least `name` and `average grade`

// Generator :: [String] [Int] -> [Person]

// Start = Generator ["Evan", "Tringa"] [1, 4] // [(Person "Evan" 2.5), (Person "Tringa" 2.5)]
// Start = Generator ["Evan", "Tringa", "Viktoria"] [1, 4, 7] // [(Person "Evan" 4.0), (Person "Tringa" 4.0), (Person "Viktoria", 4.0)]


// Arrays

// Access & array comprehension

/*
Given an array of Int and a single Int, use array
comprehension to double each element of the array,
keeping only the multiples of the second Int argument.
*/
//f1 :: {Int} Int -> {Int}
//Start = f1 {1,2,3,4} 4 //{4,8}
//Start = f1 {3,4,5,7,2,9} 3 //{6,18}


/*
Implement a function that acts as 'foldr' for
arrays.
*/
//arrFold :: (a -> b -> b) b {a} -> b

// Start = arrFold (+) 0 {1,2,3,4,5} \\ 15
// Start = arrFold (++) [] {[1],[2],[3],[4]} \\ [1,2,3,4]