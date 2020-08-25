//
//  TestNotificationVC.swift
//  SwiftDemo
//
//  Created by longzhu on 2018/4/12.
//  Copyright © 2018年 ls. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {

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
//        2.发送通知
        NotificationCenter.default.post(name: LTNOTIFICATION_TEST, object: self, userInfo: ["key1":"传递的值", "age" : 18])
        
        
        //--------------------------------------------------------
        let dic = ["newText" : "backAction"]
        let notification = NSNotification.Name(rawValue: "refreshFirstViewNewText")
        NotificationCenter.default.post(name: notification, object: nil, userInfo: dic)
        //--------------------------------------------------------

        
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
