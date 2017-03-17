//DELEGATES

// ~ Don't memorize, understand

//https://medium.com/ios-geek-community/the-meaning-of-delegate-in-swift-347eaa9674d#.nfxa9v9m1


// Somebody feed me sceneario

protocol Cook {
    func makingFood()
}

struct Mom: Cook {
    func makingFood() {
        print(#function)
    }
}

//make a mom
var mom = Mom()
mom.makingFood()

//make a baby
struct Baby {
    var delegate: Cook? // delegate = someone with special skills
}

var baby = Baby()
baby.delegate?.makingFood() // "Pizza is coming soon!"