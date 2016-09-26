//
//  zhiShiTableViewCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class zhiShiTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImage: UIImageView!
    
    
    @IBOutlet weak var biaozhiL: UILabel!
    
    
    
    @IBOutlet weak var titleL: UILabel!
    
    
    
    @IBOutlet weak var abstractL: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
