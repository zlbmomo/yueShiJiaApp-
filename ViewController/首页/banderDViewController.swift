//
//  banderDViewController.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class banderDViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var titles:String!
    
    
    var headerView:UIView!
    
    
    
    
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRectMake(0, 64, SCREEN_W, SCREEN_H))
        
        
        tableView.tableHeaderView = self.headerView
        
        
        
        tableView.registerNib(UINib.init(nibName: "qiuRiCell", bundle: nil), forCellReuseIdentifier: "qiuRiCell")
        
        
        
        tableView.delegate = self
        
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        
        
        return tableView
        
        
        
        
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.cyanColor()
        
        self.navigationItem.title = titles
        
        self.custom()
        
        
        self.loadData()
        
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
        
        
    }
    
    
    
    
    func custom(){
        
        
        let buttonone = UIButton.init(frame: CGRectMake(0, 0, 40, 40))
//        buttonone.backgroundColor = UIColor.redColor()
        buttonone.setTitle("<", forState: .Normal)
        buttonone.titleLabel?.font = UIFont.systemFontOfSize(40)
        
        buttonone.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        buttonone.addTarget(self, action: #selector(self.btnClick(_:)), forControlEvents: .TouchUpInside)

        
        let item = UIBarButtonItem.init(customView: buttonone)
        
        self.navigationItem.leftBarButtonItem = item
        
        let label = UILabel.init(frame: CGRectMake(0, 0, 80, 30))
//        label.backgroundColor = UIColor.grayColor()
        label.text = titles
        
        
        label.textColor = UIColor.orangeColor()
        label.textAlignment = .Center
        
        //当前页面在导航条正中间显示的view
        self.navigationItem.titleView = label
        

        
        //设置图片不允许渲染
        let image = UIImage.init(named: "购物")!.imageWithRenderingMode(.AlwaysOriginal)
        
        //用一张图片构造专用按钮
        //默认图片颜色只有透明和不透明之分，只要是不透明，都会被渲染
        //如果图片设置了不允许渲染，就会显示原始图片
        let bItem = UIBarButtonItem.init(image: image, style: .Done, target: self, action: #selector(self.itemClick))
        self.navigationItem.rightBarButtonItem = bItem
        

        
        
    }
    
    //MARK:-点击事件
    
    func itemClick(){
        
        print("收藏被点击")
    
    }
    
    func btnClick(sender:UIButton) -> Void {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    //MARK:-网络请求
    
    
    var dataArray = NSMutableArray()
    
    var specialArray = NSMutableArray()
    
    
    
    func loadData(){
        
        
        
//        BaseRequest.getWithURL("http://interface.yueshichina.com/?act=app&op=goods_special&special_id=392&key=efbd1b3105a02ff790b706f66ced4cfc&token=749a036dc06ae8b3a120848995a9f306&client=android&curpage=1", para: nil) { (data, error) in
//            
//            
//            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)!
//            
//            print(str)
//        }
        
        
        goodsListModel.requstQiuRiDataModel(String(1)) { (dataArr, specialArr, error) in
            if error == nil {
                self.dataArray.addObjectsFromArray(dataArr! as [AnyObject])
                self.specialArray = specialArr!
                
//                print(specialArr![0] as! String)
                
//                print(self.dataArray.count)
//                
//                print(specialArr!.count)
                 self.createUI()
                
                self.tableView.reloadData()
            }
        }
        
       

        
    }
    
    
    
    //MARK:-UI
    
    func createUI(){
        
        
    
        
        headerView = UIView.init(frame: CGRectMake(0, 64, SCREEN_W, 350))
        headerView.backgroundColor = UIColor.whiteColor()
        let imageView = UIImageView.init(frame: CGRectMake(0, 0, SCREEN_W, 250))
        imageView.sd_setImageWithURL(NSURL.init(string: specialArray[0] as! String))
        
        imageView.backgroundColor = UIColor.whiteColor()
        let label = UILabel.init(frame: CGRectMake(20, 280, SCREEN_W - 40, 50))
        
        label.text = specialArray[2] as! String
        
        label.numberOfLines = 0
        label.backgroundColor = UIColor.whiteColor()
        headerView.addSubview(imageView)
        headerView.addSubview(label)
        
        self.view.addSubview(headerView)
        
        
        
        
    }
    
    //MARK:-tableView协议方法
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("qiuRiCell", forIndexPath: indexPath) as! qiuRiCell
        
        let model = self.dataArray[indexPath.row] as! goodsListModel
        
        
        cell.iconView.sd_setImageWithURL(NSURL.init(string: model.goodsImage))
        cell.nameL.text = model.goodsName
        cell.jingleL.text = model.goodsJingle
        cell.priceL.text = "￥\(model.goodsPrice)"
        cell.marketPriceL.text = "原价:￥\(model.goodsMarketprice)"
        cell.saleNumL.text = "已售:\(model.goodsSalenum)件"
        
        
        return cell
        
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 500
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
