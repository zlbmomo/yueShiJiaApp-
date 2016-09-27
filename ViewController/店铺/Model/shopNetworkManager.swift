//
//  shopNetworkManager.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import Foundation

extension listModel{
    
    class func requestShopData(callBack:(bannerArr:[AnyObject]?,channelArr:[AnyObject]?,tagArr:[AnyObject]?,listArr:[AnyObject]?,error:NSError?)->Void){
        
        
        
        BaseRequest.getWithURL("http://interface.yueshichina.com/?act=goods_cms_special&op=cms_special&token=749a036dc06ae8b3a120848995a9f306&client=android&curpage=1", para: nil) { (data, error) in
//            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)!
//            
//            print(str)
//            
            
            if error == nil{
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                
                //取出第二层数据
                let dict = obj["datas"] as! NSDictionary
                
                // 解析显示在轮播视图上的图片地址
                
                let banner = dict["banner"] as! [NSDictionary]
                var bannerArray = [String]()
                //遍历数组获取图片地址
                for ban in banner{
                    let image = ban["advertImg"] as! String
                    bannerArray.append(image)
                }
                //解析按钮
                let tagClass = dict["tag_classify"] as! [AnyObject]
                let tagArr = btnModel.arrayOfModelsFromDictionaries(tagClass)

                
                
                
                //解析channel
                let channel = [dict["channel"] as! NSDictionary]
                
//                
//                let img = channel["goods_img"] as! String
//                let name = channel["goods_name"] as! String
//                let price = channel["goods_price"] as! String
//                let title = channel["title"] as! String
//                let zhekou = channel["zhekou"] as! String
//                
//                let channelArr = NSMutableArray()
//                channelArr.addObject(img)
//                channelArr.addObject(name)
//                channelArr.addObject(price)
//                channelArr.addObject(title)
//                channelArr.addObject(zhekou)
                
                
                let channelArr = chanelModel.arrayOfModelsFromDictionaries(channel)
//                
                
                //解析list
                
                
                let query = dict["query"] as! [AnyObject]
                
                let queryArr = listModel.arrayOfModelsFromDictionaries(query)
                
                
                
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    callBack(bannerArr: bannerArray, channelArr: channelArr as [AnyObject], tagArr: tagArr as [AnyObject] , listArr: queryArr as [AnyObject], error: nil)
                    
                })

                
            }else{
                
                
                dispatch_async(dispatch_get_main_queue(), { 
                   
                callBack(bannerArr: nil, channelArr: nil, tagArr: nil, listArr: nil, error: error)
                
                
                })
                
            }
            
        }
        

        
        
        
        
        
        
    }
    
    
    
    
    
    
}
