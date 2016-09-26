//
//  qiuRiCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class qiuRiCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var nameL: UILabel!
    
    
    @IBOutlet weak var jingleL: UILabel!
    
    
    @IBOutlet weak var priceL: UILabel!
    

    @IBOutlet weak var marketPriceL: UILabel!
    
    
    @IBOutlet weak var saleNumL: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
