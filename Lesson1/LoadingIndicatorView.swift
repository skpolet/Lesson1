//
//  LoadingIndicatorView.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 24/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import UIKit

class LoadingIndicatorView: UIView {

    @IBOutlet var circle1: UIView!
    @IBOutlet var circle2: UIView!
    
    @IBOutlet var circle3: UIView!
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
    }
    
    override func draw(_ rect: CGRect) {
        backgroundColor = UIColor.white.withAlphaComponent(0)
        
        circle1.layer.cornerRadius = 5.0
        circle1.clipsToBounds = true
        circle2.layer.cornerRadius = 5.0
        circle2.clipsToBounds = true
        circle3.layer.cornerRadius = 5.0
        circle3.clipsToBounds = true
        
        circle1.backgroundColor = UIColor.gray
        circle2.backgroundColor = UIColor.gray
        circle3.backgroundColor = UIColor.gray
    }
    
    func startLoading(){
        UIView.animate(withDuration: 2, delay: 0.5,
                       options: [.repeat,.autoreverse], animations: {
                        self.circle1.alpha = 0
        }, completion: nil)
        UIView.animate(withDuration: 2, delay: 1,
                       options: [.repeat,.autoreverse], animations: {
                        self.circle2.alpha = 0
        }, completion: nil)
        UIView.animate(withDuration: 2, delay: 1.5,
                       options: [.repeat,.autoreverse], animations: {
                        self.circle3.alpha = 0
        }, completion: nil)
    }
    

}
