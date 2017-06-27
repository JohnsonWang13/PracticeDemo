//: Playground - noun: a place where people can play

import UIKit

enum Errorenum: Error {
    case errorOne
    case errorTwo
    case errorThree
}


struct errorStruct {
    var whichError: Int
}


class ErrorTest {
    
    var errorVar = [
        "errorOne": errorStruct(whichError: 1),
        "errorTwo": errorStruct(whichError: 2),
        "errorThree": errorStruct(whichError: 3)
    ]
    
    
    
    
    func errorTest(_ whatError: String) throws {
        guard let error = errorVar[whatError] else {
            throw Errorenum.errorOne
        }
    }
    
    
    
}

let test = ErrorTest()
//test.errorTest("errorOne")

do {
    
    try test.errorTest("errorTwo")
    
} catch Errorenum.errorOne {
        print("錯誤一")
} catch Errorenum.errorTwo {
    print("錯誤二")
}
