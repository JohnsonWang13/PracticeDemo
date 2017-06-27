//: Playground - noun: a place where people can play

import UIKit

protocol ProtocolA {
   func someFunc() -> ()
}

public class A {
    fileprivate func someMethod() {}
}

class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

extension A : ProtocolA{
    func someFunc() -> () {
        return someMethod()
    }
}