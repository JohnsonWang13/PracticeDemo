//: Playground - noun: a place where people can play

import UIKit

//************************************
//-------stored properties------------
//************************************
/*
struct property1 {
    var firstValue: Double = 150
    var secondValue: Double = 100
}

var Value1 = property1(firstValue: 200, secondValue: 200)
print("firstValue = \(Value1.firstValue), secondValue = \(Value1.secondValue)")

Value1.firstValue = 100

print("firstValue = \(Value1.firstValue)")
*/
//************************************
//-------Computed properties----------
//************************************
/*
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set (newCenter) { //newValue
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 30.0, height: 30.0))

print(square.center)

//print(square.origin.x)


square.center = Point(x: 50.0, y: 5.0)

let initialCenter = square.center

print(square.origin.x, square.origin.y)

print(initialCenter)
*/
//************************************
//------Property observers------------
//************************************

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()

stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896

//************************************
//------Type properties---------------
//************************************

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
    return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
let somet11 = SomeStructure.storedTypeProperty
print(somet11)



