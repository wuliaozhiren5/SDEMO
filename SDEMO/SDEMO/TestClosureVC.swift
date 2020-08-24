//
//  TestClosureVC.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/24.
//  Copyright © 2020 tv. All rights reserved.
//

//Swift中闭包的简单使用
//https://www.jianshu.com/p/7c599b96815b

import UIKit

////强应用了
import UIKit
class TestClosureVC: UIViewController {
    var callBack: ((String) -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        printString { (text) in
            print(text)
            //闭包中捕获了self
            self.view.backgroundColor = UIColor.red
        }
    }
    func printString(callBack:@escaping (String) -> ()) {
        callBack("这个闭包返回一段文字")
        //控制器强引用于着callBack
        self.callBack = callBack
    }
    deinit {
        print("ThirdViewController---释放了")
    }
}


//方式一：类似于Objective-C中使用__weak解决block的循环引用，Swift中支持使用weak关键字将类实例声明为弱引用类型（注意，弱引用类型总是可选类型），打破类实例对闭包的强引用，当对象销毁之后会自动置为nil，对nil进行任何操作不会有反应。
//import UIKit
//class TestClosureVC: UIViewController {
//    var callBack: ((String) -> ())?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //将self申明为弱引用类型，打破循环引用
//        weak var weakSelf = self
//        printString { (text) in
//            print(text)
//            //闭包中铺捕获了self
//            weakSelf?.view.backgroundColor = UIColor.red
//        }
//    }
//    func printString(callBack:@escaping (String) -> ()) {
//        callBack("这个闭包返回一段文字")
//        //控制器强引用于着callBack
//        self.callBack = callBack
//    }
//    deinit {
//        print("ThirdViewController---释放了")
//    }
//}


//方式二：作为第一种方式的简化操作，我们可以在闭包的第一个大括号后面紧接着插入这段代码[weak self]，后面的代码直接使用self？也能解决循环引用的问题。
//import UIKit
//class TestClosureVC: UIViewController {
//    var callBack: ((String) -> ())?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        printString {[weak self]  (text) in
//            print(text)
//            self?.view.backgroundColor = UIColor.red
//        }
//    }
//    func printString(callBack:@escaping (String) -> ()) {
//        callBack("这个闭包返回一段文字")
//        //控制器强引用于着callBack
//        self.callBack = callBack
//    }
//    deinit {
//        print("ThirdViewController---释放了")
//    }
//}

////方式三：在闭包和捕获的实例总是互相引用并且总是同时释放时，可以将闭包内的捕获定义为无主引用unowned。
//import UIKit
//class TestClosureVC: UIViewController {
//    var callBack: ((String) -> ())?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        printString {[unowned self]  (text) in
//            print(text)
//            self.view.backgroundColor = UIColor.red
//        }
//    }
//    func printString(callBack:@escaping (String) -> ()) {
//        callBack("这个闭包返回一段文字")
//        //控制器强引用于着callBack
//        self.callBack = callBack
//    }
//    deinit {
//        print("ThirdViewController---释放了")
//    }
//}
