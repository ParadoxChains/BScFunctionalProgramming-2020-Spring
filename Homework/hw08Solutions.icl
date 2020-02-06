module hw08Solutions
import StdEnv

:: Tree a = Node a (Tree a) (Tree a) | Leaf
:: Yggdrasil a b c = Core a (Tree b) {c}

ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))

oddTree :: (Tree Int)
oddTree = (Node 7 (Node 3 (Node 1 Leaf Leaf) (Node 5 Leaf Leaf)) (Node 11 (Node 9 Leaf Leaf) Leaf))

flow1 :: (Yggdrasil ([Bool] -> Bool) Int (Int -> Bool))
flow1 = Core and ourTree {isEven, ((<)10)}


flow2 :: (Yggdrasil ([Bool] -> Bool) Int (Int -> Bool))
flow2 = Core or oddTree {((<)10),((==)1),(\x = and[x rem n <> 0\\n<-[2..(x-1)]])}

/*
Write an instance of equality (==) between two Trees,
such that we can use calls such as treeA == treeB.
*/
instance == (Tree a) | Eq a
where
    == Leaf Leaf = True
    == Leaf _ = False
    == _ Leaf = False
    == a b = x==y && (goL a) == (goL b) && (goR a) == (goR b)
    where
        getNode (Node x _ _) = x
        x = getNode a
        y = getNode b
        goL (Node _ l _) = l
        goR (Node _ _ r) = r

//Start = ourTree == ourTree //True
//Start = ourTree == oddTree //False
//Start = isMember ourTree [ourTree, oddTree, Leaf] //True

/*
Write a function that will take the data constructs
and apply the array of conditions in the array portion,
and apply it with the boolean aggregator function (first portion)
to every element of the tree (second portion),
returning a list of elements that return True after processing.

For example:
Given a data construct of Core or someTree {cond1,cond2,cond3,cond4},
then return a list of elements from someTree, given that they return
True for one or more (the 'or' function) of the conditions from the
array (cond1, cond2, etc...).

Hint: Arrays are easier handled as lists for some operations.
*/
flowApp :: (Yggdrasil ([Bool] -> Bool) Int (Int -> Bool)) -> [Int]
flowApp (Core _ Leaf _ ) = []
flowApp (Core agg tree condArr)
| condApp (getNode tree) = sort ( [getNode tree] ++ (flowApp (Core agg (goL tree) condArr)) ++ (flowApp (Core agg (goR tree) condArr)) )
= sort ( (flowApp (Core agg (goL tree) condArr)) ++ (flowApp (Core agg (goR tree) condArr)) )
where
    condApp elem = agg[cond elem\\cond<-:condArr]
    getNode (Node x _ _) = x
    goL (Node _ l _) = l
    goR (Node _ _ r) = r

//Start = flowApp flow1 //[18,20,24,26,28]
//Start = flowApp flow2 //[1,3,5,7,11]

/*
Write a function that checks if a String is a palindrome or not.

Hint: Strings are just arrays. ;)
*/
palindrome :: String -> Bool
palindrome x = lol == reverse lol
where
    lol = [a\\a<-:x]
//Start = palindrome "racecar" //True
//Start = palindrome "amanaplanacanalpanama" //True
//Start = palindrome "boobytrap" //False
