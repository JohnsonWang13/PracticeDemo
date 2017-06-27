//: Playground - noun: a place where people can play

import UIKit

struct Family {
    var father: Int
    var mother: Int
    var son: Int
    var daughter: Int
}

enum SomthingWrong: Error {
    case whoIsThis
    case onlyOneFather
    case onlyOneMother
}

class FamilyInput {
    var familys = [
        "John": Family(father: 1, mother: 1, son: 0, daughter: 1),
        "Micky": Family(father: 2, mother: 1, son: 1, daughter: 3),
        "Tom": Family(father: 1, mother: 3, son: 2, daughter: 2)
    ]
    
    func checkFamily(whosFamily: String) throws -> String {
        
        guard let name = familys[whosFamily] else {
            throw SomthingWrong.whoIsThis
        }
        
        guard name.father <= 1 else {
            throw SomthingWrong.onlyOneFather
        }
        
        guard name.mother <= 1 else {
            throw SomthingWrong.onlyOneMother
        }
        
        return "normal"
    }
    
}

let someOne = FamilyInput()

do {
    try someOne.checkFamily(whosFamily: "Micky")
} catch SomthingWrong.whoIsThis {
    print("Who is this guy?")
} catch SomthingWrong.onlyOneFather {
    print("Only one father")
} catch SomthingWrong.onlyOneMother {
    print("Only one mother")
}


















//func tansStringToNumber(some: String) -> Double? {
//    let number = Double(some)
//    return number
//}
//
//func errorCheck() -> Double {
//    if let number = try? tansStringToNumber(some: "1"){
//        return number!
//    } else {
//        return 123.4
//    }
//}
//let this = errorCheck()





















