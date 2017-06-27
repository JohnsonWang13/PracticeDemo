//
//  drawButton.swift
//  drawButton
//
//  Created by 王富生 on 2017/4/20.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit
import CoreGraphics

class DrawButton: UIButton {

    var path: UIBezierPath!
    var bezierPath = UIBezierPath()
    var rect: CGRect?
    
    override func awakeFromNib() {
        backgroundColor = UIColor.green
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        
        let transform = CGAffineTransform.init(rotationAngle: CGFloat(50))
        self.transform = transform
        
        rect = self.frame
    }
    
    override func draw(_ rect: CGRect) {
        
//        let π: CGFloat = CGFloat.pi
//        
//        let outLineColor: UIColor = .black
//        
//        let center = CGPoint(x: 10, y: bounds.height)
//        let radius: CGFloat = min(bounds.width, bounds.height)
//        let startAngle: CGFloat = π * 6 / 4
//        let endAngle: CGFloat = startAngle + (2 * π / 12)
//        
//        path = UIBezierPath(arcCenter: center,
//                                       radius: radius - 20,
//                                       startAngle: startAngle,
//                                       endAngle: endAngle,
//                                       clockwise: true)
//        
//        path.addArc(withCenter: center,
//                           radius: radius - 80,
//                           startAngle: endAngle,
//                           endAngle: startAngle,
//                           clockwise: false)
//        
//        path.close()
//        outLineColor.setStroke()
//        path.stroke()
        

        bezierPath.move(to: CGPoint(x: 264/528 * rect.width, y: -3/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 0, y: 33/369 * rect.height), controlPoint1: CGPoint(x: 133/528 * rect.width, y: -3/369 * rect.height), controlPoint2: CGPoint(x: 0, y: 33/369 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 92/528 * rect.width, y: 366/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 264/528 * rect.width, y: 342/369 * rect.height), controlPoint1: CGPoint(x: 92/528 * rect.width, y: 366/369 * rect.height), controlPoint2: CGPoint(x: 177.25/528 * rect.width, y: 342/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 439/528 * rect.width, y: 366/369 * rect.height), controlPoint1: CGPoint(x: 350.75/528 * rect.width, y: 342/369 * rect.height), controlPoint2: CGPoint(x: 439/528 * rect.width, y: 366/369 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 524/528 * rect.width, y: 33/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 264/528 * rect.width, y: -3/369 * rect.height), controlPoint1: CGPoint(x: 524/528 * rect.width, y: 33/369 * rect.height), controlPoint2: CGPoint(x: 395/528 * rect.width, y: -3/369 * rect.height))
        bezierPath.close()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
    }
    
    func touchDown(button: DrawButton, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            
            if bezierPath.contains(location) == false {
                button.cancelTracking(with: nil)
            }
        }
    }
}



