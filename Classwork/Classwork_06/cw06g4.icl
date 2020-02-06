module cw06g4
import StdEnv

// A Pythagorean triad is a triple of integers (a,b,c) such that
// a^2 + b^2 == c^2
// Count how many triads are there with 1<=a<=b<=c<=n.
// n is given as parameter
// Hint/Requirement: Use list comprehension
// Hint: To avoid three loops, check if a*a + b*b is perfect square, if yes increase count. 
// Also, you have to check that sqrt(a * a + b * b) <= n. No need to check sqrt(a * a + b * b)>=a,b, it is automatic. Think why.

// countAll :: Int -> Int

// Start = countAll 100 // 52
// Start = countAll 1442 // 1349
// Start = countAll 3134 // 3334

// You are given a point and triangle. Determine if point lies inside triangle.
// Hint: https://stackoverflow.com/questions/2049582/how-to-determine-if-a-point-is-in-a-2d-triangle
// You have to write records for Point and Triangle. Point should be represented as two Real coordinates x and y. 
// Triangle is represented as three Points a,b and c.

// isInside :: Point Triangle -> Bool

// Start = isInside {x = 0.0, y = 0.0} {a = {x = 1.0, y = 1.0}, b = {x = -1.0, y = 1.0}, c = {x = 0.0, y = -1.0}} // True
// Start = isInside {x = 3.0, y = 4.0} {a = {x = 1.0, y = 1.0}, b = {x = -1.0, y = 1.0}, c = {x = 0.0, y = -1.0}} // False
// Start = isInside {x = 0.0, y = 0.0} {a = {x = 0.0, y = 0.0}, b = {x = 0.0, y = 0.0}, c = {x = 0.0, y = 0.0}} // True
// Start = isInside {x = 0.0, y = 1.0} {a = {x = -1.0, y = 1.0}, b = {x = 1.0, y = 1.0}, c = {x = 1.0, y = 1.0}} // True
