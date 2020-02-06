module hw10
import StdEnv

//Given these Algebraic Data Types, Records, and Tree...
:: Gender = Male | Female | NonBinary | AttackHelicopter | Nghia | OOBLECK
:: LivingStatus = Alive | Deceased | Undead
:: MarriageStatus = Married | Divorced | Single | Tinder
:: Person = { name :: String, gender :: Gender, age :: Int, livingStatus :: LivingStatus, marriageStatus :: MarriageStatus}
:: FamilyTree a = Name a (FamilyTree a) (FamilyTree a) | End | Polygamy [[[[[[[[[[[[[FamilyTree a]]]]]]]]]]]]]

//And these people:
Olivia = {name = "Olivia", gender = Female, age = 19, livingStatus = Alive, marriageStatus = Single}
Amelia = {name = "Amelia", gender = Female, age = 83, livingStatus = Alive, marriageStatus = Married}
Isla = {name = "Isla", gender = Female, age = 40, livingStatus = Alive, marriageStatus = Married}
Emily = {name = "Emily", gender = Female, age = 73, livingStatus = Alive, marriageStatus = Divorced}
Ava = {name = "Ava", gender = Female, age = 18, livingStatus = Alive, marriageStatus = Single}
Lily = {name = "Lily", gender = Female, age = 50, livingStatus = Alive, marriageStatus = Divorced}
Oliver = {name = "Oliver", gender = Male, age = 56, livingStatus = Alive, marriageStatus = Married}
Harry = {name = "Harry", gender = Male, age = 45, livingStatus = Alive, marriageStatus = Married}
Jack = {name = "Jack", gender = Male, age = 90, livingStatus = Deceased, marriageStatus = Married}
George = {name = "George", gender = Male, age = 43, livingStatus = Alive, marriageStatus = Married}
Noah = {name = "Noah", gender = Male, age = 74, livingStatus = Undead, marriageStatus = Divorced}
Freddie = {name = "Freddie", gender = Male, age = 24, livingStatus = Alive, marriageStatus = Single}
Ethan = {name = "Ethan", gender = Male, age = 20, livingStatus = Alive, marriageStatus = Single}

//And each person's immediate parents:
OliviaTree = Name Olivia OliverTree HarryTree
OliverTree = Name Oliver End End
HarryTree = Name Harry AmeliaTree JackTree
AmeliaTree = Name Amelia End End
JackTree = Name Jack End End
EthanTree = Name Ethan GeorgeTree IslaTree
GeorgeTree = Name George AmeliaTree JackTree
IslaTree = Name Isla NoahTree EmilyTree
NoahTree = Name Noah End End
EmilyTree = Name Emily End End
AvaTree = Name Ava LilyTree OliverTree
LilyTree = Name Lily End End
FreddieTree = Name Freddie End End

personsList = [Olivia, Amelia, Isla, Emily, Ava, Lily, Oliver, Harry, Jack, George, Noah, Freddie, Ethan]
familyList = [OliviaTree, OliverTree, HarryTree, AmeliaTree, JackTree, EthanTree, GeorgeTree, IslaTree, NoahTree, EmilyTree, AvaTree, LilyTree, FreddieTree]


/*
Write a function that tests if two persons are cousins
Condition: They share a grandparent.
*/
//areCousins :: Person Person -> Bool
//Start = areCousins Ethan Olivia //True
//Start = areCousins Ethan Ava //False
//Start = areCousins George Harry //False
//Start = areCousins George Isla //False
//Start = areCousins Ethan Ethan //False (same person)


:: IpV4Address :== (Int,Int,Int,Int)
:: Router = { nodeName :: String, ipAddress :: IpV4Address, activeStatus :: Bool}
:: Availability = NodeUp | NodeDown
:: Status = OK (Availability,Router) | NOK
instance == Availability
where
    == NodeUp NodeUp = True
    == NodeDown NodeDown = True
    == _ _ = False
instance toString Status
where
    toString NOK = "\nNo Router Match.\n"
    toString (OK (a,{nodeName = n, ipAddress = (i1,i2,i3,i4)}))
    |  a == NodeUp = stdOutput+++"Status: Available\n"
    = stdOutput +++ "Status: Unavailable\n"
    
    where
        tab = "    "
        stdOutput = "\nRouter Match:\n"+++tab+++"Router Name: "+++n+++"\n"+++tab+++"IpV4 Address: "+++toString i1+++"."+++toString i2+++"."+++toString i3+++"."+++toString i4+++"\n"+++tab

r1 :: Router
r1 = {nodeName = "PL1", ipAddress = (10,0,0,1), activeStatus = True}
r2 :: Router
r2 = {nodeName = "PL2", ipAddress = (10,0,0,2), activeStatus = True}
r3 :: Router
r3 = {nodeName = "PL3", ipAddress = (10,0,0,3), activeStatus = False}
r4 :: Router
r4 = {nodeName = "PL4", ipAddress = (10,0,0,4), activeStatus = True}
r5 :: Router
r5 = {nodeName = "PL5", ipAddress = (10,0,0,5), activeStatus = False}

CurrentRouters :: [Router]
CurrentRouters = [r1,r2,r3,r4,r5]

/*
Write a class of functions that will return a Router's status.
The function should be able to take a nodeName in the form
of a String, or an IpV4 address in the form of the predefined
type IpV4Address and return a Status, provided a list of existing routers.
The Status should be NOK if there is no matching Router.
The Status should be OK if there is a matching Router.
Availability will be NodeUp if the activeStatus is True.
Otherwise Availability will be NodeDown.

Note: You don't need to touch any of the definitions above, 
those have been written for you and will work provided that
your getStatus works properly.
*/

//class getStatus a b :: a b-> Status

//instance getStatus String [Router]

//instance getStatus IpV4Address [Router]

//Start = toString(getStatus "PL1" CurrentRouters)
/*
"
Router Match:
    Router Name: PL1
    IpV4 Address: 10.0.0.1
    Status: Available
"
*/

//Start = toString(getStatus (10,0,0,5) CurrentRouters)
/*
"
Router Match:
    Router Name: PL5
    IpV4 Address: 10.0.0.5
    Status: Unavailable
"
*/

//Start = toString(getStatus "NULL_ROUTER" CurrentRouters)
/*
"
No Router Match.
"
*/