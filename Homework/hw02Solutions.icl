module hw02Solutions
import StdEnv

/**
  * Write a function that takes a number 'n'
  * and returns a list of the first n Fibonacci numbers.
  * A Fibonacci number is a sequence where F_0 = 0, F_1 = 1, and F_n = F_(n-2) + F_(n-1)
  * For example, FibList 8 = [1,1,2,3,5,8,13,21]
  *
  * Note: You must use recursion.
  *
  * Total: 20pts
  */
FibList :: Int -> [Int]
FibList n = map Fib [1..n]

Fib :: Int -> Int
Fib 0 = 0
Fib 1 = 1
Fib n = FibAux n 0 1

FibAux :: Int Int Int -> Int
FibAux 1 _ b = b
FibAux n a b = FibAux (n-1) b (a+b)

//Alternate Solution:
//The second solution only needs one helper function.
FibListShort :: Int -> [Int]
FibListShort n = [FibAux x 0 1\\x<-[1..n]]
//Start = FibList 8 //[1,1,2,3,5,8,13,21]
//Start = FibList -3 //[]
//Start = FibList 0 //[]



/**
  * Write a function that takes a list of coefficients for a polynomial
  * and evaluates it at an integer given as the second parameter.
  * A list such as [1,6,9] would represent the the polynomial x^2+6x+9.
  * Note: Exponentiation via (^) or a custom exponential function
  * is NOT allowed.
  * 
  * For example: Evaluate [1,6,9] 2 = 25
  * Hint: Use Horner's Method
  * e.g. 3x^2 + 2x -4 = -4 + 2x + 3x^2 = -4 + x(2 + x(3)))
  *
  * Total: 50pts
  */
Evaluate :: [Int] Int -> Int
Evaluate [] _ = 0
Evaluate coeffList x = (last coeffList) + x*(Evaluate (init coeffList) x)

//Alternate Solution:
//First solution will fail on large polynomials with "Heap Full"
EvaluateOther :: [Int] Int -> Int
EvaluateOther coeffList x = EvaluateOtherAux coeffList x 0

EvaluateOtherAux :: [Int] Int Int -> Int
EvaluateOtherAux [] _ result = result
EvaluateOtherAux [a:b] x result = EvaluateOtherAux b x (a+(x*result))
//Start = Evaluate [1,6,9] 2 //25
//Start = Evaluate [1337] 12345 //1337
//Start = Evaluate [] 9001 //0
//Start = Evaluate [243,810,1080,720,240,32] (~2) //-1024

/**
  * Write a function that takes two lists of Strings,
  * one containing First Names and the other containing
  * Family Names, and creates a list where each sublist
  * will contain the First Names matched with the 
  * Family Names.
  * In the case that the list of Family Names has only
  * one Family name, assign it to every Frist Name.
  */
MakeFamily :: [String] [String] -> [[String]]
MakeFamily [] _ = []
MakeFamily _ [] = []
MakeFamily [a:b] [c] = [[a,c]]++MakeFamily b [c]
MakeFamily [a:b] [c:d] = [[a,c]]++MakeFamily b d

//Alternate solution:
//Operates by making the last name list as long as first name list.
MakeFamilyOther :: [String] [String] -> [[String]]
MakeFamilyOther firstNames lastNames
| isEmpty firstNames || isEmpty lastNames = []
| length lastNames == 1 = MakeFamilyOther firstNames (repeatn (length firstNames) (hd lastNames))
= [[a,b]\\ a<-firstNames & b<-lastNames]
//Start = MakeFamily ["Hossameldin", "Zuka", "Nicola", "Tringa", "Ying", "Nghia", "Pedro", "Evan"] ["Abdin", "Tsinadze", "Cenic", "Sylaj", "Xue", "Le", "Figueiredo", "Sitt"] //[["Hossameldin","Abdin"],["Zuka","Tsinadze"],["Nicola","Cenic"],["Tringa","Sylaj"],["Ying","Xue"],["Nghia","Le"],["Pedro","Figueiredo"],["Evan","Sitt"]]
//Start = MakeFamily ["Hossameldin", "Zuka", "Nicola", "Tringa", "Ying", "Nghia", "Pedro", "Evan"] ["Zsok"] //[["Hossameldin","Zsok"],["Zuka","Zsok"],["Nicola","Zsok"],["Tringa","Zsok"],["Ying","Zsok"],["Nghia","Zsok"],["Pedro","Zsok"],["Evan","Zsok"]]
//Start = MakeFamily [] ["Abdin", "Tsinadze", "Cenic", "Sylaj", "Xue", "Le Minh", "Figueiredo", "Sitt"] //[]
//Start = MakeFamily ["Hossameldin", "Zuka", "Nicola", "Tringa", "Ying", "Nghia", "Pedro", "Evan"] [] //[]