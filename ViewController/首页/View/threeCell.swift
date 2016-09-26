//
//  threeCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class threeCell: UITableViewCell {
    
    
    @IBOutlet weak var iconimage: UIImageView!
    
    
    @IBOutlet weak var littleimage:
    
    
    UIImageView!
    

    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var jingleL: UILabel!
    
    @IBOutlet weak var priceBtn: UIButton!
    
    @IBOutlet weak var collectionBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func priceB(sender: UIButton) {
    }
    
    
    @IBAction func collectinB(sender: UIButton) {
    }
    
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
