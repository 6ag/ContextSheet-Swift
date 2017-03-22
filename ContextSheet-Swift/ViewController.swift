//
//  ViewController.swift
//  ContextSheet-Swift
//
//  Created by zhoujianfeng on 2017/3/22.
//  Copyright © 2017年 zhoujianfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedView(_:))))
    }
    
    @objc fileprivate func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {
        if contextSheet.isShow {
            contextSheet.dismiss()
        } else {
            contextSheet.startWithGestureRecognizer(gestureRecognizer, inView: view)
        }
    }
    
    fileprivate lazy var contextSheet: JFContextSheet = {
        let contextItem1 = JFContextItem(itemName: "返回", itemIcon: "diy_item_fanhuijiantou")
        let contextItem2 = JFContextItem(itemName: "原图", itemIcon: "diy_item_tupian")
        let contextItem3 = JFContextItem(itemName: "贴纸", itemIcon: "diy_item_katie")
        let contextItem4 = JFContextItem(itemName: "打码", itemIcon: "diy_item_smear")
        let contextItem5 = JFContextItem(itemName: "保存", itemIcon: "diy_item_save")
        
        let contextSheet = JFContextSheet(items: [contextItem1, contextItem2, contextItem3, contextItem4, contextItem5])
        contextSheet.delegate = self
        return contextSheet
    }()
}

extension ViewController: JFContextSheetDelegate {
    
    func contextSheet(_ contextSheet: JFContextSheet, didSelectItemWithItemName itemName: String) {
        
        var title = ""
        switch (itemName) {
        case "返回":
            title = "返回"
        case "原图":
            title = "原图"
        case "贴纸":
            title = "贴纸"
        case "打码":
            title = "打码"
        case "保存":
            title = "保存"
        default:
            break
        }
        
        let alertC = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alertC.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        present(alertC, animated: true, completion: nil)
    }
}

