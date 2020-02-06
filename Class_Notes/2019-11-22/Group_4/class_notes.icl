module class_notes
import StdEnv

:: Tree a = Node a (Tree a) (Tree a) | Poop

boardTree :: (Tree Int)
boardTree = Node 5 (Node 2 (Node 1 Poop Poop) (Node 3 Poop (Node 4 Poop Poop))) (Node 14 (Node 9 (Node 7 Poop Poop) (Node 11 Poop (Node 13 Poop Poop))) (Node 20 (Node 17 Poop Poop) Poop ))

Start = boardTree