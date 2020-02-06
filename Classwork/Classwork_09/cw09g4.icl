module cw09g4
import StdEnv

/*
1. Check whether a binary search tree is a degenerate case
(
  Degenerate tree: All of its nodes (for simplicity, exclude leaves) formed a straight line
  Binary search tree: For every nodes, its left node value < its value < its right node value.
)
*/

//f1 :: (Tree a) -> Bool

// Start = f1 (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) Leaf) // True
// Start = f1 (Node 1 Leaf (Node 2 Leaf (Node 3 Leaf Leaf))) // True
// Start = f1 (Node 1 Leaf (Node 2 Leaf (Node 1 Leaf Leaf))) // False
// Start = f1 (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) // False

//2. Define rational class Q for rational numbers. Define instances for addition and multiplication

//Start = {nom=2, den=4} + {nom=5, den=6} // (Q 4 3)
//Start = {nom=2, den=4} * {nom=5, den=6}  // (Q 5 12)

/*
//3. Define abstract type PriorityQueue

:: Queue a :== [a]

newQueue :: (Queue a) // Creates empty queue 

isempty :: (Queue a) -> Bool // Checks if a queue is empty 

push :: a (Queue a) -> Queue a // add an item to the end of the queue 

pop :: (Queue a) -> (Queue a, a) | < a // Remove the biggest item from the queue 


PQ :: (Queue Int)
PQ = [1, 2, 3, 4, 5]
*/

//Start = isempty newQueue //True
//Start =  push 1 PQ //[1,2,3,4,5,1]
//Start =  pop PQ //([1,2,3,4,1], 5)