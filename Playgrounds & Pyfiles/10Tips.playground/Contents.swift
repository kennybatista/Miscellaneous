

// [1. EXTENSIONS]


    // Ex. Squaring a number

    // ------------- okay version
    func square(int: Int) -> Int {
        return int * int
    }

    var squaredOffFive = square(int: 5)

    // double squared
    square(int: squaredOffFive)


    // ------------- Better version
    extension Int {
        var squared: Int {
            return self * self
        }
    }

    5.squared // 25
    5.squared.squared // 625





// [2. GENERICS]

    // EX) Print all elements in an array

    // Bad Code

    var stringArray = ["Bob", "Bobby", "SangJoon"]
    var intArrray = [1,3,4,5,6]
    var doubleArray = [1.0,2.0,3.0]

    func printString(a: [String]) {
        for i in a {
            print(i)
        }
    }

    func printInt(a: [Int]) {
        for i in a {
            print(i)
        }
    }

    func printDouble(a: [Double]){for i in a { print(i) } }

    //<-- to many useless functions, let's just create one --> 

    // Awesome code
    func printAllElementsArray<T>(a: [T]){
        for element in a {
            print(element)
        }
    }



// [2. OPTIONAL UNWRAPPING]
// Guard let vs If let

// bad code
var myusername: Double?
var myPassword: Double?

//hideous code

func userLogin1(){
    if let username = myusername{
        if let password = myPassword {
            print("Welcome, ", username)
        }
    }
}


// pretty code
func userLogin2(){
    guard let username = myusername, let password = myPassword
        else {
        return
    }
}


