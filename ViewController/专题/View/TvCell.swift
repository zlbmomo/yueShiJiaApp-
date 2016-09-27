//
//  TvCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit





class TvCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource {
    
    //委托方第二步：代理指针
    weak var delegate:PushViewControllerDelegate?
    
    
    var page = 1
    
    
    
    lazy var tableView:UITableView = {
        
        
        
        let tableView = UITableView.init(frame: CGRectMake(0, 30, SCREEN_W, SCREEN_H - 64 - 49), style: .Plain)
        
        
        tableView.registerNib(UINib.init(nibName: "topicTVTableViewCell", bundle: nil), forCellReuseIdentifier: "topicTVTableViewCell")
        
        self.contentView.addSubview(tableView)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            
            self.page = 1
            self.loadData()
            
        })
        
        
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            
            
            self.page += 1
            
            
            if self.page > 2{
                tableView.mj_footer.endRefreshing()
                return
            }
            self.loadData()
        })
        
        
        
        
        
        //进入时就直接下拉刷新展示第一页数据
        tableView.mj_header.beginRefreshing()
        

        
        
        return tableView
        
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.whiteColor()
    
        self.loadData()
    }
    
    
    var dataArr = NSMutableArray()
    
    var totalPage:NSInteger
    
    
    func loadData(){
//        BaseRequest.getWithURL("http://interface.yueshichina.com/?act=app&op=special_programa&special_type=1&key=efbd1b3105a02ff790b706f66ced4cfc&token=749a036dc06ae8b3a120848995a9f306&client=android&curpage=1", para: nil) { (data, error) in
//            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)!
//            print(str)
//        }
        
        
        
        
        topicTVModel.requestTopicTVData(1, page: self.page) { (TVArr, totalPage, error) in
            if error == nil {
                
                
                if self.page == 1
                {
                    self.dataArr.removeAllObjects()
                }
                self.dataArr.addObjectsFromArray(TVArr!)
                
                //                print(self.dataArr)
                
                
                self.totalPage = totalPage
                
                print(self.totalPage)
                
                
                self.tableView.reloadData()
                
                //关闭加载状态
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
                
                
                
            }
            
        }

        }
        
//        
//        topicTVModel.requestTopicTVData(1,page: self.page) { (TVArr, error) in
//            
//            if error == nil {
//                
//                
//                if self.page == 1
//                {
//                    self.dataArr.removeAllObjects()
//                }
//                self.dataArr.addObjectsFromArray(TVArr!)
//                
////                print(self.dataArr)
//                
//                
//                self.tableView.reloadData()
//                
//                //关闭加载状态
//                self.tableView.mj_header.endRefreshing()
//                self.tableView.mj_footer.endRefreshing()
//                
//
//                
//            }
//            
//        }
//        
//        
//    }
    
    
    //MARK:-UITableView协议方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("topicTVTableViewCell", forIndexPath: indexPath) as! topicTVTableViewCell
        
        let model = dataArr[indexPath.row] as! topicTVModel
        
        cell.iconImage.sd_setImageWithURL(NSURL.init(string: model.articleImage!))
        cell.videoLengthL.text = model.videoLength
        cell.titleL.text = model.articleTitle
        cell.abstractL.text = model.articleAbstract
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 450
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let model = dataArr[indexPath.row] as! topicTVModel
        let play = model.articleVideo
        
        let playTV = playViewController()
        playTV.playTVideo = play
        
        
        //委托方第三步回调
        self.delegate?.pushViewController(playTV)
        
        
        
    }
    
   
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
