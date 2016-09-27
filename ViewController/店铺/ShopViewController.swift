//
//  ShopViewController.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class ShopViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    lazy var tableView:UITableView = {
        
        let tableView = UITableView.init(frame: CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49), style: UITableViewStyle.Grouped)
        
        
        tableView.tableHeaderView = self.headerView
        
        
        tableView.registerNib(UINib.init(nibName: "queryCell", bundle: nil), forCellReuseIdentifier: "queryCell")
        
        
        tableView.registerNib(UINib.init(nibName: "channelCell", bundle: nil), forCellReuseIdentifier: "channelCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        return tableView
    }()
    //组合轮播视图和 分类按钮两个子视图
    lazy var headerView:UIView = {
        
        let headerView = UIView.init(frame: CGRectMake(0, 0, SCREEN_W, 500))
        headerView.backgroundColor = UIColor.whiteColor()
        headerView.addSubview(self.adView)
        return headerView
    }()
    
    
    lazy var adView:XTADScrollView = {
        let adView = XTADScrollView.init(frame: CGRectMake(0, 0, SCREEN_W, 250))
        //是否启动轮播
        adView.infiniteLoop = true
        //是否显示pageControl
        adView.needPageControl = true
        //pageControl显示的位置
        adView.pageControlPositionType = pageControlPositionTypeRight
        return adView
        
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellowColor()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.loadData()
        
    }
    

    //单独一个
    var channelArray = NSMutableArray()
    //list
    var queryArray = NSMutableArray()
    //按钮
    var btnArray = NSMutableArray()
    
    
    func loadData(){
        
//        BaseRequest.getWithURL("http://interface.yueshichina.com/?act=goods_cms_special&op=cms_special&token=749a036dc06ae8b3a120848995a9f306&client=android&curpage=1", para: nil) { (data, error) in
//            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)!
//            
//            print(str)
//        }
        
        
        
        listModel.requestShopData { (bannerArr, channelArr, tagArr, listArr, error) in
            if error == nil {
                self.channelArray.addObjectsFromArray(channelArr!)
                self.queryArray.addObjectsFromArray(listArr!)
                
                
                self.btnArray.addObjectsFromArray(tagArr!)
                self.tableView.reloadData()
                //给轮播视图设置图片数组
                self.adView.imageURLArray = bannerArr
                
                self.createCategoryBtns()
            }
        }
    
        
        
        
    }
    

    //创建分类按钮
    func createCategoryBtns(){
        
        let subView = UIView.init(frame: CGRectMake(0, 250, SCREEN_W, 250))
        
        
//        subView.backgroundColor = UIColor.whiteColor()
        self.headerView.addSubview(subView)
        
        
        let space:CGFloat = 50
        let btnW:CGFloat = (SCREEN_W - 5 * space) / 4
        //重设透视图的高度
//        self.headerView.frame = CGRectMake(0, 0, SCREEN_W, 2 * (space +  btnW) + space + 120)
        
        var i = 0
        for model in self.btnArray{
            
            let orginX = CGFloat(i % 4) * (btnW + space) + space
            let orginY = CGFloat(i / 4) * (btnW + space) + space
            
            let button = UIButton.init(frame: CGRectMake(orginX, orginY, btnW, btnW))
            let m = model as! btnModel
            //设置图片
            button.sd_setBackgroundImageWithURL(NSURL.init(string: m.tagImg), forState: UIControlState.Normal)
            button.sd_setBackgroundImageWithURL(NSURL.init(string: m.tagImg), forState: UIControlState.Selected)
            button.setTitle(m.tagName, forState: UIControlState.Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            subView.addSubview(button)
            //设置标题颜色
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            // 设置标题的偏移量
            button.titleEdgeInsets = UIEdgeInsetsMake(btnW + space, 0, 0, 0)
            button.addTarget(self, action: #selector(self.categoryBtnClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            button.tag = 100 + i
            i += 1
        }
        
        
        
    }
    
    
    //分类按钮被点击
    func categoryBtnClicked(button:UIButton){
        
//        //点击分类时，往下层跳转，对应的接口是分类详情
//        //分类按钮被点击
//        let model = self.categoryArray.objectAtIndex(button.tag - 100) as! CategoryModel
//        let cateVC = CategoryViewController()
//        cateVC.categoryId = model.id
//        cateVC.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(cateVC, animated: true)
        
        print("第",button.tag - 100,"分类被点击")
        
    }
    
    
    // MARK: UITableView 协议方法

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queryArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            
            
            let cell = tableView.dequeueReusableCellWithIdentifier("channelCell", forIndexPath: indexPath) as! channelCell
            
            let model = channelArray[indexPath.row] as! chanelModel
            
            cell.iconImage.sd_setImageWithURL(NSURL.init(string: model.goodsImg))
            
            cell.titleL.text = model.title
            cell.zhekouL.text = model.zhekou
            cell.priceL.text = model.goodsPrice
            cell.nameL.text = model.goodsName
            return cell
            
        }else{
        
        
        
            let cell = tableView.dequeueReusableCellWithIdentifier("queryCell", forIndexPath: indexPath) as! queryCell
            let model = queryArray[indexPath.row] as! listModel
            
            cell.titleL.text = model.specialTitle
            cell.englishTitleL.text = model.englishTitle
            cell.iconImage.sd_setImageWithURL(NSURL.init(string: model.specialImage))
            
            return cell
        }
        
    }
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        if indexPath.row == 0{
            return 300
        }
        return 450
    }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
