module trees_h

import StdEnv

// instances of ADT

:: Month = Jan | Feb | Mar | Apr | May

instance == Month
where
    (==) Jan Jan = True
    (==) Feb Feb = True
    (==) Mar Mar = True
    (==) Apr Apr = True
    (==) May May = True
    (==) _ _ = False 

instance + Month
    where
        (+) Jan Feb = Mar

add :: a a -> a | + a
add x y = x+y
// Start = Jan == Jan
// Start = add 1 2
// Start = add Jan Feb
// Start = May + Feb
// Start = isMember May [Jan, Feb, Mar]

// Trees

:: Tree a = Node a (Tree a) (Tree a) | Leaf

// Start = Node 1 Leaf Leaf

getNode :: (Tree a) -> a
getNode (Node x l r) = x
// Start = getNode (Node 1 (Node 0 (Node -1 Leaf) Leaf) (Node 5 Leaf Leaf))

getLeft :: (Tree a) -> (Tree a)
getLeft (Node x l r) = l

// Start = getLeft (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // (Node 0 (Node -1 Leaf Leaf) Leaf)

getRight :: (Tree a) -> (Tree a)
getRight (Node x l r) = r

// Start = getRight (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // (Node 0 (Node -1 Leaf Leaf) Leaf) // (Node 5 Leaf Leaf)

SumTree :: (Tree Int) -> Int
SumTree Leaf = 0
SumTree (Node x l r) = x + SumTree l + SumTree r

// Start = SumTree (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // (Node 0 (Node -1 Leaf Leaf) Leaf) // (Node 5 Leaf Leaf)

isLeaf :: (Tree a) -> Bool
isLeaf Leaf = True
isLeaf _ = False

// Get minimum of BST
getMin :: (Tree a) -> a
getMin (Node x l r) 
| isLeaf l = x
= getMin l

// Start = getMin (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // (Node 0 (Node -1 Leaf Leaf) Leaf) // (Node 5 Leaf Leaf)

reverseTree :: (Tree a) -> (Tree a)
reverseTree Leaf = Leaf
reverseTree (Node x l r) = (Node x (reverseTree r) (reverseTree l))

// Start = reverseTree (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // (Node 0 (Node -1 Leaf Leaf) Leaf) // (Node 5 Leaf Leaf)

getMax :: (Tree a) -> a
getMax t = getMin(reverseTree(t))

// Start = getMax (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // (Node 0 (Node -1 Leaf Leaf) Leaf) // (Node 5 Leaf Leaf)

addNode :: (Tree a) a -> (Tree a) | < a
addNode Leaf x = (Node x Leaf Leaf)
addNode t x
| x < (getNode t) = (Node (getNode t) (addNode (getLeft t) x) (getRight t))
| x > (getNode t) = (Node (getNode t) (getLeft t) (addNode (getRight t) x))
= t

// Start = addNode (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) 7

/*
Given a Tree with nodes of type Person,
return the number of people who are older than 18.
That is, people born on or before 2001.11.22
*/
::Person = { name::String
			,birthday::(Int,Int,Int)
	}

t1::Tree Person
t1 = Node {name = "hh", birthday = (2001,11,22)} Leaf Leaf
t2::Tree Person
t2 = Node {name = "hh", birthday = (2001,11,22)} (Node {name = "hr", birthday = (2001,11,21)} Leaf Leaf)(Node {name = "ht", birthday = (2001,11,23)} Leaf Leaf)
t3::Tree Person
t3 = Node {name = "hh", birthday = (2001,11,22)} (Node {name = "hr", birthday = (2001,11,21)} (Node {name = "hh", birthday = (2002,11,22)} Leaf Leaf) (Node {name = "hh", birthday = (1998,11,22)} Leaf Leaf))(Node {name = "ht", birthday = (2001,11,23)} Leaf Leaf)
//f2 :: (Tree Person) -> Int
//Start = f2 t2 //2
//Start = f2 t3  //3