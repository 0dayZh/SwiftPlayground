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
