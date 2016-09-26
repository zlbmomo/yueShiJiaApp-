//
//  HomeNetWorkManager.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import Foundation


extension HomeModel{
    
    class func requestHomeData(page:NSInteger,callBack:(bannerArr:[AnyObject]?,oneArr:[AnyObject]?,error:NSError?)->Void){
        
        
        BaseRequest.getWithURL( String.init(format: "http://interface.yueshichina.com/?act=app&op=index1&key=efbd1b3105a02ff790b706f66ced4cfc&token=749a036dc06ae8b3a120848995a9f306&client=android&curpage=%d", page), para: nil) { (data, error) in
//            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)!
//            
//            print(str)
            
            
            
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                
                let dict = obj["datas"] as! NSDictionary
                
                var bannerArr = NSMutableArray()
                
                if page == 1 {
                
                    let banner = dict["banner"] as! [AnyObject]
                    
                    
                    
//                    for ban in banner{
//                        let image = ban["advertImg"] as! String
//                        bannerArr.append(image)
//                        
//                        let title = ban["advertTitle"] as! String
//                        baArr.append(title)
//                    }
                    
                    let banmodels = bannerModel.arrayOfModelsFromDictionaries(banner)
                    
                    bannerArr.addObjectsFromArray(banmodels as [AnyObject])
                    
                
                
                }
                
                
                let arr = dict["data_type"]  as! [AnyObject]
                
                let oArr = NSMutableArray()

                let onemodels = HomeModel.arrayOfModelsFromDictionaries(arr)
                
                oArr.addObjectsFromArray(onemodels as [AnyObject])
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    
                   callBack(bannerArr: bannerArr as [AnyObject], oneArr: oArr as [AnyObject], error: nil)
                    
                })
                
            }else{
            
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(bannerArr: nil, oneArr: nil, error: error)
                })
                
            }
            
        }
        
        
        
        
    }
    
    
    
    
    
    
}