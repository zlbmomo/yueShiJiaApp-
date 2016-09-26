//
//  MyScrollView.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit


//自定制头视图


class MyScrollView: UIView ,UIScrollViewDelegate{
    
    
    
    var scrollVIew:UIScrollView!
    var pageControl:UIPageControl!
    var timer:NSTimer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollVIew = UIScrollView.init(frame: CGRectMake(0, 0, SCREEN_W, 350))
        self.addSubview(scrollVIew)
        scrollVIew.pagingEnabled = true
        scrollVIew.bounces = false
        scrollVIew.contentOffset.x = SCREEN_W
        scrollVIew.showsHorizontalScrollIndicator = false
        
        scrollVIew.delegate = self
        
        
        
        
        pageControl = UIPageControl.init(frame: CGRectMake(SCREEN_W - 290, 320, 160, 15))
        self.addSubview(pageControl)
        
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        
       
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(self.timerRun), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    func timerRun(){
        
        UIView.animateWithDuration(1) { 
            self.scrollVIew.contentOffset.x += SCREEN_W
            let page = ((self.scrollVIew.contentOffset.x - SCREEN_W) % (SCREEN_W * 5)) / self.scrollVIew.frame.width
            
            self.pageControl.currentPage = Int(page)
            
            
            
        }
        if scrollVIew.contentOffset.x == CGFloat(4) * SCREEN_W {
            scrollVIew.setContentOffset(CGPointMake(SCREEN_W, 0), animated: false)
            
            pageControl.currentPage = 0
        }
        
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = ((self.scrollVIew.contentOffset.x - SCREEN_W) % (SCREEN_W * 6)) / self.scrollVIew.frame.width
    
        pageControl.currentPage = Int(page)
        if scrollVIew.contentOffset.x == 0{
            scrollVIew.setContentOffset(CGPointMake(SCREEN_W * 3, 0), animated: false)
            pageControl.currentPage = 2
            
            
            
        }
        
        
        if scrollVIew.contentOffset.x == SCREEN_W * 5 {
            scrollVIew.setContentOffset(CGPointZero, animated: false)
            pageControl.currentPage = 0
        }
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
