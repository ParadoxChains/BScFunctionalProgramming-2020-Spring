module TreeReview
import StdEnv

/*
This is the standard definition of Binary Tree.
The Tree can be of a given type 'a'.
At each Node, it will contain a key value of type 'a',
and two subtrees, which are Trees of the same type 'a'.
*/
:: Tree a = Node a (Tree a) (Tree a) | Leaf
//:: RoseTree a = Node a [(RoseTree a)] | Leaf
//Below are some convenient trees to work with for
//exercises and testing.
ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))
//Start = ourTree

messyTree :: (Tree Int)
messyTree = Node 5(Node 12(Node 8 Leaf (Node 1 Leaf Leaf))(Node 6 (Node 9 Leaf Leaf) Leaf))(Node 2 (Node 3 Leaf (Node 13(Node 100 Leaf Leaf)(Node 21 Leaf Leaf)))(Node 40 (Node 60 (Node 70 (ourTree) Leaf) Leaf) Leaf))
//Start = messyTree

emptyTree :: (Tree Int)
emptyTree = Leaf

singleTree :: (Tree Int)
singleTree = Node 5 Leaf Leaf


dateTree :: (Tree Date)
dateTree = Node {year = 2000, day = 4, month=3} (Node {year=1999,month=5,day=1} Leaf Leaf) Leaf //(Node (Date 2000 4 3) (Node (Date 1999 1 5) Leaf Leaf) Leaf)

specialTree :: (Tree Int)
specialTree = Node 30 (Node 15 (Node 7 Leaf Leaf)(Node 22 (Node 17 Leaf Leaf)(Node 27 Leaf Leaf)))(Node 60 (Node 45 Leaf Leaf)(Node 75 Leaf Leaf))

//Start = dateTree

//Functions for a Binary Search Tree

//Getting the value at the node
getNode :: (Tree a) -> a
getNode (Node x l r) = x
//Start = getNode ourTree

//Going down left/right subtree
goL :: (Tree a) -> (Tree a)
goL (Node x l r) = l
goR :: (Tree a) -> (Tree a)
goR (Node x l r) = r
//Start = goL ourTree

//Checking if we're at a leaf
isLeaf :: (Tree a) -> Bool
isLeaf Leaf = True
isLeaf _ = False
//Start = isLeaf emptyTree

/*
isLeaf x
| x == Leaf = True
| x <> Leaf = False
*/


//Get a list of subtrees from a node.
getSubTrees :: (Tree a) -> [(Tree a)]
getSubTrees Leaf = []
getSubTrees (Node x l r) = (getSubTrees l) ++ [l] ++ [r] ++ (getSubTrees r)
//Start = getSubTrees ourTree

//Get the min value of a BST
minTree :: (Tree a) -> a
// minTree (Node x l r) 
// | isLeaf l = x
// = minTree l

minTree (Node x Leaf _) = x
minTree (Node _ l _) = minTree l

// minTree t
// | isLeaf (goL t) = getNode t 
// = minTree (goL t)
//Start = minTree ourTree

//Reverse a tree
reverseTree :: (Tree a) -> (Tree a)
reverseTree Leaf = Leaf
reverseTree (Node x l r) = (Node x (reverseTree r) (reverseTree l))
// reverseTree t 
// | isLeaf t = Leaf
// = (Node (getNode t) (reverseTree(goR t)) (reverseTree(goL t)))
//Start = reverseTree ourTree

//Get the max value of a BST
maxTree :: (Tree a) -> a
maxTree t = minTree(reverseTree t)
//Start = maxTree ourTree


//Extract sublists countaining a specific element

//Start = extractSubLists 3 ourTree

//Get a list of children of a node
// getChildren n Leaf = []
// getChildren n (Node x Leaf Leaf) = []
// getChildren n (Node x l r)
// | x == n = [getNode l, getNode r]
// | x < n = getChildren n l 
// | x > n = getChildren n r
// Start = getChildren 15 specialTree 

//Get the parent of a node

//Start = findParent 13 ourTree
//Start = findParent 15 ourTree
//Start = findParent 19 ourTree

//Check if a Binary Tree is actually a BST

//Start = checkBST ourTree
//Start = checkBST messyTree

//Add a new node to a BST

//newTree = addNode 17 ourTree
//Start = newTree

//Remove the minimum node of a binary search tree

//Start = remMin ourTree

//Remove the root of a binary search tree

//Start = remRoot ourTree

//Filter a binary search tree

//Start =  filterTree isEven (levelBalance [1..10])


//Make a list from a BST
treeToList :: (Tree a) -> [a]
treeToList Leaf = []
treeToList (Node x l r) = (treeToList l) ++ [x] ++ (treeToList r) 
//Start = treeToList specialTree //[7,15,17,22,27,30,45,60,75]

isNodeInTree :: a (Tree a) -> Bool | Eq a
isNodeInTree n t = isMember n (treeToList t)

//Start = isNodeInTree 69 specialTree

//Make a BST from a list

//Start = listToTree [4,2,6,5,23,7]

//Reorganize a messy tree into a BST

//Start = reorganize messyTree

//Find min of a messy tree

//Start = minMess messyTree

//Find max of a messy tree

//Start = maxMess messyTree

//Create a level balanced Binary search tree from a list
levelBalance [] = Leaf
levelBalance list = (Node midNode (levelBalance leftList) (levelBalance rightList))
where 
    sortedList = sort (removeDup list)
    len = length sortedList
    midNode = sortedList!!(len/2)
    leftList = take (len/2) sortedList
    rightList = drop ((len/2) + 1) sortedList
//Start = levelBalance [5,2,4,9,6,8,7,1,3] //(Node 5 (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) (Node 4 Leaf Leaf)) (Node 8 (Node 7 (Node 6 Leaf Leaf) Leaf) (Node 9 Leaf Leaf)))
//Start = levelBalance [4,5,8,1,7,5,2,8,1,7,9,3,5,7,2,4,6,2,7,8,4]


:: Date = { year :: Int,  month :: Int, day :: Int}

//create an instance of ordering for Date

instance < Date
where
    (<) d1 d2 = d1.year < d2.year || (d1.year == d2.year) && (d1.month < d2.month) || (d1.year==d2.year) && (d1.month==d2.month) && (d1.day < d2.day)

instance toString Date
where
    toString {year=y, month=m, day=d} = "Year=" +++ toString y +++ " Month=" +++ toString m +++ " Day=" +++ toString d

date1 = {year = 2000, month=1, day=3}
date2 = {year = 2001, month=1, day=4}
date3 = {year = 2001, month=2, day=3}
date4 = {year = 2001, month=2, day=4}

//Start = date4 < date2
dateTree2 = Node date3 (Node date1 Leaf (Node date2 Leaf Leaf)) (Node date4 Leaf Leaf)

//Start = dateTree2
earliestDate :: (Tree Date) -> String
earliestDate (Node x Leaf _) = toString x
earliestDate (Node _ l _) = earliestDate l 

//Start = earliestDate dateTree2