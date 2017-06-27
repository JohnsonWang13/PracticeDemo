//
//  ViewController.swift
//  GCD DEMO
//
//  Created by 王富生 on 2017/1/5.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        Thread.sleep(forTimeInterval: 5)
        print("Start")
//        dispatchQueue()
//        dispatchQos()
//        dispatchTime()
//        dispatchGroup()
        dispatchWorkItem()
        
    }

    
    func dispatchQueue() {
        let queue = DispatchQueue(label: "1", qos: .userInitiated)
        
        queue.async {
            
            10.times {
                print("1️⃣")
            }
        }
        
        10.times {
            print("2️⃣")
        }
    }
    
    func dispatchQos() {
        
        let queue1 = DispatchQueue(label: "1", qos: .userInitiated)
        let queue2 = DispatchQueue(label: "2", qos: .default)
        let queue3 = DispatchQueue(label: "3", qos: .utility)
        
        queue1.async {
            100.times {
                print("🔴")
            }
        }
        
        queue2.async {
            100.times {
                print("🔵")
            }
        }
        
        queue3.async {
            100.times {
                print("⚫️")
            }
        }
    }
    
    func dispatchTime() {
    
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            print("after 5 sec")
            
        }
    }
    
    func dispatchGroup() {
        
        let dispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "1")
        let queue2 = DispatchQueue(label: "2")
        
        queue1.async(group: dispatchGroup) {
            10.times {
                print("1")
            }
        }
        
        queue2.async(group: dispatchGroup) {
            10.times {
                print("2")
            }
        }
        dispatchGroup.notify(queue: .main) {
            print("End")
        }
    }
    
    func dispatchWorkItem() {
        
        let queue = DispatchQueue(label: "1", qos: .default)
        let workItem = DispatchWorkItem {
            10.times {
            print("workItem")
            }
        }
        DispatchQueue.main.async {
            10.times {
                print("1")
            }
        }
        queue.async(execute: workItem)
        DispatchQueue.global().async(execute: workItem)
    }
    
}

extension Int {
    func times(block:() -> ()) {
        for _ in 1...self {
            block()
        }
    }
}

