//
//  TimeBar.swift
//  AI
//
//  Created by Philips on 03/09/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class TimeBar: UIView {

    var time:CGFloat = 0.0
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        var start : CGFloat = bounds.origin.x + 0
        let path = UIBezierPath()
        path.lineWidth =  45.0
        path.move(to: CGPoint(x: start , y: bounds.height/2))
        let randomNum:UInt32 = arc4random_uniform(300)
         time = CGFloat(randomNum)
        let end = start + time
        path.addLine(to: CGPoint(x: end , y: bounds.height/2))
        UIColor.init(red:50.0/255.0 , green: 119.0/255.0, blue:229.0/255.0, alpha: 1.0).setStroke()
        path.stroke()
      
        
    }
    

}
