//
//  FocusViewController.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

//委托方第一步声明协议
protocol PushViewControllerDelegate:class {
    
    func pushViewController(playTVS:UIViewController)->Void
}



//视频播放代理方第一步遵守协议
class FocusViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,NavTitleViewDelegate,PushViewControllerDelegate{

    
    
    
    
    var titleView:NavTitleView!//导航title视图
    
    
    lazy var contentView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        //设置为横向滚动
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let contentView = UICollectionView.init(frame: CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49), collectionViewLayout: layout)
        
<<<<<<< Updated upstream
        
        //设置默认偏移量
//        contentView.contentOffset = CGPointMake(SCREEN_W, 0)
        
        
=======
        //设置默认偏移量
//        contentView.contentOffset = CGPointMake(SCREEN_W, 0)
        
>>>>>>> Stashed changes
        contentView.backgroundColor = GRAYCOLOR
        //设置按页滚动
        contentView.pagingEnabled = true
        contentView.showsHorizontalScrollIndicator = false
        
        
        //注册cell
        contentView.registerClass(TvCell.self, forCellWithReuseIdentifier: "TvCell")
        contentView.registerClass(bangDanCell.self, forCellWithReuseIdentifier: "bangDanCell")
        contentView.registerClass(zhiShiCell.self, forCellWithReuseIdentifier: "zhiShiCell")
        contentView.registerClass(renWenCell.self, forCellWithReuseIdentifier: "renWenCell")
        contentView.registerClass(mapCell.self, forCellWithReuseIdentifier: "mapCell")
        contentView.registerClass(exeCell.self, forCellWithReuseIdentifier: "exeCell")
        
        
        //指定数据源代理和操作代理
        contentView.delegate = self
        contentView.dataSource = self
        
        
        self.view.addSubview(contentView)
        return contentView
        
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.contentView.reloadData()
        self.createTitleVeiw()
        
        
        self.custom()
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
        
    }
    
        
    func createTitleVeiw(){
        
        titleView = NavTitleView.init(frame: CGRectMake(0, 64, SCREEN_W, 30), leftSpace: 30, titleArray: ["视频","榜单","知识","人文","地图","活动"])
        
        
        //指定代理关系
        titleView.delegate = self
        
//        titleView.selectedIndex(0)
        
        
        self.view.addSubview(titleView)
        
        self.navigationItem.title = "FOOD"
    }
    
    
    
    
    
    //MARK:NavTitleView  协议方法
    
    func didSelectedTitleAtIndex(index: NSInteger) {
        //设置collectionView的偏移量
        self.contentView.contentOffset = CGPointMake(CGFloat(index) * SCREEN_W, 0)
        
        
    }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    // MARK: - UICollectionView 协议方法
    //返回三个页面
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        
        var cellID = ""
        
        if indexPath.item == 0
        {
            cellID = "TvCell"
        }else if indexPath.item == 1{
            cellID = "bangDanCell"
        }else if indexPath.item == 2{
            cellID = "zhiShiCell"
        }else if indexPath.item == 3{
            cellID = "renWenCell"
        }else if indexPath.item == 4{
            cellID = "mapCell"
        }else{
            cellID = "exeCell"
        }
        
        let cell = contentView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath)
        
        
        
        if indexPath.item == 0{
            
            
            let cell1 = cell as! TvCell
            
            //代理方第三步成为代理
            cell1.delegate = self
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(SCREEN_W, SCREEN_H - 64 - 49)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0
    }
    //结束滚动时
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = NSInteger(scrollView.contentOffset.x / SCREEN_W)
        titleView.selectedIndex(index)
    }
    
    
   
    //视频播放代理方第二步实现协议方法
    func pushViewController(playTVS: UIViewController) {
        playTVS.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(playTVS, animated: true)
    }
   
    

    

}
