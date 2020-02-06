module cw09g1
import StdEnv

/*
1. Check if a binary tree is an ordered and balanced tree
(balanced, the difference between the depth of left and right trees is at most 1)
(ordered, nodes on the left subtree < node < nodes on the right subtree)
*/
//f1 :: (Tree a) -> Bool


//Start = f1 (Node 26 (Node 24 Leaf Leaf) (Node 28 (Node 27 Leaf Leaf) Leaf)) //True
//Start = f1 (Node 26 (Node 24 Leaf Leaf) (Node 29 (Node 27 Leaf (Node 28 Leaf Leaf)) Leaf)) //False
//Start = f1 (Node 26 (Node 24 Leaf Leaf) (Node 29 (Node 27 Leaf Leaf) (Node 28 Leaf Leaf))) //False
//Start = f1 (Node 26 (Node 31 Leaf Leaf) (Node 28 (Node 27 Leaf Leaf) Leaf)) //False

//2. Define rational class Q for rational numbers. Define instances for addition and multiplication

//Start = {nom=2, den=4} + {nom=5, den=6} // (Q 4 3)
//Start = {nom=2, den=4} * {nom=5, den=6}  // (Q 5 12)


//3. Define an abstract type queue
/*
:: Queue a :==[a]

newQueue :: (Queue a) // Creates empty queue 


isempty :: (Queue a) -> Bool // Checks if a queue is empty 


enqueue :: a (Queue a) -> Queue a // add an item to the queue 


dequeue :: (Queue a) -> Queue a //Remove an item  from the queue 


peek :: (Queue a) -> a //Gets the element at the front of the queue
*/


//Start = isempty newQueue //True
//Start =  enqueue (1,2) (enqueue (6,5) (enqueue (0,9) newQueue)) //[(0,9),(6,5),(1,2)]
//Start =  peek (enqueue (1,2) (enqueue (6,5) (enqueue (0,9) newQueue))) //(0,9)
//Start =  dequeue (enqueue (6,5) (enqueue (0,9) newQueue)) //[(6,5)]