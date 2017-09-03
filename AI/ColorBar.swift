//
//  ColorBar.swift
//  TimerWatch_CG
//
//  Created by Philips on 13/03/17.
//  Copyright © 2017 SDI Channel. All rights reserved.
//

import UIKit

@IBDesignable class ColorBar: UIView {

  
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // Drawing code
        
        self.backgroundColor = UIColor.lightGray
        
        var start : CGFloat = bounds.origin.x + 0 
        let width = bounds.width - 0
        
        var red : CGFloat = 239.0
        var green: CGFloat = 72.0
        var blue:CGFloat = 54.0
        var i: Int = 1
        repeat
        {
          
            let path = UIBezierPath()
            path.lineWidth =  45.0
            path.move(to: CGPoint(x: start , y: bounds.height/2))
            let end = start + 90
            path.addLine(to: CGPoint(x: end , y: bounds.height/2))
            start = end
            switch i {
            case 1:
                 red  = 239.0
                 green  = 72.0
                 blue = 54.0
            case 2:
                red  = 248.0
                green = 148.0
                blue = 6.0
            default:
                red  = 0.0
                green = 177.0
                blue = 106.0
            }
            UIColor.init(red:red/255.0 , green: green/255.0, blue:blue/255.0, alpha: 1.0).setStroke()
             i += 1
//            red = red + 40.0
//            blue = blue + 10.0
//            green = green + 30.0
            print("\(red) : \(green) : \(blue)")
            path.stroke()
        } while(start<width)

        
        
    }
 

}
