module Hello
import StdEnv

//Start = "Hello World!"

// y = x + 2
// x = 3
// y = 3 + 2
// y = 5

//Start = 3 + 2
//Start = 5

addTwo :: Int -> Int
addTwo x = x + 2

//Start = addTwo 3
//Start = addTwo 3 //redex
//Start = 3 + 2 //normal form
//Start = 5 

//Start = addTwo ( addTwo 3)
//Start = addTwo ( addTwo 3) //redex
//Start = ( addTwo 3) + 2
//Start = ( 3+2 ) + 2 
//( ) solved first because not Int yet.
//Start = 5 + 2
//Start = 7

//Start = 5.4389549354239 + 52
//Start = 4 + 34.35

//Start = 5 + 3 * 2 / -4 ^ 45

biggerThanTwo sumNum
| sumNum <= 2 = False
//| (someCondition) = (someReturn)
= True
//| otherwise = True

//Start = biggerThanTwo 1
//Start = biggerThanTwo 1.0

signOf x
| x > 0 = "positive"
| x == 0 = "zero"
| x < 0 = "negative"
//= "negative"

biggerThan :: Int -> String
biggerThan x
| x > 1 = "bigger than 1"
| x > 0 = "bigger than 0"
| x > -1 = "bigger than -1"


Start = biggerThan 3