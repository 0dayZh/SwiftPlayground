//: Playground - noun: a place where people can play

import Foundation

// Start!
print("Hello swift!")

// Simple values
var myVariable = 42
myVariable = 50
let myConstant = 42

let thisIsInteger = 70
let thisIsDouble = 70.0
let thisIsDoubleToo: Double = 70.0

let width = 40
let label = "The width is "
let labelWidth = label + String(width)

let apples = 3
let oranges = 4
let appleString = "Apple is \(apples)"
let fruitString = "Fruit is \(apples + oranges)"

var array = ["haha", "yo \(apples)"]
var commaArray = ["haha", "yo \(apples)",]
array[1] = "oh"
array

var dictionary = [
    "name": "0dayZh",
    "sex": "male",
]
dictionary["name"] = "whoami"
dictionary
dictionary["dictToString"] = String(dictionary)
dictionary
dictionary["arrayToString"] = String(commaArray)
dictionary  // Note: no comma in the end

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

array = []
dictionary = [:]

// Control Flow
// for array
let scores = [1, 2, 4, 5]
var totalScore = 0
for score in scores {
    totalScore += score
}
print(totalScore)

// ? optional
var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalName: String? = "0dayZh"
var greeting = "Hello"
if let name = optionalName {
    greeting += ", \(name)"
}

// ?? default value
let nickName: String? = nil
let defaultName: String = "0dayZh Wang"
let greetingWho = "Hi \(nickName ?? defaultName)"

// switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("no break anymore")
case "something", "cool another one":
    print("I love it")
case let x where x.hasSuffix("pepper"):
    print("You see this? wow!")
default:
    print("don't miss default case")
}

// for dictionary
let dict = [
    "key1": [1, 2, 3],
    "key2": [3, 2, 5,]
]

for (key, array) in dict {
    for value in array {
        print(value);
    }
}

// while
var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// for ..<  range [)
var loop1 = 0
for i in 0..<4 {
    loop1 += i
}
print(loop1)

// for ...  range []
var loop2 = 0
for i in 0...3 {
    loop2 += i
}
print(loop2)

var loop3 = 0
for var i = 0; i < 4; i++ {
    loop3 += i
}
print(loop3)

// Funcitons and Closure
func greet(name: String, day: String) -> String {
    return "Hi, \(name). Today is \(day)"
}
greet("0dayZh", day: "2015-01-01")

func calculateScores(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let result = calculateScores([1, 2, 3, 4])
print(result.min)
print(result.2)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum
}

sumOf()
sumOf(1, 2, 3)

func return15() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

return15()

func makePlusFunction() -> ((Int) -> Int) {
    func plusOne(number: Int) -> Int {
        return number + 1
    }
    return plusOne
}

var plusFunc = makePlusFunction()
plusFunc(8)

func matchesCount(list: [Int], condition: ((Int) -> Bool)) -> Int {
    var counter = 0
    for item in list {
        if condition(item) {
            counter++
        }
    }
    
    return counter
}

func lessThenTen(number: Int) -> Bool {
    if number < 10 {
        return true
    }
    return false
}

let toMatchNumbers = [1, 2, 20]
matchesCount(toMatchNumbers, condition: lessThenTen)
let closureResult = toMatchNumbers.map({
    (number: Int) -> Int in
    let result = number * 2
    return result
})
closureResult

let mappedNumbers = toMatchNumbers.map({ numer in 2 * numer });
mappedNumbers

let sortedNumbers = toMatchNumbers.sort({ $0 > $1 })
sortedNumbers

// Objects and Classes
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    // no func keyword, no return required
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sided of length \(sideLength)"
    }
}

let square = Square(sideLength: 5.2, name: "yoyo")
square.area()
square.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.0, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            self.square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            self.triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "oh")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

// Enumerations and Structures
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
threeOfSpades.simpleDescription()
// structures are copied when passed, but classes are passed by reference.
let anotherCard = threeOfSpades
anotherCard.simpleDescription()

