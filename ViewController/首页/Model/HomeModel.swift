//
//  HomeModel.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import Foundation



class bannerModel:JSONModel{
    var advertImg:String!
    var advertTitle:String!
    var advertId:String!
    
    
    //属性和字典中的key 不一一对应，需要实现这个函数，否则会崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
//    当字典中的key 的个数和 模型属性的个数不完全匹配时，需要实现下面这个方法，并且返回 true ，这样才能保证 将字典中的值赋给相应的属性
    override class func propertyIsOptional(propertyName:String)->Bool{
        return true
    }

}




//第一种模型
class HomeModel:JSONModel{
    
    var relationObjectImage:String!
    var relationObjectTitle:String!
    var relationObjectJingle:String!
    
    var relationObjectType:String!
    
    var goodsSpecialList:NSMutableArray?
    
    
    var tagPrint:String!
    
    
    var videoLength:String?
    
    
    var goodsPrice:String?
    
     //属性和字典中的key 不一一对应，需要实现这个函数，否则会崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
//
//    
//    
//    //JSONModel 提供的编码转换方法，如果字典中的key 为 aa_bb 形式，而iOS中变量命名方式aaBb
//    override class func keyMapper()->JSONKeyMapper{
//        
//        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
//    }
//    
//    
////    当字典中的key 的个数和 模型属性的个数不完全匹配时，需要实现下面这个方法，并且返回 true ，这样才能保证 将字典中的值赋给相应的属性
//    override class func propertyIsOptional(propertyName:String)->Bool{
//        return true
//    }
    
    required init(dictionary dict: [NSObject : AnyObject]!) throws {
        super.init()
        
        
        self.relationObjectImage = dict["relation_object_image"] as? String
        
        self.relationObjectTitle = dict["relation_object_title"] as? String
    
        self.relationObjectJingle = dict["relation_object_jingle"] as? String
        
        
        self.relationObjectType = String(dict["relation_object_type"]!)
        
        self.tagPrint = dict["tag_print"] as? String
        
        
        self.videoLength = dict["video_length"] as? String
        
        self.goodsPrice = dict["goods_price"] as? String
        
        
        let array = dict["goods_special_list"] as?[AnyObject]
        
        
        if array?.count > 0 {
            self.goodsSpecialList = try?goodsSpecialListModel.arrayOfModelsFromDictionaries(array)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(data: NSData!) throws {
        fatalError("init(data:) has not been implemented")
    }
    
}


class goodsSpecialListModel:JSONModel{
    
    
    var goodsImg:String!
    var goodsName:String!
    var goodsPrice:String!
    
    
    //属性和字典中的key 不一一对应，需要实现这个函数，否则会崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }

    
    //JSONModel 提供的编码转换方法，如果字典中的key 为 aa_bb 形式，而iOS中变量命名方式aaBb
    override class func keyMapper()->JSONKeyMapper{
        
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    //当字典中的key 的个数和 模型属性的个数不完全匹配时，需要实现下面这个方法，并且返回 true ，这样才能保证 将字典中的值赋给相应的属性
    override class func propertyIsOptional(propertyName:String)->Bool{
        return true
  }
}



