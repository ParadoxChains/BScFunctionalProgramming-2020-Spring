module cw04g4
import StdEnv

// Generate list of Fibonacci numbers which are less than given n and are even.
// Start = f1 10 // [2,8]
// Start = f1 1000 // [2,8,34,144,610]
// Start = f1 100000 // [2,8,34,144,610,2584,10946,46368]
// Start = f1 1000000000 // [2,8,34,144,610,2584,10946,46368,196418,832040,3524578,14930352,63245986,267914296]
// Start = f1 10000000000 // [2,8,34,144,610,2584,10946,46368,196418,832040,3524578,14930352,63245986,267914296,1134903170,4807526976]

// Define function myLength, which returns length of a list
// You must use foldr
// Start = myLength [] // 0
// Start = myLength [1,2,3] // 3
// Start = myLength (take 100 [1..]) // 100
// Start = myLength [1..] // Heap full

// Define function "reverse" using foldr
// Start = myReverse [1,2,3,4,5,6,7,8] // [8,7,6,5,4,3,2,1]
// Start = myReverse [] // []
// Start = myReverse [1] // [1]