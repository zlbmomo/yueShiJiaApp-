//
//  topicTVNetworkManager.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import Foundation


extension topicTVModel{
    
    class func requestTopicTVData(page:NSInteger?,specialtype:NSInteger,callBack:(TVArr:[AnyObject]?,error:NSError?)->Void){
        
        BaseRequest.getWithURL(String.init(format: "http://interface.yueshichina.com/?act=app&op=special_programa&special_type=%d&key=efbd1b3105a02ff790b706f66ced4cfc&token=749a036dc06ae8b3a120848995a9f306&client=android&curpage=%d", specialtype,page!), para: nil) { (data, error) in
//            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)!
//            print(str)
            
            
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                
                let dict = obj["datas"] as! NSDictionary
                
                
                let dataArray = dict["article_list"] as! [AnyObject]
                
                var array = NSMutableArray()
                
                if specialtype == 1 {
                //????????
                    array = topicTVModel.arrayOfModelsFromDictionaries(dataArray)
                
                }else if specialtype == 2{
                    array = topicTVModel.arrayOfModelsFromDictionaries(dataArray)
                    
                    
                }else if specialtype == 3{
                    array = topicTVModel.arrayOfModelsFromDictionaries(dataArray)
                    
                }else if specialtype == 4{
                    array = topicTVModel.arrayOfModelsFromDictionaries(dataArray)
                    
                }else if specialtype == 5 {
                    array = topicTVModel.arrayOfModelsFromDictionaries(dataArray)
                    
                }else{
                    
                }
                
                
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(TVArr: array as [AnyObject], error: nil)
                })
                
            }else{
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(TVArr: nil, error: error)
                })
            }
        }

        
        

    }
    
}



