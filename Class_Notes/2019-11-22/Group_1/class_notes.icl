module class_notes
import StdEnv

/*
Trees, Records. And more trees. Yay!
*/
:: Tree a = Node a (Tree a ) (Tree a)  | Poop
boardTree :: (Tree Int)
boardTree = Node 5 (Node 2 (Node 1 Poop Poop) (Node 4 (Node 3 Poop Poop) Poop)) (Node 14 (Node 9 (Node 7 Poop Poop) (Node 10 Poop Poop)) (Node 20 (Node 15 Poop Poop) Poop))

Start = boardTree