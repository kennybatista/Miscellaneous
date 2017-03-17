//: Playground - noun: a place where people can play

import UIKit

// These higher order functions can be used on collections
// Map, Flatmap, Filter, Reduce

// What are higher order functions? - Functions that can be passed as parameters to other functions



// MAP - loops over a collection and applies the same operation to each element in the collection
// Let's asume that we need to multiple every item in an array by 2

var numberArray1 = [1, 2, 3, 4, 5]
// The traditional way
var emptyArray:[Int] = []

for number in numberArray1 {
    emptyArray.append(number * 2)
}







// using map ---- map accepts a closure,

var numberArray2 = [1,2,3,4,5]

// map example 1
var newArray3 = numberArray2.map { (value: Int) in
    return value * 2
}

// map example 2
var newArray4 = numberArray2.map{ value in value * 2 }

// map example 3
var newArray5 = numberArray2.map{ $0 * 2 }










// FILTER - Loops over a collection and returns an array that contains elements that meet condition. 

let namesArray = ["John", "David", "Kenny", "Bob", "Kevin", "Daisy", "Leo", "Kendall"]
var kNames: [String] = []

// traditional way

for name in namesArray {
    let firstCharacter = name.characters.first
    if firstCharacter == "K" {
        kNames.append(name)
    }
}

print(kNames)

// Using Filter
namesArray.filter {$0.characters.first == "K"}












\

// REDUCE - combines all items in a collection to create a single value
var oneToFive = [1,2,3,4,5]

// the traditional way
var sumIs: Int = 0

for num in oneToFive {
    sumIs += num
}

// using reduce - takes in a starting value, $0 ( aka, first parameter in the fun which is 0 ), then $1 ( which is the second paramter ) - so we're basically looping through the collection, and adding the next value to the current value

var sum = oneToFive.reduce(0, {$0 + $1})
print("sum: ", sum)


// another reduce example
var oneToFive2 = [1,2,3,4,5]

oneToFive2.reduce(0, +)
// the + is a substitute for the {$0 + $1} closure, more syntactic sugar





//Chaining - combining high order functions
let arrayInArray = [[11,12,13], [14,15,16]]
var newValue = arrayInArray.flatMap {$0}.map{$0 + $0}
print("newValue: ", newValue)







