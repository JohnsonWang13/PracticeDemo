//: Playground - noun: a place where people can play

import UIKit

//******************************
//--------enum syntax-----------
//******************************
/*
enum enum1 {
    case first
    case second
}
let enumTest1 = enum1.second


switch enumTest1 {
case .first:
    print("First")
case .second:
    print("Second")
}
print(enumTest1)
*/
//******************************

enum enum2: Int {
    case first = 1
    case second = 2
    case third = 3
}

var enumTest2 = enum2.first
print(enumTest2.rawValue)
enumTest2 = .second
print(enumTest2.rawValue)

//******************************

enum enum3: Int {
    case first = 1, second, third
}

let enumTest3 = enum3.third
print(enumTest3.rawValue)

//******************************

let something = 5
if let enumTest31 = enum3(rawValue: something) {
    switch enumTest31 {
    case .first:
        print("FFFirst")
    case .second:
        print("SSecond")
    default:
        print("else")
    }
}
else {
    print("nothing")
}

//******************************

indirect enum enum4{
    case number(Int)
    case add(enum4, enum4)
    case multiple(enum4, enum4)
}

func enum4Function (_ enumTest4: enum4) -> Int{
    switch enumTest4 {
    case .number(let value):
        return value
    case .add(let one,let two):
        return enum4Function(one) + enum4Function(two)
    case .multiple(let one, let two):
        return enum4Function(one) * enum4Function(two)
    }
}

let five = enum4.number(5)
let four = enum4.number(4)

let sum = enum4.add(five, four)
print(enum4Function(sum))

let product = enum4.multiple(five, four)
print(enum4Function(product))

