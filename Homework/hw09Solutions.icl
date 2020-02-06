module hw09Solutions
import StdEnv

/*
:: Complex = { real :: Real, imaginary :: Real}

:: RoflCopter :== Int

timesRofl :: RoflCopter Int -> RoflCopter
timesRofl x n = x * n
*/
/*
Given the above defined abstract data type, record, and function:
you are given a task to expand functionality by making RoflCopter
a Complex.

Refactor the code, so we can multiply the new RoflCopter by an Int.

Definition: Refactor (verb)
"a disciplined technique for restructuring an existing body of code,
altering its internal structure without changing its external behavior.
Its heart is a series of small behavior preserving transformations."

That is, make the code work, without changing the arguments of timesRofl.
You will need to change RoflCopter's definition, and the internal workings
of timesRofl.
*/
:: Complex = { real :: Real, imaginary :: Real}

:: RoflCopter :== Complex

timesRofl :: RoflCopter Int -> RoflCopter
timesRofl x n = {real = x.real * (toReal n), imaginary = x.imaginary * (toReal n)}

//Start = timesRofl {real = 2.0, imaginary = 3.0} 5 //(Complex 10 15)
//Start = timesRofl {real = (acos -1.0), imaginary = (exp 1.0)} 100 //(Complex 314.159265358979 271.828182845905)
//Start = timesRofl {real = 0.0, imaginary = 0.0} 420 //(Complex 0 0)

/*
Implement the Dictionary data type.
A dictionary is a list containing
pairings of two entries.
The first entry is the "key".
The second entry is the "value".
Every key has an value associated with it.
Keys are unique, there can not be duplicates.
Values can be duplicated between keys.
*/

//Type definition.
:: Dictionary :== [(String,Int)]
//Convenient toString instance:
instance toString Dictionary
where
    toString [] = "End of Dictionary"
    toString [(key,value):rest] = "Key: "+++(toString key)+++", "+++"Value: "+++(toString value)+++"\n"+++(toString rest)
//Custom Dictionary for testing.
myDict:: Dictionary
myDict = addEntry (addEntry (addEntry (addEntry (addEntry (addEntry (addEntry newDict "Evan" 42) "Hossam" 69) "Nghia" 420) "Tringa" 1337) "Zuka" 13) "Nikola" 9001) "Ying" 420


//Create a new dictionary. Should be empty.
newDict :: Dictionary
newDict = []

//Add a new entry. Be sure to check for duplicate keys!
addEntry :: Dictionary String Int -> Dictionary
addEntry dict x y
| not (isMember x [key\\(key,value)<-dict]) = dict ++ [(x,y)]
= dict

//Lookup the value associated with a key.
//Return 0 if the key isn't found.
(lookup) :: Dictionary String -> Int
(lookup) dict x = hd([value\\(key,value)<-dict|key==x]++[0])

//Find all keys associated with a certain value.
//Return as a list of keys.
(findKeys) :: Dictionary Int -> [String]
(findKeys) dict y = [key\\(key,value)<-dict|value==y]

//Start = toString newDict //"End of Dictionary"
//Start = toString myDict
/*
"Key: Evan, Value: 42
Key: Hossam, Value: 69
Key: Nghia, Value: 420
Key: Tringa, Value: 1337
Key: Zuka, Value: 13
Key: Nikola, Value: 9001
Key: Ying, Value: 420
End of Dictionary"
*/
//Start = toString(addEntry myDict "Hossam" 0)
/*
"Key: Evan, Value: 42
Key: Hossam, Value: 69
Key: Nghia, Value: 420
Key: Tringa, Value: 1337
Key: Zuka, Value: 13
Key: Nikola, Value: 9001
Key: Ying, Value: 420
End of Dictionary"
*/
//Start = myDict lookup "Nikola" //9001
//Start = myDict lookup "Viktoria" //0
//Start = myDict findKeys 42 //["Evan"]
//Start = myDict findKeys 420 //["Nghia","Ying"]
//Start = myDict findKeys 99999999999 //[]

