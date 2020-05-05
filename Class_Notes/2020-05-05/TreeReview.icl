module TreeReview
import StdEnv

/*
This is the standard definition of Binary Tree.
The Tree can be of a given type 'a'.
At each Node, it will contain a key value of type 'a',
and two subtrees, which are Trees of the same type 'a'.
*/

//Below are some convenient trees to work with for
//exercises and testing.
ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))
//Start = ourTree

messyTree :: (Tree Int)
messyTree = Node 5(Node 12(Node 8 Leaf (Node 1 Leaf Leaf))(Node 6 (Node 9 Leaf Leaf) Leaf))(Node 2 (Node 3 Leaf (Node 13(Node 100 Leaf Leaf)(Node 21 Leaf Leaf)))(Node 40 (Node 60 (Node 70 (ourTree) Leaf) Leaf) Leaf))
//Start = messyTree

//Functions for a Binary Search Tree

//Getting the value at the node

//Going down left/right subtree

//Checking if we're at a leaf

//Get a list of subtrees from a node.

//Start = getSubTrees ourTree

//Get the min value of a BST

//Start = minTree ourTree

//Reverse a tree

//Start = reverseTree ourTree

//Get the max value of a BST

//Start = maxTree ourTree

//Create a list of all subtrees

//Start = subTreeList ourTree 

//Extract sublists countaining a specific element

//Start = extractSubLists 3 ourTree

//Get a list of children of a node

//Start = getChildren 20 ourTree

//Get the parent of a node

//Start = findParent 13 ourTree
//Start = findParent 15 ourTree
//Start = findParent 19 ourTree

//Check if a Binary Tree is actually a BST

//Start = checkBST ourTree
//Start = checkBST messyTree

//Add a new node to a BST

newTree = addNode 17 ourTree
//Start = newTree

//Remove the minimum node of a binary search tree

//Start = remMin ourTree

//Remove the root of a binary search tree

//Start = remRoot ourTree

//Filter a binary search tree

//Start =  filterTree isEven (levelBalance [1..10])


//Make a list from a BST

//Start = treeToList newTree

//Make a BST from a list

//Start = listToTree [4,2,6,5,23,7]

//Reorganize a messy tree into a BST

//Start = reorganize messyTree

//Find min of a messy tree

//Start = minMess messyTree

//Find max of a messy tree

//Start = maxMess messyTree

//Create a level balanced Binary search tree from a list

//Start = levelBalance [5,2,4,9,6,8,7,1,3]
//Start = levelBalance [4,5,8,1,7,5,2,8,1,7,9,3,5,7,2,4,6,2,7,8,4]