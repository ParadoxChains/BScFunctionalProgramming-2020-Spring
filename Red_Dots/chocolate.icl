module chocolate
import StdEnv

// Given following three values, the task is to find the total number of maximum chocolates you can eat.

//     money : Money you have to buy chocolates
//     price : Price of a chocolate
//     wrap : Number of wrappers to be returned for getting one extra chocolate.

// It may be assumed that all given values are positive integers and greater than 1.

// EXAMPLE :

// Input :   money = 16, price = 2, wrap = 2
// Output :   15
// Price of a chocolate is 2. You can buy 8 chocolates from
// amount 16. You can return 8 wrappers back and get 4 more
// chocolates. Then you can return 4 wrappers and get 2 more
// chocolates. Finally you can return 2 wrappers to get 1
// more chocolate.