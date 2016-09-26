//
//  twoCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class twoCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImage: UIImageView!
    
    
    @IBOutlet weak var jingleL: UILabel!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var timeL: UILabel!
    
    
    
    
    
    
    
    
    @IBAction func playCLick(sender: UIButton) {
        
        
        
    }
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        timeL.textColor = UIColor.whiteColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
