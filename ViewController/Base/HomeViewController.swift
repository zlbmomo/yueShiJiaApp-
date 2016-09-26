//
//  HomeViewController.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createViewControllers()
    }
    
    
    func createViewControllers(){
        
        
        let first = FirstViewController()
        let focus = FocusViewController()
        let shop = ShopViewController()
        let my = MyViewController()
        
        
        let vcArray = [first,focus,shop,my]
        
        
        let titleArr = ["首页","专题","店铺","我的"]
        
        
        var i = 0
        var viewControllers = [UINavigationController]()//用于存放四个模块的导航控制器
        
        
        for vc in vcArray {
            let nav = UINavigationController.init(rootViewController: vc)
            let title = titleArr[i]
            
            //设置标题
            nav.title = title
            
            //非选中效果图片 总是显示原色
            let image = UIImage.init(named: title + "a")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
            //选中效果的图片 总是显示原色
            let images = UIImage.init(named: title + "b")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
            //创建item
            let tabItem = UITabBarItem.init(title: title, image: image, selectedImage: images)
            
            nav.tabBarItem = tabItem
            //非选中效果字体和字体颜色
            tabItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor.grayColor()], forState: .Normal)
            
            //选中效果字体和字体颜色
            tabItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor.orangeColor()], forState: .Selected)
            
            
            //            tabItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0)
            
            //添加到数组中
            viewControllers.append(nav)
            i += 1
        }
            self.viewControllers = viewControllers
            

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
