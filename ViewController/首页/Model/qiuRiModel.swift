//
//  qiuRiModel.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import Foundation


//class qiuRiModel:JSONModel{
//    
//    var goodsList:NSMutableArray?
//    var specialImage:String!
//    var specialStitle:String!
//    
//    required init(dictionary dict: [NSObject : AnyObject]!) throws {
//        super.init()
//        self.specialImage = dict["special_image"] as! String
//        
//        self.specialStitle = dict["special_stitle"] as! String
//        
//        let array = dict["goods_list"] as![AnyObject]
//        
//        
//        self.goodsList = goodsListModel.arrayOfModelsFromDictionaries(array)
//    }
//    
//    required init(data: NSData!) throws {
//        fatalError("init(data:) has not been implemented")
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//}

class goodsListModel:JSONModel{
    
    
    var goodsId:String?
    var goodsImage:String!
    var goodsName:String!
    var goodsJingle:String!
    var goodsPrice:String!
    var goodsMarketprice:String!
    var goodsSalenum:String!
    
    
    //字典key的个数和模型的属性个数不一致，需要实现这个方法，忽视掉未定义的字段赋值
    override class func propertyIsOptional(propertyName:String)->Bool{
        
        return true
    }
    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    

    
    
}