//
//  playViewController.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit



class playViewController: UIViewController {
    
    
    var playTVideo:String!
    
    
    //自带播放器的页面
    let pvc = AVPlayerViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(playTVideo)
        
        

        self.view.backgroundColor = UIColor.whiteColor()
        
        
        pvc.player = AVPlayer.init(URL: NSURL.init(string: playTVideo)!)

        #if false
            
            weak var weakSelf = self
            self.presentViewController(pvc, animated: true) {
                weakSelf!.pvc.player?.play()
            }
        #else
            
            
            pvc.view.frame = CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49)
            self.view.addSubview(pvc.view)
            pvc.player?.play()
        #endif
        
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
