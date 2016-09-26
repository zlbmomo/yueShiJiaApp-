//
//  exeTableViewCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class exeTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var virtualL: UILabel!
    
    
    @IBOutlet weak var nameL: UILabel!
    
    
    
    @IBOutlet weak var hint_virtualL: UILabel!
   
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
