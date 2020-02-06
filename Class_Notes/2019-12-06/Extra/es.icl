module es
import StdEnv

// Solve as many functions as you can. Each exercise is of 10%, to pass min. 40% is necessary.
// marks: 40%-2,60%-3,80%-4,100%-5. 
//1.
//Define a tree type and use the followings for testing your solution.
:: Tree a = Node a (Tree a) (Tree a) | Leaf
//tree1 = Node 10 (Node 7 (Node 3 Leaf Leaf) (Node 15 Leaf Leaf)) (Node 5 Leaf (Node 10 Leaf Leaf))
//tree2 = Node 9 (Node 1 (Node 0 (Node 7 Leaf Leaf) Leaf) (Node 15 Leaf Leaf)) (Node 4 (Node 4561 Leaf Leaf) (Node 8 (Node 1663 Leaf Leaf) Leaf))
//unitTree = Node 1337 Leaf Leaf
//noTree = Leaf



//Write a function that takes a tree as a parameter and returns a list of nodes which have at least one prime child.
//An empty tree will return [].
//primeChildren :: (Tree Int) -> [Int]
//Start = primeChildren tree1 //[10,7]
//Start = primeChildren tree2 //[0,4,8]
//Start = primeChildren unitTree //[]
//Start = primeChildren noTree //[]

//2.
//Given a tuple of arrays, representing sets of integers, return a list containing the result of their symmetric-difference.
//The symmetric-difference between two sets is equivalent to the difference between their union and their intersection.
//symmetricDiff :: ({Int}, {Int}) -> [Int]
//Start = symmetricDiff ({1,2,3,4},{3,4,5,6}) //[1,2,5,6]
//Start = symmetricDiff ({1,2,3,4},{-2,-4,13,0}) //[1,2,3,4,-2,-4,13,0]
//Start = symmetricDiff ({1,2,3,4},{1,2,3,4}) //[]
//Start = symmetricDiff ({1,2,3,4},{}) //[1,2,3,4]
//Start = symmetricDiff ({},{1,2,3,4}) //[1,2,3,4]
//Start = symmetricDiff ({},{}) //[]

//3.
//Define a Q type for rational numbers.
//Write a function that receives two fractions and calculates their division. Simplify the fraction before returning.
//In case the numinator is zero, set the denuminator to zero as well.
//fracDivision :: Q Q -> Q
//Start = fracDivision {num=5, den=1} {num=6, den=5} //{num=25, den=6}
//Start = fracDivision {num=10, den=2} {num=3, den=4} //{num=20, den=3}
//Start = fracDivision {num=0, den=2} {num=100, den=4} //{num=0, den=0}
//Start = fracDivision {num=15, den=2} {num=3, den=12} //{num=30, den=1}

half = { num=1, den=2 }
third = { num=1, den=3 }
fourth = { num=1, den=4 }
fifth = { num=1, den=5 }
sixth = { num=1, den=6 }
threehalf = { num=3, den=2 }
twothird = { num=2, den=3 }
ninefourth = { num=9, den=4 }
threefifth = { num=3, den=5 }

miniTree = Node fifth (Node sixth Leaf Leaf)(Node third (Node fourth Leaf Leaf) Leaf)			
smallTree = Node half (Node fourth Leaf Leaf) (Node ninefourth Leaf Leaf)
bigTree = Node half (Node fifth (Node sixth Leaf Leaf)(Node third (Node fourth Leaf Leaf) Leaf))(Node threehalf (Node threefifth Leaf (Node twothird Leaf Leaf))(Node ninefourth Leaf Leaf))
badTree = Node third (Node fourth Leaf Leaf)(Node ninefourth (Node sixth Leaf Leaf) Leaf)

//4.
//Write a function that will return the sum of a tree's nodes.
//Return the sum as a simplified Q.

:: Q = { num :: Int, den :: Int}

simplify :: Q -> Q
simplify x
| x.den == 0 = abort "div by zero"
//| x.den < 0 = simplify {num = -1 * n, den = -1 * g}
= {num = n/g, den = d/g}
where
    n = x.num
    d = x.den
    g = abs(gcd n d) 

//Start = simplify {num = 4, den = -2}


instance + Q
where
    + a b = simplify{num = (a.num*b.den) + (b.num*a.den), den = a.den * b.den}

instance zero Q where zero = {num = 0, den = 1}
sumTree :: (Tree Q) -> Q
sumTree Leaf = {num=0,den=1}
sumTree (Node x l r) = x + sumTree l + sumTree r
//Start = sumTree smallTree //{num=3,den=1}
//Start = sumTree bigTree //{num=97,den=15}
//Start = sumTree miniTree //{num=19, den=20}

//5.
//Write a function that will check if a tree of Q is a Binary Search Tree.
instance == Q
where
    == a b = a.num*b.den == b.num*a.den
    where
        x = simplify a
        y = simplify b
instance < Q
where
    < a b = (a.num * b.den) < (b.num * a.den)


//Start = oneHalf < ninefourth

checkTree :: (Tree Q) -> Bool
checkTree t = checkBST t
//checkTree t = x == sort x
where
    x = treeToList t
//Check if a Binary Tree is actually a BST
checkBST :: (Tree a) -> Bool | Ord a
checkBST (Node x l r)
| isLeaf l && isLeaf r = True
| isLeaf l && x<(extractNode r) = True &&(checkBST r)
| isLeaf r && (extractNode l)<x = True &&(checkBST l)
| (extractNode l)<x&&x<(extractNode r) = True && (checkBST l)&&(checkBST r)
= False
//Start = checkTree bigTree //True
//Start = checkTree smallTree //True
//Start = checkTree badTree //False
Start = map checkTree [bigTree,smallTree,badTree]

:: Color = Red | Yellow | Green | Blue | Purple | Violet
//:: ColorCombo = { color1 :: Color, color2 :: Color}

//6.
//Write a function that when given a color, returns its complement.
//That is:
//Red -> Blue, Yellow -> Purple, Green -> Violet, Blue -> Red, Purple -> Yellow, Violet -> Green
colorComp :: Color -> Color
colorComp Red = Blue
colorComp Blue = Red
colorComp Green = Violet

//Start = colorComp Red //Blue
//Start = colorComp Blue //Red
//Start = colorComp Green //Violet
//Start = colorComp Purple //Yellow

:: Month = January | February | March | April | May | June | July | August | September | October | November | December

/*
Write a function that given a month and an Int
give us the month that many Ints away.
*/

listMonths :: [Month]
listMonths = [January, February, March, April, May, June, July, August, September, October, November, December]

mapMonthInt :: Month -> Int
mapMonthInt January = 1

instance == Month
where
    == January January = True
    == February February = True
    == March March = True
    == April April = True
    == May May = True
    == June June = True
    == July July = True
    == August August = True
    == September September = True
    == October October = True
    == November November = True
    == December December = True
    == _ _ = False

iterateMonth :: Month Int -> Month
iterateMonth m n = listMonths!!((indexM + n) rem 12)
where
    indexM = hd[x\\x<-[0..11]|listMonths!!x == m]

//Start = iterateMonth January 3

//7.
//Write a function that when given a Color, creates a list of possible color combos.
//Valid color combos can not have duplicate colors.
//colorCombo :: Color -> [ColorCombo]
//Start = colorCombo Red //[{color1=Red, color2=Yellow},{color1=Red, color2=Green},{color1=Red, color2=Blue},{color1=Red, color2=Purple},{color1=Red, color2=Violet}]
//Start = colorCombo Blue //[{color1=Blue, color2=Red},{color1=Blue, color2=Yellow},{color1=Blue, color2=Green},{color1=Blue, color2=Purple},{color1=Blue, color2=Violet}]

//8.
//Amicable numbers are two different numbers so related that the sum of the proper divisors of each 
//is equal to the other number. (A proper divisor of a number is a positive factor of that number other than the number itself. 
//For example, the proper divisors of 6 are 1, 2, and 3.) 
//Check if two integers are amicable pairs and put them together with the answer in a bag.
//amicable pair: 1184 and 1210 
//proper divisor of 1184 :  1, 2, 4, 8, 16, 32, 37, 74, 148, 296, 592 -> their sum == 1210
//proper divisor of 1210 : 1, 2, 5, 10, 11, 22, 55, 110, 121, 242, 605 -> their sum == 1184
//:: Bag a :==[((Int,Int),Bool)]
//amiBag :: [(Int,Int)] -> Bag a
//Start = amiBag [(1184,1210), (13,245)]
//Start = amiBag [] // []
//all true
//Start = amiBag [(220, 284), (1184, 1210), (2620, 2924), (5020, 5564), (6232, 6368), (10744, 10856), (12285, 14595), (17296, 18416), (63020, 76084), (66928, 66992)]

//9.
//Given the Object type, compute for the state component the given method and print the result as a String.
//ex: for state 3 compute 3 + 1 using the given method, and print the result "4" as string.
:: Object = {state::Int, method::Int->Int, tostring:: Int -> String }
MyObject = { state = 3
 , method = (+) 1
 , tostring = toString
 }

//Start = MyObject.tostring (MyObject.method MyObject.state)


//10.
//Given an operator and two lists, apply the operator to the elements of 
//the same positions of lists, like in the examples.
:: Operator a :== a a -> a
op2 :: (Operator a) [a] [a] -> [a]
op2 op list1 list2 = [op a b\\a<-list1 & b<-list2]
//Start = op2 (*) [2,3,4,5] [7,8,9,10] // [14,24,36,50]
//Start = op2 (*) [2,3,4,5] [7,8] // [14,24]
//Start = op2 (*) [2,3] [7,8,9,10] // [14,24]
//Start :: [Int]
//Start = op2 (*) [] [] // []
//Start = op2 (+) [3,2] [7,8] // [10,10]
/*
instance zero Int where zero = 0
instance zero Real where zero = 0.0
*/
instance + [a] where + l1 l2 = l1 ++ l2
instance zero [a] where zero = []
//Start = [1..3] + [5..10]
//Start = sum[[1..3],[2..7],[5..10],[]]



oneHalf :: Q
oneHalf = {num = 1, den = 2}

oneThird :: Q
oneThird = {num = 1, den = 3}

//Start = sum[oneHalf, oneThird, oneHalf, oneHalf]
// 0/1 + 1/2 + 1/3 + 1/2 + 1/2

//Start = sum[1.2, 3.24, 0.0, 100.2424]
//0.0 + 1.2 + 3.24 + 0.0 + 100.2424

//Start = sum[x\\x<-:""] //' '

func :: (Tree a) -> a | + a
func (Node _ (Node a _ _) (Node b _ _ )) = a + b

//Start = func tree1

//Ord -> sort, min, max, maxList, sortBy
//Eq -> isMember, ==, <>
//PlusMin -> sum
//PlusMin same as + , -, zero



ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))
tree1 = Node 10 (Node 7 (Node 3 Leaf Leaf) (Node 15 Leaf Leaf)) (Node 5 Leaf (Node 10 Leaf Leaf))
tree2 = Node 9 (Node 1 (Node 0 (Node 7 Leaf Leaf) Leaf) (Node 15 Leaf Leaf)) (Node 4 (Node 4561 Leaf Leaf) (Node 8 (Node 1663 Leaf Leaf) Leaf))
unitTree = Node 1337 Leaf Leaf
noTree = Leaf

/*
Write a function returning the depth
of the largest prime number in the tree.
*/
isPrime :: Int -> Bool
isPrime x = and[x rem n <> 0\\n <- [2..(x-1)]]
/*deepPrime :: (Tree Int) -> Int
deepPrime t = last(sortBy (\(a,b) (c,d) = a < c) (dpAux t 0))

dpAux :: (Tree Int) Int -> [(Int,Int)]
dpAux Leaf depth = []
dpAux tree depth
| isPrime (extractNode tree) = dpAux(goL tree) (depth+1)++[(extractNode tree,depth)]++dpAux(goR tree) (depth+1)
= dpAux(goL tree) (depth+1)++dpAux(goR tree) (depth+1)*/
//Start = deepPrime ourTree //3
//Start = deepPrime tree1 //1
//Start = deepPrime Leaf //0
//Getting the value at the node
extractNode :: (Tree a) -> a
extractNode (Node x l r) = x

//Going down left/right subtree
goL :: (Tree a) -> (Tree a)
goL (Node x l r) = l
goR :: (Tree a) -> (Tree a)
goR (Node x l r) = r

//Checking if we're at a leaf
isLeaf :: (Tree a) -> Bool
isLeaf Leaf = True
isLeaf _ = False

//Make a list from a BST
treeToList :: (Tree a) -> [a]
treeToList Leaf = []
treeToList tree = treeToList(goL tree)++[extractNode tree]++treeToList(goR tree)
//Start = treeToList newTree
