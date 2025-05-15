import UIKit

/*
 chapter 1-3 exercises
 CODE MAGNETS
 */
 
class Dog {
    var name: String
    var color: DogColor
    var age: Int
    
    init(name: String, color: DogColor, age: Int) {
        self.name = name
        self.color = color
        self.age = age
    }
}

enum DogColor {
    case red
    case brown
    case black
}

var fido = Dog(name: "Fido", color: .brown, age: 7)
var bruce = Dog(name: "Bruce", color: .black, age: 4)
var moose = Dog(name: "Moose", color: .red, age: 11)
var pack: [Dog] = [fido, bruce]     // Array of 2 dogs

// Main actor-isolated var 'pack' can not be referenced from a nonisolated context: solution - add MainActor
@MainActor
func addDogToPack(dog: Dog){
    pack.append(dog)
    print("\(dog.name) (aged \(dog.age)) has joined the pack.")
}

@MainActor
func listDogsInPack(){
    print("The pack is:")
    print("--")
    for dog in pack {
        print(dog.name)
    }
    print("--")
}

listDogsInPack()
addDogToPack(dog: moose)
listDogsInPack()
 
 
 
 
/*
 chapter 1-3 exercises
 POOL PUZZLE
 take lines of code from "word bank", cannot use same line more than once,
 won't need to use all the lines,
 place them into the blanks in the code
 goal is match the output below, given the starting variables: var todaysWeather = "Windy" var temperature = 35
 "Strap your hat on. It's windy! And it's not really cold or hot!"
 */

var todaysWeather = "Windy"
var temperature = 35
var message = "Today's Weather"

switch todaysWeather {
case "Sunny": message = "It's a lovely sunny day!"
case "Windy": message = "Strap your hat on. It's windy!"
case "Raining": message = "Pack your umbrella!"
case "Snow": message = "Brr! There's snow in the air!"
default:
    message = "It's a day, you know?"
}

if (temperature > 65){
    message += " And it's not cold out there."  // += adds to existing message +=
} else if (temperature < 35){
    message += " And it's chilly out there."
} else {
    message += " And it's not really cold or hot!"
}

print(message)





/*
 chapter 1-3 exercises
 be THE SWIFT COMPILER
 each snippet is a complete Playground,
 play Swift Compiler, and determine whether each of these will run or not.
 if not, how would you FIX them?
 */

//##NOTE: Solution to compile - edit `dogsAge` as a var rather than let
var dogsAge = 10
let dogsName = "Trevor"
dogsAge = dogsAge + 1

print("My dog's name is \(dogsName), and they are \(dogsAge) years old.")


//##NOTE: Solution to compile - edit print() so the argument uses the `i` iterator instead of just (number * 92);
var number = 10

for i in 1...number {
    print(i * (number * 92))
}


//##NOTE: Solution to compile - none needed
var bestNumbers: Set = [7,42,109,53,12,17]

print("bestNumbers: ",bestNumbers)
bestNumbers.remove(7)
bestNumbers.remove(109)
bestNumbers.remove(242)
print("bestNumbers: ",bestNumbers)
bestNumbers.insert(907)
bestNumbers.insert(1002)
bestNumbers.insert(42)
print("bestNumbers: ",bestNumbers)
