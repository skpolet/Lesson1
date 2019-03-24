//
//  LoadingScreen.swift
//  VKWay
//
//  Created by Cayenne on 21/03/2019.
//  Copyright © 2019 Cayenne. All rights reserved.
//

import UIKit


class LoadingScreen: UIView {
    
    
    @IBOutlet var state0: UIImageView!
    @IBOutlet var state50: UIImageView!
    @IBOutlet var state100: UIImageView!
    
    
    override func awakeFromNib() {
      
        super.awakeFromNib()
        
        backgroundColor = UIColor.white.withAlphaComponent(0)
        
        state0.image = state0.image?.withRenderingMode(.alwaysTemplate)
        state50.image = state50.image?.withRenderingMode(.alwaysTemplate)
        state100.image = state100.image?.withRenderingMode(.alwaysTemplate)
        
        state0.layer.cornerRadius   = 5
        state0.layer.masksToBounds  = true
        state0.layer.borderColor    = UIColor.gray.cgColor
        state0.layer.borderWidth    = 1
        
        state50.layer.cornerRadius   = 5
        state50.layer.masksToBounds  = true
        state50.layer.borderColor    = UIColor.gray.cgColor
        state50.layer.borderWidth    = 1
        
        state100.layer.cornerRadius   = 5
        state100.layer.masksToBounds  = true
        state100.layer.borderColor    = UIColor.gray.cgColor
        state100.layer.borderWidth    = 1
        
    }
    
    func startLoading() {
    

        
//        UIView.animate(withDuration: 0.5, animations: {
//            self.state0.alpha = 1
//        }) { (_) in
//            UIView.animate(withDuration: 0.5, animations: {
//                self.state0.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
//                self.state0.layer.borderWidth = 0
//                self.state50.alpha = 1
//                self.state100.alpha = 1
//            }, completion: { (_) in
//                UIView.animate(withDuration: 0.5, animations: {
//                    self.state50.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
//                    self.state100.alpha = 1
//                    self.state50.layer.borderWidth = 0
//                }, completion: { (_) in
//                    UIView.animate(withDuration: 0.5, animations: {
//                        self.state100.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
//                        self.state100.layer.borderWidth = 0
//                    })
//                })
//            })
//        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5,
                       options: [.repeat,.autoreverse], animations: {
                        //self.circle1.alpha = 0
                        self.state0.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                        self.state0.layer.borderWidth = 0
                        self.state0.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 1,
                       options: [.repeat,.autoreverse], animations: {
                        self.state50.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                        self.state50.layer.borderWidth = 0
                        self.state50.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 1.5,
                       options: [.repeat,.autoreverse], animations: {
                        self.state100.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                        self.state100.layer.borderWidth = 0
                        self.state100.alpha = 1
        }, completion: nil)
        
    }
    
    
}
