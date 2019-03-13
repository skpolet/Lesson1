//
//  avatarView.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 13/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable class AvatarView: UIImageView {
    
    @IBInspectable var roundedView: CGFloat = 0 {
        didSet {
            self.updateRounded()
        }
    }
    
    @IBInspectable var shadowOffSetWidth: CGFloat = 0 {
        didSet {
            self.updateShadowOffSetWidth()
        }
    }
    
    @IBInspectable var shadowOffSetHeight: CGFloat = 0 {
        didSet {
            self.updateShadowOffSetHeight()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            self.updateShadowOpacity()
        }
    }
    
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    func updateRounded(){
        self.gradientLayer.cornerRadius = roundedView
        self.gradientLayer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    func updateShadowOpacity(){
        self.gradientLayer.shadowOpacity = shadowOpacity
    }
    
    func updateShadowOffSetWidth(){
        self.gradientLayer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
    }
    
    func updateShadowOffSetHeight(){
        self.gradientLayer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
    }
}
