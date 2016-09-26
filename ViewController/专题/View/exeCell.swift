//
//  exeCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class exeCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    lazy var tableView:UITableView = {
        
        
        
        let tableView = UITableView.init(frame: CGRectMake(0, 30, SCREEN_W, SCREEN_H - 64 - 49), style: .Plain)
        
        
        tableView.registerNib(UINib.init(nibName: "exeTableViewCell", bundle: nil), forCellReuseIdentifier: "exeTableViewCell")
        
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
        
        ActiveModel.requestTopicTVData(6) { (TVArr, error) in
            if error == nil{
                self.dataArr.addObjectsFromArray(TVArr!)
                
                
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    //MARK:-UITableView协议方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("exeTableViewCell", forIndexPath: indexPath) as! exeTableViewCell
        let model = dataArr[indexPath.row] as! ActiveModel
        
        
        cell.iconImage.sd_setImageWithURL(NSURL.init(string: model.goodsImage))
        
        
        cell.virtualL.text = model.endVirtual
        cell.nameL.text = model.goodsName
        cell.hint_virtualL.text = model.hintVirtual
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
