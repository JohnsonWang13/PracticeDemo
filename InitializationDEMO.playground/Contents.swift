//: Playground - noun: a place where people can play

import UIKit


//class Init1 {
//    
//    let firstValue: Double
//    init(testtt key1: Double) {
//        firstValue = key1 + 1
//    }
//    init(key2: Double) {
//        firstValue = key2 + 1
//    }
//}
//
//let aa = Init1(testtt: 20)
//aa.firstValue
//
//let bb = Init1.init(key2: 10)
//bb.firstValue
//
//
//class Init2 {
//    let aa, bb, cc: Double
//    init(aa: Double,_ bb: Double,_ cc:Double) {
//        self.aa = aa
//        self.bb = bb
//        self.cc = cc
//    }
//    init(dd: Double) {
//        self.aa = dd
//        self.bb = dd
//        self.cc = dd
//    }
//}
//
//let aba = Init2(aa: 0.5, 1.0,  1.2)
//let abb = Init2(dd: 1.0)
//
//print(aba)
//print(abb)
//
//
//struct Init3 {
//    var aa: Double, bb = 0.0
//}
//
//let init3Test = Init3(aa: 10.0, bb: 20.0)
//print(init3Test.aa)




//struct Hello {
//    var sayHello: String
//    init(whatToSay word: String) {
//        sayHello = word
//    }
//    init(anotherHello word: String) {
//        sayHello = word
//    }
//}
//let saySomething = Hello(whatToSay: "HELLO")
//let sayAnother = Hello(anotherHello: "GREETING")
//
//print(saySomething.sayHello)
//print(sayAnother.sayHello)

//struct Hello {
//    var helloOne, helloTwo: String
//    init(helloOne: String, helloTwo: String) {
//        self.helloOne = helloOne
//        self.helloTwo = helloTwo
//    }
//}
//let hello = Hello(helloOne: "HELLO", helloTwo: "GREETING")
//print(hello.helloOne)
//print(hello.helloTwo)



//struct Hello {
//    var helloOne, helloTwo: String
//    init(_ word1: String, _ word2: String) {
//        helloOne = word1
//        helloTwo = word2
//    }
//}
//let hello = Hello("HELLO", "GREETING")
//print(hello.helloOne)
//print(hello.helloTwo)


//------------delegate---------------
//------------superClass-------------
class Number {
    var number: Int, number2: Int, number3: Int
    
    init(number: Int, number2: Int, number3: Int) {
        self.number = number
        self.number2 = number2
        self.number3 = number3
        print("init1")
    }
    
    convenience init(number2: Int) {
        self.init(number: 10, number2: number2, number3: 30)
        print("init2")
    }
    
    convenience init(number22: Int) {
        self.init(number2: number22)
        print("init3")
    }
}


//let numberOne = Number(number2: 10)
let numberTwo = Number(number22: 500)
//print(numberTwo.number, numberOne.number2, numberOne.number3)
//-----------subClass----------------
class Number2: Number {
    var number2: Int
     override init(number: Int) {
        self.number2 = number + 10
        super.init(number: number)
//        print(self)
        print("init3")
    }
    
    convenience init() {
        self.init(number: 700)
        print("init4")
    }
}


let numberTwo = Number2()
let numberThree = Number2(number: 50)
print(numberTwo.number2)
print(numberTwo.number)


//--------Failable init---------------

//struct FailableTest {
//    var nameA: String
//    init?(nameA: String) {
//        if nameA.isEmpty {return nil}
//        self.nameA = nameA
//    }
//}
//
//let aaaa = FailableTest(nameA: "abc")
//print(aaaa?.nameA ?? "nilnil")
//let bbbb = FailableTest(nameA: "")
//print(bbbb?.nameA ?? "it nil")






