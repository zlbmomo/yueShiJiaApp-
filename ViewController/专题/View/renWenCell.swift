//
//  renWenCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class renWenCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource {
    
    
    lazy var tableView:UITableView = {
        
        
        
        let tableView = UITableView.init(frame: CGRectMake(0, 30, SCREEN_W, SCREEN_H - 64 - 49), style: .Plain)
        
        
        tableView.registerNib(UINib.init(nibName: "renWenTableViewCell", bundle: nil), forCellReuseIdentifier: "renWenTableViewCell")
        
        self.contentView.addSubview(tableView)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        return tableView
        
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.whiteColor()
        self.loadData()
    }
    
    
    var dataArr = NSMutableArray()
    
    func loadData(){
        
        topicTVModel.requestTopicTVData(4,page: 1) { (TVArr, error) in
        
            if error == nil {
                self.dataArr.addObjectsFromArray(TVArr!)
                
                self.tableView.reloadData()
            }
        }
        
        }
    
    
    
    //MARK:-tableView协议方法
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("renWenTableViewCell", forIndexPath: indexPath) as! renWenTableViewCell
        let model = dataArr[indexPath.row] as! topicTVModel
        
        cell.iconImage.sd_setImageWithURL(NSURL.init(string: model.articleImage!))
        cell.titleL.text = model.articleTitle
        cell.abstractL.text = model.articleAbstract
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 550
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
