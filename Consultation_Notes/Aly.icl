module Aly
import StdEnv


func1 :: Int Int -> Int
func1 x y
| func2 x y = y
= x

func2 :: Int Int -> Bool
func2 x y = (x*2) > y

//Start = (func1 2 3) + (func1 5 4)

func3 :: Int Int -> Bool
func3 a b = (func1 a b) < (func1 b a)

func4 :: Int Int -> Int
func4 a 0 = a
func4 a b = (func4 (a+1) (b-1))


//Start = func4 2 3
//Start =
//func4 2 3 =
//(func4 (2+1) (3-1)) =
//(func4 ((2+1)+1) ((3-1)-1)) =
//(func4 (((2+1)+1)+1) (((3-1)-1))-1) =
//(((2+1)+1)+1) =
//5

//Start = (1, "Hello")





// filter1 :: [Int] -> [Int]
// filter1 list = (hd list) ++ (hd (tl list))


// filtereveryother :: [Int] -> [Int]
// filterEveryother = filter1 

//Start = filterEveryOther
//filterEveryOther = filter1 !!!!
//filter1 !!!! = [(hd list)] ++ [(hd (tl list))]

/*
filterEveryOther :: [Int] -> [Int]
filterEveryOther list
| length list < 3 = [hd list]
= [hd list] ++ filterEveryOther (tl(tl list)) //(hd (tl list)) recursive call goes here!
//                                   [hd (tl(tl list))] ++ filterEveryOther (tl(tl list))
*/
/*
filterEveryOther :: [Int] -> [Int]
filterEveryOther list
| length list < 3 = [hd list]
= [hd list] ++ filterEveryOther (drop 2 list) 
//Optimized.
*/
/*
filterEveryOther :: [Int] -> [Int]
filterEveryOther [] = []
filterEveryOther [a,b,c] = [a]
filterEveryOther [a,b:rest]= [a] ++ filterEveryOther rest
//| length list < 3 = [hd list]
bugged out....
*/

/*
feoAux :: [Int] Int -> [Int]
feoAux list i
| i >= length list = []
| isEven i = [list!!i] ++ (feoAux list (i+1))
= (feoAux list (i+1))*/
/*
feoAux :: [Int] Int -> [Int]
feoAux list i
| i >= length list = []
= [list!!i] ++ (feoAux list (i+2))
*/

/*
int* feoAux(int[] list, int i)
{
    if(i>=list.size)
    {
        return new int[];
    }
    if(isEven(i))
    {
        return new int[] = {list[i]} ++ feoAux
    }
}
*/

/*
filterEveryOther :: [Int] -> [Int]
filterEveryOther list = feoAux list 0
*/

/*
int* filterEveryOther(int[] list)
{
    return feoAux(list, 0);
}
*/


//Start = filterEveryOther [3,6,3,7,8] //[3,3,8]
//[3,6,]

filterEveryOther :: [Int] -> [Int]
filterEveryOther list = [ list!!i \\i<-[0,2..(length list)] ]
//list comprehension
// list = [1,4,6,7,3]
//list!!3 = 7



/*
for(int i = 0; i<list.size; ++++i)
{
    resultList.add(list[i]);
}

for each i in [1..10]
    d ++ list[i]
*/

//list!!i => list[i]

/*
int inc(int x)
{
    x++;
    return x;
}
*/


/*
Generate a list of the first n "prime index" fibonacci numbers"

[1,1,2,3,5,8,13,...]
2,3,5,7,
[1,2,5,13..]
n=3
[1,2,5]
*/

//generate fibonacci's
fib :: Int -> Int
fib n
| n<=0 = abort "invalid"
= fibAux n 1 1

fibAux :: Int Int Int -> Int
fibAux 1 a b = b
fibAux n a b = fibAux (n-1) b (a+b)

//Start = fib 5

//make an infinite list of fibonacci's
/*
fibList :: [Int]
fibList = [ fib i \\ i<-[1..]]
*/

//Start = fibList

//we need only the prime index of this infinite list
isPrime :: Int -> Bool
isPrime x = and[x rem n <> 0\\n<-[2..(x-1)]]

//Start = (\x = [x rem n <> 0\\n<-[2..(x-1)]]) 13
//and[True, True, True] = True
//and [True, True, False, True] = False
//or[False, False, True] = True
//or[False, False] = False

fibList :: [Int]
fibList = [ fib i \\ i<-[1..] | isPrime i ]

//Start = fibList

//take only the first n ones of this list

finalFunc :: Int -> [Int]
//finalFunc n = take n fibList
finalFunc n = takeWhile (\x = x < n) fibList


//finalFunc :: Int -> [Int]
//Start = finalFunc 4 //[1,2,3,8]
//Start = finalFunc 1000 //[1,2,3,8,21,144,377]

