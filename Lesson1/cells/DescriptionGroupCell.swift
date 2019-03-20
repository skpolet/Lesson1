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
