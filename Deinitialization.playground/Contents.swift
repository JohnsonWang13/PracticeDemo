//: Playground - noun: a place where people can play

import UIKit

class Person {
    
    var name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is here")
    }
    
    deinit {
        print("\(name) is gone")
    }
}

var person: Person! = Person(name: "Johnson")

person = nil
