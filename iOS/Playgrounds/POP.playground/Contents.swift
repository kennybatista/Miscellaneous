//: Playground - noun: a place where people can play



// create the blueprint ( aka, Protocol ) 
protocol Human {
    //get set, get just means that we can have access to the property. and set means that we can change the value of the property
    var name: String {get set}
    var race: String {get set}
    func sayHi()
}

struct American: Human {
    var name: String = "Kenny"
    var race: String = "Hispanic"
    
    func sayHi() {
        print("Hello, I am ", name)
    }
}

struct Korean: Human {
    var name: String = "Bob Lee"
    var race: String = "Asian"
    
    func sayHi() {
        print("Hello, I am : ", name)
    }
}



// What if we want to have a protocol inherit from another protocol

protocol SuperHuman: Human {
    var canFly: Bool {get set}
    func punch()
}

// now if we make a struct that adopts superhuman, we must meet the requirements of the human protocol too
struct SuperSayian: SuperHuman {
    var name: String = "Goku"
    var race: String = "Alien"
    func sayHi() {
        print("Hello, my name is ", name)
    }
    
    var canFly: Bool = true
    func punch() {
        print("Punch!")
    }
}


// we can also conform to many protocols ( after breaking up superhuman protocols into two different protocols instead of inheriting )
//example: 
//struct Example: ProtocolOne, ProtocolTwo {

//}



// Most powerful feature of Protocols, protocol extensions: allow us to set default properties and methods to classes, structs, and enums

protocol SuperAnimal {
    func speakEnglish()
}

extension SuperAnimal {
    func speakEnglish(){
        print("I speak English, pretty cool, huh? ")
    }
}

class Donkey: SuperAnimal {
}

var ramon = Donkey()
ramon.speakEnglish()
