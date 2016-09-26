//
//  qiuRINetworkManager.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import Foundation


extension goodsListModel{
    
    
    
    class func requstQiuRiDataModel(page:String,callBack:(dataArr:NSMutableArray?,specialArr:NSMutableArray?,error:NSError?)->Void){
        
        
        BaseRequest.getWithURL("http://interface.yueshichina.com/?act=app&op=goods_special&special_id=392&key=efbd1b3105a02ff790b706f66ced4cfc&token=749a036dc06ae8b3a120848995a9f306&client=android&curpage=1", para: nil) { (data, error) in
            
            
//            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)!
//            
//            print(str)
            
            
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                
                
                //let array = arr.objectForKey("goods_list") as! [AnyObject]
                
                let data = obj["datas"] as! NSDictionary
                
                let dataArray = data["goods_list"] as! [AnyObject]
               
                
                let array = goodsListModel.arrayOfModelsFromDictionaries(dataArray)
                
                
                let specialArr = NSMutableArray()
                
                let specialImage = data["special_image"] as! String
                let specialTitle = data["special_title"] as! String
                let specialStitle = data["special_stitle"] as! String
                
                
                specialArr.addObject(specialImage)
                specialArr.addObject(specialTitle)
                specialArr.addObject(specialStitle)
                
                
                
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(dataArr: array, specialArr: specialArr, error: nil)
                })
                
                
                
                
                
            }else{
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(dataArr: nil, specialArr: nil, error: error)
                })
            }
            
            
        }

    }
}