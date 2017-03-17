
import UIKit

//ARC: Strong and Weak References in Swift

// Why is an IBOutlet weak, and what does it mean? What is a weak variable? 

// Apple uses ARC to manage and keep track of memory on an app. 

// Using references like Strong and Weak are ways of letting ARC know when to free memory

//[STRONG]
// if it's strong, two tight grips. Objects hold tight ( Strong )  to each  other

var name = String() // by default, this is  a strong reference. Unless we specify otherwise

// when  we have strong references to each objects, we create a retain cycle that prevents the object from being deallocated and increases the retain cycle count to 1. They're now keeping each other alive. 



class Person {
    var name: String
    var pet: Pet?
    
    init(name: String, pet: Pet?) {
        self.name = name
        self.pet = pet
    }
}

class Pet {
    var owner: Person?
    var pet: String
    
    init(owner: Person, pet: String) {
        self.owner = owner
        self.pet = pet
    }
}







// Weak references have a retain count of 0. Because the object may hold a nil at some point, and is subject to being deallocated by ARC. 
// weak variable example: weak var name: String? 
// a weak reference can never be a constant, because it needs to be able to mutate


class Person1 {
    var name: String
    weak var pet: Pet?
    
    init(name: String, pet: Pet?) {
        self.name = name
        self.pet = pet
    }
}


class Pet1 {
    var owner: Person?
    var pet: String
    
    init(owner: Person?, pet: String?) {
        self.owner = owner
        self.pet = pet!
    }
}






//Strong references should be used on Super Classes, but should never be the other way around. Subclasses should not have strong references to upper classes. Because we don't always want to inherit all of the properties and methods from a super class.




















