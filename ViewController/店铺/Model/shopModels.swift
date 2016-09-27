//
//  shopModels.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import Foundation


class btnModel:JSONModel{
    var tagImg:String!
    var tagName:String!
    
    var tagId:String!
    
    var tagType:String!
    var tagOrder:String!
    
    //字典key的个数和模型的属性个数不一致，需要实现这个方法，忽视掉未定义的字段赋值
    override class func propertyIsOptional(propertyName:String)->Bool{
        
        return true
    }
    //JSONModel 提供的编码转换方法，如果字典中的key 为 aa_bb 形式，而iOS中变量命名方式aaBb
    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }

    
    
    
}



class chanelModel:JSONModel{
    var goodsImg:String!
    var title:String!
    var zhekou:String!
    var goodsPrice:String!
    var goodsName:String!
    
    
    //字典key的个数和模型的属性个数不一致，需要实现这个方法，忽视掉未定义的字段赋值
    override class func propertyIsOptional(propertyName:String)->Bool{
        
        return true
    }
    //JSONModel 提供的编码转换方法，如果字典中的key 为 aa_bb 形式，而iOS中变量命名方式aaBb
    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }

}



class listModel:JSONModel{
    var specialImage:String!
    
    var specialTitle:String!
    
    var specialId:String!
    
    
    var englishTitle:String!
    
    
    var specialStitle:String!
    
    
    //字典key的个数和模型的属性个数不一致，需要实现这个方法，忽视掉未定义的字段赋值
    override class func propertyIsOptional(propertyName:String)->Bool{
        
        return true
    }
    //JSONModel 提供的编码转换方法，如果字典中的key 为 aa_bb 形式，而iOS中变量命名方式aaBb
    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }

    
}