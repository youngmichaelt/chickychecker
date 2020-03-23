//
//  Draw.swift
//  chickyCheckerv3
//
//  Created by Mac on 5/18/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class Draw: UIView {
    
    var isTouching = false
    var pointColor: CGColor = UIColor.black.cgColor
    
    var i = 0
    var xList : [Int] = []
    var yList : [Int] = []
    var xList2 : [Int] = []
    var yList2 : [Int] = []
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if i == 0 {
            
            guard !isTouching else {return}
            isTouching = true
            guard let touch = touches.first else {return}
            let currentPoint = touch.location(in: self)
            let x = Int(currentPoint.x)
            let y = Int(currentPoint.y)
            xList.append(x)
            yList.append(y)
            
            isTouching = false
            setNeedsDisplay()
            
        }
        
        if i >= 1{
            guard !isTouching else { return}
            isTouching = true
            guard let touch = touches.first else {return}
            let currentPoint = touch.location(in: self)
            let x = Int(currentPoint.x)
            let y = Int(currentPoint.y)
            xList2.append(x)
            yList2.append(y)
            
            isTouching = false
            setNeedsDisplay()
        }
        
    }
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(5)
        context?.beginPath()
        
        if xList.count > 1{
            context?.move(to: CGPoint(x:xList[0], y:yList[0]))
            context?.addLine(to: CGPoint(x:xList[1], y:yList[1]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
        }
        if xList.count > 2{
            context?.move(to: CGPoint(x:xList[1], y:yList[1]))
            context?.addLine(to: CGPoint(x:xList[2], y:yList[2]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
        }
        if xList.count > 3{
            context?.move(to: CGPoint(x:xList[2], y:yList[2]))
            context?.addLine(to: CGPoint(x:xList[3], y:yList[3]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            context?.move(to: CGPoint(x:xList[3], y:yList[3]))
            context?.addLine(to: CGPoint(x:xList[0], y:yList[0]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            
            i+=1
        }
        if xList2.count > 1 {
            context?.move(to: CGPoint(x:xList2[0], y:yList2[0]))
            context?.addLine(to: CGPoint(x:xList2[1], y:yList2[1]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
        }
        if xList2.count > 2 {
            context?.move(to: CGPoint(x:xList2[1], y:yList2[1]))
            context?.addLine(to: CGPoint(x:xList2[2], y:yList2[2]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
        }
        if xList2.count > 3 {
            context?.move(to: CGPoint(x:xList2[2], y:yList2[2]))
            context?.addLine(to: CGPoint(x:xList2[3], y:yList2[3]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            context?.move(to: CGPoint(x:xList2[3], y:yList2[3]))
            context?.addLine(to: CGPoint(x:xList2[0], y:yList2[0]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            
        }
        
        
    }
    
    
    func erase(){
        xList.removeAll()
        yList.removeAll()
        xList2.removeAll()
        yList2.removeAll()
        
        setNeedsDisplay()
        i = 0
    }
    
    
}

