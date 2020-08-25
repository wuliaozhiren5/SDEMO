//
//  ValueVC.swift
//  SwiftDemo
//
//  Created by longzhu on 2018/4/12.
//  Copyright © 2018年 ls. All rights reserved.
//

//1.注册通知
let LTNOTIFICATION_TEST = Notification.Name.init(rawValue: "notificationTest")

import UIKit

class ValueVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = UIColor.white
        
        self.creatUIButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiverNotification(_:)), name: LTNOTIFICATION_TEST, object: nil)
        
        //--------------------------------------------------------
        ///接受通知的方法
        NotificationCenter.default.addObserver(self, selector: #selector(noticeChangeTextAction(noti:)), name: NSNotification.Name(rawValue: "refreshFirstViewNewText"), object: nil)
        //--------------------------------------------------------
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func creatUIButton() {
        //    Swift - 按钮（UIButton）的用法
        //    http://www.hangge.com/blog/cache/detail_529.html
        
        let btn:UIButton = UIButton()
        btn.frame = CGRect(x: 0, y: 100, width: 200, height: 50)
        btn.setTitle("Closure", for:.normal) //普通状态下的文字
        btn.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        btn.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.backgroundColor = UIColor.orange
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
        
        
        let btn1:UIButton = UIButton()
        btn1.frame = CGRect(x: 0, y: 200, width: 200, height: 50)
        btn1.setTitle("Delegate", for:.normal) //普通状态下的文字
        btn1.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        btn1.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn1.backgroundColor = UIColor.orange
        btn1.addTarget(self, action: #selector(btnClick1(_:)), for: .touchUpInside)
        self.view.addSubview(btn1)
        
        
        let btn2:UIButton = UIButton()
        btn2.frame = CGRect(x: 0, y: 300, width: 200, height: 50)
        btn2.setTitle("Notification", for:.normal) //普通状态下的文字
        btn2.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        btn2.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn2.backgroundColor = UIColor.orange
        btn2.addTarget(self, action: #selector(btnClick2(_:)), for: .touchUpInside)
        self.view.addSubview(btn2)
    }
    
    @objc func btnClick(_ sender:UIButton?) {
        print("Closure");
        
        let vc:ClosureVC = ClosureVC()
        vc.closure = { (str) -> () in
            print( str + "Closure okokokokokokokokokokokok")
            print("利用闭包传值")
        }
        vc.combine1(num: 2020) { (text, text1) -> (Void) in
            print("\(text) \(text1)")
            print("尾随闭包")
        }
        vc.combine2 { (text, text1) -> (Void) in
            print("\(text) \(text1)")
            print("尾随闭包")
        }
        vc.combine3 { (text) -> (Void) in
            print("\(text)")
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func btnClick1(_ sender:UIButton?) {
        print("Delegate");
        
        let vc:DelegateVC = DelegateVC()
        vc.delegate = self; 
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func btnClick2(_ sender:UIButton?) {
        print("Notification");
        
        let vc:NotificationVC = NotificationVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @objc private func receiverNotification(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        let age = userInfo["age"] as? Int
        let key = userInfo["key1"] as? String
        if key != nil && age != nil{
            print(key! + "-->" + "\(age!)")
        }
    }
    
    //--------------------------------------------------------
    @objc func noticeChangeTextAction(noti: Notification){
        //        let newLabel: UILabel = self.view.viewWithTag(100) as! UILabel
        guard let tempDic = noti.userInfo else {
            return
        }
        //        newLabel.text = tempDic["newText"] as? String
        print(tempDic["newText"] ?? "")
        
    }
    //3.移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    //--------------------------------------------------------
    
}

extension ValueVC: passValueDelegate {
    
    func passValue(text1: String, text2: String) {
         print( text1 + "---" + text2);

    }
    
    
    func passValue(text:String) {
        
        print( text + "---" + "Delegate  okokokokokokokokokokokok");
        
    }
    
}


