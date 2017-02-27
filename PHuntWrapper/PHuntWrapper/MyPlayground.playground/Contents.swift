//: Playground - noun: a place where people can play

import UIKit


//let nestedArray = [[1,2,3], [4,5,6]]
//
//let flattenedArray = nestedArray.flatMap { $0 }
//flattenedArray // [1, 2, 3, 4, 5, 6]

let nestedArray = [[1,2,3],[4,5,6]]

// $0 is the first parameter passed into the function. $1 is the second parameter passed into the function
let flattenedArray = nestedArray.flatMap { $0 }
// multiplied
let multipliedFlattenedArray = nestedArray.flatMap { $0.map {$0 * 2} }
multipliedFlattenedArray
