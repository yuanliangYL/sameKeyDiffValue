//
//  ViewController.swift
//  sameKeyDiffValue
//
//  Created by AlbertYuan on 2022/4/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestData()
        
    }

    func requestData(){
        do {
            //模拟网络数据
            if let bundlePath = Bundle.main.path(forResource: "sameKeyDiffValue", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8),
               //原生数据解析
               let dataDic = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String:Any],
               let model = DataModel.deserialize(from: dataDic)
            {
                print(dataDic,model)

            }else{
                print("parse err")
            }

        } catch let err {
            print(err)
        }
    }

}

