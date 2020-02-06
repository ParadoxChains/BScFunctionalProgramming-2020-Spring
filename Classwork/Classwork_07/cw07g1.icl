module cw07g1
import StdEnv

// 1. Given three points, write a function which decides if a they form a
// Right Triangle (triangle which has three equal sides).
//f1::Point Point Point -> Bool

//Start = f1 p1 p2 p3 
//Start = f1 {x=(-4.0) , y=(-2.0)} {x=(-3.0) , y=(7.0)} {x=(4.0) , y=(-2.0)} //False
//Start = f1 {x=(0.0) , y=(3.0)} {x=(4.0) , y=(0.0)} {x=(0.0) , y=(0.0)} //True



		  
//2. Give a list of people of record type Person.
// find how many girls like dog but dislike cat.
//The gender in record Person must be Algebraic type: Gender
:: Gender = Male | Female | Trans
f2 :: [Person] ->Int


//Start =f2 [{name = "Alice", gender = Female, likedog = True, likecat = False },{name = "Alice2", gender = Female, likedog = True, likecat = True },{name = "Alice3", gender = Male, likedog = True, likecat = False }] //1
//Start =f2 [{name = "Alice", gender = Female, likedog = True, likecat = False },{name = "Alice2", gender = Female, likedog = True, likecat = False },{name = "Alice3", gender = Male, likedog = True, likecat = False }] //2



//3. find the student with the highest grade
f3:: [Student]->Real


//Start = f3 [{name = "Alice", grade = 22.1},{name = "Ban", grade = 58.0},{name = "kiki", grade = 94.2}] //94.2
