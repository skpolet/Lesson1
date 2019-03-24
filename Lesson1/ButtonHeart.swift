//
//  ButtonHeart.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 24/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class HeartButton: UIButton {

    @IBInspectable var filled: Bool = true
    @IBInspectable var strokeWidth: CGFloat = 2.0
    
    @IBInspectable var strokeColor: UIColor?
    var bezierPath: UIBezierPath = UIBezierPath()
    
    override func draw(_ rect: CGRect) {
        bezierPath = UIBezierPath(heartIn: self.bounds)
        
        if self.strokeColor != nil {
            self.strokeColor!.setStroke()
        } else {
            self.tintColor.setStroke()
        }
        
        bezierPath.lineWidth = self.strokeWidth
        bezierPath.stroke()
        
        if self.filled {
            self.tintColor.setFill()
            bezierPath.fill()
        }
    }
}
