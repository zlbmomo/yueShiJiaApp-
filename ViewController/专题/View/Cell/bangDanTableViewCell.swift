//
//  bangDanTableViewCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class bangDanTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var abstractL: UILabel!
    
    @IBOutlet weak var topL: UILabel!
    
    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var originL: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
