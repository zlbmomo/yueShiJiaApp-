//
//  FirstViewController.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,fiveCellDataSource {
    
    
    
    var page = 1
    
    
    var myView = MyScrollView()
    var label = UILabel()
    
    lazy var tableView:UITableView = {
        
        
        let tableView = UITableView.init(frame: CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49))
        
        
        tableView.tableHeaderView = self.myView
        
        
        tableView.registerNib(UINib.init(nibName: "OneCell", bundle: nil), forCellReuseIdentifier: "OneCell")
        tableView.registerNib(UINib.init(nibName: "twoCell", bundle: nil), forCellReuseIdentifier: "twoCell")
        tableView.registerNib(UINib.init(nibName: "threeCell", bundle: nil), forCellReuseIdentifier: "threeCell")
        tableView.registerNib(UINib.init(nibName: "fourCell", bundle: nil), forCellReuseIdentifier: "fourCell")
        tableView.registerNib(UINib.init(nibName: "fiveCell", bundle: nil), forCellReuseIdentifier: "fiveCell")
        
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            
            self.page = 1
            self.loadHomeData()
            
        })
        
        
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            
            
            self.page += 1
            
            
            if self.page > 2{
                tableView.mj_footer.endRefreshing()
                return
            }
            self.loadHomeData()
        })
        
        
        
        
    
        //进入时就直接下拉刷新展示第一页数据
        tableView.mj_header.beginRefreshing()

        return tableView
        
    }()
    
    
    
    
    var oArr = NSMutableArray()
    var banArr = NSMutableArray()
    var bArr = NSMutableArray()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.custom()
        
        self.loadHomeData()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
    }
    
    
    
    
    
    func createUI(){
        
        myView = MyScrollView.init(frame: CGRectMake(0, 0, SCREEN_W, 400))
        
        myView.backgroundColor = UIColor.redColor()
        
        myView.scrollVIew.contentSize = CGSizeMake(CGFloat(banArr.count) * SCREEN_W, 0)
        
        
        for i in 0...banArr.count - 1 {
            
            
            let imageV = UIImageView.init(frame: CGRectMake(CGFloat(i) * SCREEN_W, 0, SCREEN_W, 350))
            
            imageV.userInteractionEnabled = true
            
            imageV.tag = 100 + i
            
            let model = banArr[i] as! bannerModel
            
            
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.tapClick(_:)))
            
            imageV.addGestureRecognizer(tap)
            
            myView.scrollVIew.addSubview(imageV)
            
            imageV.sd_setImageWithURL(NSURL.init(string:model.advertImg))
            
            
        }
        
       
        
    
        
        label = UILabel.init(frame: CGRectMake(0, 350, SCREEN_W, 50))
        
        label.backgroundColor = UIColor.whiteColor()

        label.font = UIFont.systemFontOfSize(18)

        label.text = "YUESHI CHOSEN"
        label.textAlignment = .Center

        label.textColor = UIColor.orangeColor()
        myView.addSubview(label)
        
        
        
    }
    
    //MARK:-轮播视图被点击
    
    func tapClick(tapGR: UITapGestureRecognizer){
//        print("图片被点击")
        
        let imageview = tapGR.view as! UIImageView
        let i = imageview.tag - 100 + 1
        
        let titlemodel = banArr[i] as! bannerModel
        
        
        if titlemodel.advertId == String(105){
            let bd = banderDViewController()
            
            bd.titles = titlemodel.advertTitle

            
            //        print("\(bd.image)")
            
            
            bd.hidesBottomBarWhenPushed = true
            
            self.navigationController?.pushViewController(bd, animated: true)
            
        }
        
        if titlemodel.advertId == String(74) {
            
            
            let bdt = bannerDTViewController()
            
            
            bdt.titles = titlemodel.advertTitle
            
            bdt.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(bdt, animated: true)
            
            
        }
        
        
        if titlemodel.advertId == String(50){
            let bdthree = bannerDThreeViewController()
            bdthree.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(bdthree, animated: true)
        }

        
        
    }
    
    
    
    
    
    //MARK:-数据加载完
    
    func loadHomeData(){
        
        HDManager.startLoading()
        
        HomeModel.requestHomeData(self.page) { (bannerArr, oneArr, error) in
            if error == nil{
                
                
                if self.page == 1{
                    self.oArr.removeAllObjects()
                    self.banArr.addObjectsFromArray(bannerArr!)
                    
//                    print(self.banArr.count)
                    
                    
                    self.banArr.insertObject(self.banArr[self.banArr.count - 1], atIndex: 0)
                    self.banArr.addObject(self.banArr[1])
                    
                    self.createUI()
                    
                    
                    

                
                }
                
                self.oArr.addObjectsFromArray(oneArr!)
    
                
                
                self.tableView.reloadData()
                
                
                //关闭加载状态
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
        
    
                HDManager.stopLoading()
                
            }
        
       }
    
    }
    
    
    //MARK:-导航条设置
    
    
    func custom(){
        
        
        
        let label = UILabel.init(frame: CGRectMake(0, 0, 60, 30))
        label.text = "FOOD"
        label.font = UIFont.systemFontOfSize(30)
        
        
        label.font = UIFont.boldSystemFontOfSize(30)
        label.textColor = UIColor.orangeColor()
        label.textAlignment = .Center
        self.navigationItem.titleView = label
        let btn = UIButton.init(frame: CGRectMake(0, 0, 40, 40))
        btn.setBackgroundImage(UIImage.init(named: "搜索"), forState: .Normal)
        btn.addTarget(self, action: #selector(self.findClick), forControlEvents: .TouchUpInside)
        let item = UIBarButtonItem.init(customView: btn)
        
        self.navigationItem.rightBarButtonItem = item

    }
    
    
    func findClick(){
        print("搜索被点击")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:-tableView
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
//        print(self.oArr.count)
        return self.oArr.count
        
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let model = self.oArr[indexPath.row] as! HomeModel
        
//        print(model)
        
        
        let type = model.relationObjectType 
        

        
        //只有文字
        if type == String(1) {
            let cell = tableView.dequeueReusableCellWithIdentifier("OneCell", forIndexPath: indexPath) as! OneCell
            
            cell.iconImage.sd_setImageWithURL(NSURL.init(string: model.relationObjectImage))
            
            cell.titleL.text = model.relationObjectTitle
            cell.jingleL.text = model.relationObjectJingle
            
            return cell
           
        //有视频的
        }else if type == String(5){
            
            
            let cell = tableView.dequeueReusableCellWithIdentifier("twoCell", forIndexPath: indexPath) as! twoCell
            
            cell.iconImage.sd_setImageWithURL(NSURL.init(string: model.relationObjectImage))
            cell.titleL.text = model.relationObjectTitle
            cell.jingleL.text = model.relationObjectJingle
            cell.timeL.text = model.videoLength
            
            
            
            return cell
            
            
        //有价格的
        }else if type == String(2){
            let cell = tableView.dequeueReusableCellWithIdentifier("threeCell", forIndexPath: indexPath) as! threeCell
            
            
            cell.iconimage.sd_setImageWithURL(NSURL.init(string: model.relationObjectImage))
            cell.titleL.text = model.relationObjectTitle
            cell.jingleL.text = model.relationObjectJingle
            cell.priceBtn.setTitle("￥\(model.goodsPrice!)", forState: .Normal)
            cell.littleimage.sd_setImageWithURL(NSURL.init(string: model.tagPrint))
            
            return cell
        
            //只有一张图片的
        }else if type == String(6){
            let cell = tableView.dequeueReusableCellWithIdentifier("fourCell", forIndexPath: indexPath) as! fourCell
            
            
            cell.iconimage.sd_setImageWithURL(NSURL.init(string: model.relationObjectImage))
            
            
            return cell
            
            //有collectionView的
        }else if type == String(4){
            let cell = tableView.dequeueReusableCellWithIdentifier("fiveCell", forIndexPath: indexPath) as! fiveCell
            
            
            
            
            //成为代理
            
            cell.indexPath = indexPath
            
            
//            cell.delegate = self
            
            cell.dataSouce = self
            
            
            
            cell.iconimage.sd_setImageWithURL(NSURL.init(string: model.relationObjectImage))
            
            
            
//            cell.collectionVIew.reloadData()
            
           
            
            
            return cell
            
            
            
            
        }else{
            
            return UITableViewCell()
            
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        
        let model = self.oArr[indexPath.row] as! HomeModel
        
        let type = model.relationObjectType
        
        
        if type == String(5){
            return 360
        }else if type == String(2){
            return 380
        }else if type == String(6){
            return 100
        }else if type == String(4){
            return 400
        }else{
            return 660
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let model = self.oArr[indexPath.row] as! HomeModel
        
        let type = model.relationObjectType
        
        
        if type == String(1){
            
        }else if type == String(5){
            
        }else if type == String(2){
            
            let typeTwo = typeTwoViewController()
            
            typeTwo.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(typeTwo, animated: true)
            
        }else if type == String(6){
            
        }else{
            
        }
        

    }
    
    
    
    
    
    
    //MARK:协议方法
    func numberOfItemsInRow(row: NSInteger) -> NSInteger {
        
        let model = self.oArr[row] as! HomeModel
        return (model.goodsSpecialList?.count)!
    }
    
    func cellForItemInRow(row: NSInteger, index: NSInteger, collectionView: UICollectionView) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("detailCell", forIndexPath: NSIndexPath.init(forRow: index, inSection: 0)) as! detailCell
        
        let home = self.oArr[row] as! HomeModel
        let goods = home.goodsSpecialList![index] as! goodsSpecialListModel
        
        
        cell.iconimage.sd_setImageWithURL(NSURL.init(string: goods.goodsImg))
        
        cell.goodnameL.text = goods.goodsName
        cell.goodpriceL.text = "￥\(goods.goodsPrice)"
        
        return cell
        
        
        
    }
    
    func sizeForItemInRow(row: NSInteger, index: NSInteger) -> CGSize {
        return CGSizeMake(130, 160)
    }
    
        
}
    

   

