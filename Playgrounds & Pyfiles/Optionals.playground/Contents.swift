//: Playground - noun: a place where people can play

import UIKit

// an optional is just a value wrapper
// It can either be empty ( .None ) or contain something ( .Some(wrapped)


var x: Int? = 10 // .Some(10) -- an enum of type some

var y: Int? = nil // .None -- an enum of type none

// optionals are enums, and because they're enums, we can work with them as enums
//1. assigning
var z: Int? = .some(20)

// using switch with optionals

let xx: String? = .some("Hello Optionals")

switch xx {
    case .some(let value):
        print("Value is: ", value)
    case .none:
        print("There is no stored value")
}

// accessing optionals using case let
if case let .some(value) = xx {
    print(value)
}


let fullName: String? = nil

switch fullName {
    case .some(let value):
        print("Here is the value \(value)")
    case .none:
        print("There is no value")
}

if case let .some(value) = fullName {
    print(value)
}

if let fullName = fullName {
    print(fullName)
} else {
    print("full name has no value")
}


// optional binding