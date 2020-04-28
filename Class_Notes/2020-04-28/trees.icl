module trees
import StdEnv

/*
Today we will cover Trees, and Algebraic types.
*/

// :: Month = Jan | Feb | Mar | Apr | May

// func :: Month -> Int
// func x = 1

//Start = func BlahBlahBlah

// :: Date = {
//             day::Int,
//             month :: Int,
//             year :: Int
//           }

// :: Status a  = On a | Off

// checkStatus :: (Status a) -> String
// checkStatus (On x) = "This is On" +++ toString x
// checkStatus Off = "This is Off"

// p1 = On 
// p2 = Off
// p3 = On

// Start = checkStatus p1

/*
f x
| x==0 = doSomething

f 0 = doSomething
*/


:: Tree a = Node a (Tree a) (Tree a) | Leaf
//:: Tree = Node | Leaf
//:: Tree = Node Tree Tree | Leaf
//:: Tree a = Node a (Tree a) (Tree a) | Leaf | Nothing | Shit | Poop

//:: Tree = Node [Tree] | Leaf

/*
            8
         /    \
        6     12
       / \    / \
      3  7  10   L
     L 5 LL LL
*/
//binary search tree - B.S. Tree :D 
smallTree :: (Tree Int)
smallTree = Node 8 (Node 6 Leaf Leaf) (Node 12 Leaf Leaf)
//[6,8,12]

extractNode :: (Tree a) -> a
extractNode (Node x leftSubtree rightSubtree) = x
extractNode Leaf = abort "Leaf encountered\n"

//Start = smallTree //(Node 8 (Node 6 Leaf Leaf) (Node 12 Leaf Leaf))
//Start = extractNode smallTree //8
//Start = extractNode Leaf 

treeToList :: (Tree a) -> [a]
treeToList Leaf = []
treeToList (Node x l r) = (treeToList l) ++ [x] ++ (treeToList r)

//:: Tree a = Node a (Tree a) (Tree a) | Leaf
//Start = treeToList smallTree //[6,8,12]

ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))
//Start = ourTree

// Graphs > Tree 
// B Trees, B+ trees, B- trees, AVL trees, Rose trees
// Binary Trees > Binary Search Tree


//Add a new node to a BST
addNode :: a (Tree a) -> (Tree a) | Ord, Eq a
addNode n Leaf = (Node n Leaf Leaf)
addNode n (Node x l r)
| n == x = (Node x l r)
| n < x = addNode n l
| n > x = (Node x l (addNode n r))


