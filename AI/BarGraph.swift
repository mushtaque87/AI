//
//  BarGraph.swift
//  AI
//
//  Created by Philips on 04/09/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class BarGraph: UIView {

    var time:CGFloat = 0.0
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawXaxis()
        drawYaxis()
        print(bounds.origin.x)
        print(bounds.height)
        print(bounds.origin.x + bounds.width)
        var count: Int = 0
        var start : CGFloat = bounds.origin.x  + 50
        print (start)
         print ("--------")
        repeat
        {
        
        let path = UIBezierPath()
        path.lineWidth =  40.0
        path.move(to: CGPoint(x: start  , y:  bounds.height - 10))
        let randomNum:UInt32 = arc4random_uniform(150)
        time = CGFloat(randomNum)
        print(time)
        let end = (bounds.height - 10) - time
        path.addLine(to: CGPoint(x: start  , y: end))
        if(count == 0)
        {
        UIColor.init(red:238.0/255.0 , green: 94.0/255.0, blue:94.0/255.0, alpha: 1.0).setStroke()
        }
        else if(count == 1)
        {
            UIColor.init(red:255.0/255.0 , green: 255.0/255.0, blue:60.0/255.0, alpha: 1.0).setStroke()
        }
        else if(count == 2)
        {
            UIColor.init(red:51.0/255.0 , green: 255.0/255.0, blue:153.0/255.0, alpha: 1.0).setStroke()
            }
        else if(count == 3)
        {
            UIColor.init(red:255.0/255.0 , green: 102.0/255.0, blue:178.0/255.0, alpha: 1.0).setStroke()
        }
        else if(count == 4)
        {
            UIColor.init(red:50.0/255.0 , green: 119.0/255.0, blue:229.0/255.0, alpha: 1.0).setStroke()
            }
            
        path.stroke()
        count += 1
        start = start + 60
        } while(count < 5)
        
    }
    
    func drawXaxis()
    {
         var start : CGFloat = bounds.origin.x  + 10
        let path = UIBezierPath()
        path.lineWidth =  1.0
        path.move(to: CGPoint(x: start  , y:  bounds.origin.y + 5))
        path.addLine(to: CGPoint(x: start  , y: bounds.origin.y + (bounds.height  - 5.0)))
        UIColor.black.setStroke()
        path.stroke()
    }
 
    func drawYaxis()
    {
        var start : CGFloat = bounds.origin.x  + 10
        let path = UIBezierPath()
        path.lineWidth =  1.0
        path.move(to: CGPoint(x: start  , y:  bounds.origin.y + (bounds.height  - 5.0)))
        path.addLine(to: CGPoint(x: start + (bounds.width - 15.0) , y: bounds.origin.y + (bounds.height  - 5.0)))
        UIColor.black.setStroke()
        path.stroke()
    }
}
