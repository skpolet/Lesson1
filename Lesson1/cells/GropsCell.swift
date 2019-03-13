//
//  GropsCell.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 08/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import UIKit

class GropsCell: UITableViewCell {

    @IBOutlet weak var groupPhoto: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var aboutGroup: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
