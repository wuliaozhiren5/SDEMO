//
//  ClosureVC.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/24.
//  Copyright © 2020 tv. All rights reserved.
//

//Swift中闭包的简单使用
//https://www.jianshu.com/p/7c599b96815b

import UIKit

class ClosureVC: UIViewController {
    
    //step1：
    //给闭包起一个别名
    typealias BackClosure = (String) -> ()
    //为创建一个(String) -> () 的可选类型的闭包变量作为控制器的属性
    //var closure: BackClosure?
    var closure: ((String) -> ())?
    
    //逃逸闭包
    var escapingClosure: BackClosure?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backAction))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "逃逸", style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightAction))
        //        //可以用"typealias"先声明一个闭包类型
        //        typealias testBlock = (String) -> Void
        //        let aaa: testBlock = { (str) in
        //            print(str)
        //        }
        //        aaa("cscs")
        
        
//        //为(_ num1: Int, _ num2: Int) -> (Int) 类型的闭包定义别名：Add
//        typealias Add = (_ num1: Int, _ num2: Int) -> (Int)
//        //创建一个 Add 类型的闭包常量：addCloser1
//        let addCloser1: Add
//        //为已经创建好的常量 addCloser1 赋值
//        addCloser1 = {
//            (_ num1: Int, _ num2: Int) -> (Int) in
//            return num1 + num2
//        }
//        //调用闭包并接受返回值
//        let result = addCloser1(20, 10)

    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @objc func backAction() {
        
        //setp2：
        ///判断闭包是否为空
        guard closure != nil else {
            return
        }
        //传值
        closure!("123456")
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightAction() {
        
        guard escapingClosure != nil else {
            return
        }
        escapingClosure!("逃逸闭包")
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //    场景一：利用闭包传值
    //    场景二：闭包作为函数的参数
    //    一，尾随闭包
    func combine1(num:Int, handle:(String, String)->(Void)) {
        handle("hello", "world \(num)")
    }
    func combine2(handle:(String, String)->(Void)) {
        handle("hello", "world")
    }
    
    //    二，逃逸闭包
    func combine3(closure:@escaping BackClosure) {
        escapingClosure = closure
    }
    
}
