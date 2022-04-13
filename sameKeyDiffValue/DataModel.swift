//
//  DataModel.swift
//  sameKeyDiffValue
//
//  Created by AlbertYuan on 2022/4/13.
//

import Foundation
import HandyJSON

class DataModel:HandyJSON {

    var code:Int?

    var data:[DataDetailModel]?

    required init(){}

}



enum DataDetailModelType:Int{
    case dataString = 0
    case dataDic
    case dataArray
}

class DataDetailModel:HandyJSON{

    var sort:Int?

    var data:Any?

    //本地解析处理
    var dataType:DataDetailModelType = .dataString
    var dataStr:String?
    var dataDictionary:DataModelDic?
    var dataArray:[String] = []

    required init(){}

    //数据规整处理
    func didFinishMapping() {
        
        if let dataString = data as? String{
            print("字符串类型解析:\(dataString)")
            dataType = .dataString
            dataStr = dataString
        }

        if let dataDic = data as? [String:Any]{
            print("字典类型解析\(dataDic)")
            dataType = .dataDic
            dataDictionary = DataModelDic.deserialize(from: dataDic)
        }

        if let dataArr = data as? [String]{
            print("数组类型解析\(dataArr)")
            dataType = .dataArray
            dataArray = dataArr
        }
    }
}


class DataModelDic:HandyJSON{
    var key:String?
    var info:String?

    required init(){}

}


