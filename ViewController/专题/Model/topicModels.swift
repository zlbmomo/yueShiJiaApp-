

//
//  topicModels.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import Foundation


class topicTVModel:JSONModel{
    
    //TV
    var articleImage:String?
    var articleTitle:String?
    var articleAbstract:String?
    var articleVideo:String?
    var videoLength:String?
    var tags:[String]?
    
    //bangdan
    var top:String?
    var articleOrigin:String?
    
    
    //字典key的个数和模型的属性个数不一致，需要实现这个方法，忽视掉未定义的字段赋值
    override class func propertyIsOptional(propertyName:String)->Bool{
        
        return true
    }
    //JSONModel 提供的编码转换方法，如果字典中的key 为 aa_bb 形式，而iOS中变量命名方式aaBb
    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    

}


class ActiveModel:JSONModel{
    
    
    var goodsImage:String!
    var goodsName:String!
    var endVirtual:String!
    var hintVirtual:String!

    
    
    //字典key的个数和模型的属性个数不一致，需要实现这个方法，忽视掉未定义的字段赋值
    override class func propertyIsOptional(propertyName:String)->Bool{
        
        return true
    }
    //JSONModel 提供的编码转换方法，如果字典中的key 为 aa_bb 形式，而iOS中变量命名方式aaBb
    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    
    
}