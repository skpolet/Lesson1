//
//  DescriptionGroupCell.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 16/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import UIKit

class DescriptionGroupCell: UITableViewCell {

    @IBOutlet weak var nameGroup: UILabel!
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var moreInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tapLike = UITapGestureRecognizer(target: self, action: #selector(onTapLike(recognizer:)))
        let tapMoreInfo = UITapGestureRecognizer(target: self, action: #selector(onTapMoreInfo(recognizer:)))
        
        heart.isUserInteractionEnabled = true
        heart.addGestureRecognizer(tapLike)
        moreInfo.isUserInteractionEnabled = true
        moreInfo.addGestureRecognizer(tapMoreInfo)
        
        
        
    }
    
    @objc func onTapLike(recognizer:UITapGestureRecognizer) {
        guard let text = heartCount.text, let likes = Int(text) else { return }
        if heart.alpha == 0.5 {
            heart.alpha    = 1
            heartCount.text      = "\(likes+1)"
        } else {
            heart.alpha    = 0.5
            heartCount.text      = "\(likes-1)"
        }
    }
    
    @objc func onTapMoreInfo(recognizer:UITapGestureRecognizer) {
        guard  moreInfo.text == "Подробоне описание группы" else {return}
        
        let singleton = GlobalData.sharedGlobal
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIBezierPath {
    convenience init(heartIn rect: CGRect) {
        self.init()
        
        //Calculate Radius of Arcs using Pythagoras
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
        
        //Left Hand Curve
        self.addArc(withCenter: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        
        //Top Centre Dip
        self.addLine(to: CGPoint(x: rect.width/2, y: rect.height * 0.2))
        
        //Right Hand Curve
        self.addArc(withCenter: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)
        
        //Right Bottom Line
        self.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))
        
        //Left Bottom Line
        self.close()
    }
}

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}
