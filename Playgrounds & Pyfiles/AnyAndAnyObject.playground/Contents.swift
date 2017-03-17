//: Playground - noun: a place where people can play

import UIKit

// Any - represents any type in Swift, including functions and optional types
// AnyObject - represents an instance of any type class

// let's try it out with non-class Ints and Strings. If I change the type of the collection to AnyObject we'll get an error, because String and Ints are not class object
var anyArray: [Any] = [1,2,"hello", true]
print(anyArray)




