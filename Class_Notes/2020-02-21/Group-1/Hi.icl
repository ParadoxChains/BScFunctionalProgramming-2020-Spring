module Hi
import StdEnv

//Start = "Hello World!"

//Start = 2 + 3
//y = x + 2
//x = 3
//y = 3 + 2
//y = 5

addTwo x = x + 2

//Start = addTwo 3
//Start = addTwo 3 //redex
//Start = 3 + 2 //normal form
//Start = 5

//Start = addTwo ( addTwo 3 )
//Start = addTwo ( addTwo 3 ) //redex
//Start = ( addTwo 3 ) + 2 //redex
//Start = ( 3 + 2 ) + 2 //normal form
//Start = 5 + 2
//Start = 7
//Start = 4 / 5 + 6 - 2 * -6 ^ 23
//Start = 4 / (5 + (6 - 2) * ((-6) ^ 23))
//Start = 3.14 + 2
//Start = 2 + 3.14

biggerThanTwo x
| x <= 2 = False
//| (someCondition) = (someReturnOrAction)
//| x > 2 = True
//| otherwise = True
= True


signOf someNumber
| someNumber > 0 = "positive"
| someNumber == 0 = "zero"
| someNumber < 0 = "negative"
// = "negative"
//Start = signOf 0
//Start = signOf 0

addTwoNumbers :: Int Int -> Int
addTwoNumbers x y = x + y

//Start = addTwoNumbers 2.0 3.14

addStuff :: Int Real -> Real
addStuff myInt myReal = (toReal myInt) + myReal

Start = addStuff 2 3.14






