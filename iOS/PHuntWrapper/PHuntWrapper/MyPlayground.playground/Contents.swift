//: Playground - noun: a place where people can play

import UIKit


//let nestedArray = [[1,2,3], [4,5,6]]

let nestedArray = [
            [1,2,3],
            [4,5,6]
        ]

//Example 1
// flatmaps with one $0 takes in the content of a multi demension array and merges each element into one array
let flattenedArray = nestedArray.flatMap { $0 }
print(flattenedArray)


//Example 2
// We can also use map inside of a flatmap to convert elements being passed in.
let multipliedFlattenedArray = nestedArray.flatMap { $0.map {$0 * 2} }
multipliedFlattenedArray


