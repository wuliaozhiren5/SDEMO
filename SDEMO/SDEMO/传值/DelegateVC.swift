//
//  TestDelegateVC.swift
//  SwiftDemo
//
//  Created by longzhu on 2018/4/12.
//  Copyright © 2018年 ls. All rights reserved.
//

import UIKit

class DelegateVC: UIViewController {
    
    //https://blog.csdn.net/zhangjitao_boke/article/details/50606707
    
    // 设置代理变量为weak避免循环引用
    weak var delegate:passValueDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backAction))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backAction() {
         //       https://blog.csdn.net/dayuqi/article/details/53286923
        //        https://www.dazhuanlan.com/2019/12/14/5df40ad2d720f/
        
        // 让secondVC的代理去执行代理方法
        if self.delegate != nil && (self.delegate?.responds(to: #selector(passValueDelegate.passValue(text:))))! {
            self.delegate?.passValue(text: "delegate")
            
        }
        if self.delegate != nil && (self.delegate?.responds(to: #selector(passValueDelegate.passValue(text1: text2:))))! {
            self.delegate?.passValue(text1: "delegate", text2: "123")
        }
        
        if self.delegate != nil {
            self.delegate?.passValue(text: "delegate")
        }
        if self.delegate != nil {
            self.delegate?.optionalPassValue?(text: "optionalPassValue")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
