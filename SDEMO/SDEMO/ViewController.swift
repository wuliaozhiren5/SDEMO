//
//  ViewController.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/19.
//  Copyright © 2020 tv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        self.view.addSubview(lazyLabel);
        
        
        var csStr: String!
        print("\(csStr)")
        
        //关闭导航栏半透明效果
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(lazyButton);
        //        self.view.addSubview(lazyImageView);
        
        
        //        btn.snp.makeConstraints { (make) in
        //                 make.center.equalTo(self.view)
        //                 make.size.equalTo(CGSize(width: 100, height: 100))
        //             }
    }
    
    
    
    //懒加载lazy
    lazy var lazyLabel: UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 100, width: 200, height: 50))
        label.text = "lazy方式懒加载lable"
        //        label.frame = CGRect.init(x: 0, y: 0, width: 100, height: 50)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.layer.cornerRadius = 5.0
        label.layer.masksToBounds = true
        
        //        label.numberOfLines = 1;
        return label
    }()
    
    lazy var lazyImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 300, width: 200, height: 200))
        imageView.contentMode = .scaleAspectFit;
        imageView.image = UIImage(named: "ic_liveroom_addpeople")
        return imageView
    }()
    
    lazy var lazyButton: UIButton = {
        let btn = UIButton.init()
        btn.frame = CGRect(x: 0, y: 200, width: 200, height: 50)
        
        //文字
        btn.setTitle("普通状态", for: .normal)
        btn.setTitle("高亮状态", for: .highlighted)
        btn.setTitle("禁用状态", for: .disabled)
        btn.setTitleColor(UIColor.red, for: .normal)
        
        //设置按钮图片
        //btn.setBackgroundImage(UIImage(named: "gougou.jpg"), for: .normal)
        btn.setImage(UIImage(named: "ic_inputbox_delete_noclickable"), for: .normal)
        
        //背景色
        btn.backgroundColor = UIColor.gray
        
        //字体
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        //设置圆角
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5.0
        //设置边框
        btn.layer.borderColor = UIColor.purple.cgColor
        btn.layer.borderWidth = 1.5
        
        //设置按钮文字比较长显示不完情况下的处理
        btn.titleLabel?.lineBreakMode = .byCharWrapping
        
        //设置按钮的文字和图片偏移量
        btn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 0)
        btn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 0)
        
        //点击
        //        btn.addTarget(self, action: #selector(buttonClick1), for: .touchUpInside)
        btn.addTarget(self, action: #selector(buttonClick2(button01:)), for: .touchUpInside)
        //btn.addTarget(self, action: #selector(switchTypeAction), for: .touchUpInside)
        
        return btn
    }()
    
    //    @objc func switchTypeAction(_ sender:UIButton?) {
    //        print("btn");
    //    }
    
    //    @objc func buttonClick1 ()  {
    //        print("你点击了我这个按钮方法buttonClick1");
    //    }
    
    @objc func buttonClick2 (button01:UIButton) {
        //        let vc : ComomControlVC = ComomControlVC()
        //        let vc : TVC = TVC()
        //        let vc : VerticalCVC = VerticalCVC()
        //        let vc : HorizontalCVC = HorizontalCVC()
          let vc : ValueVC = ValueVC()

        
        

        //        //必包强引用
        //        let vc:TestClosureVC = TestClosureVC()
         
        
        self.navigationController?.pushViewController(vc, animated: true)
        print("你点击了我这个按钮方法buttonClick2(buttonMy:)");
    }
}



