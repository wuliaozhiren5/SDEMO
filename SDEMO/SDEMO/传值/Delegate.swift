//
//  Delegate.swift
//  SwiftDemo
//
//  Created by longzhu on 2018/4/12.
//  Copyright © 2018年 ls. All rights reserved.
//

import Foundation

///设置协议
@objc protocol passValueDelegate: NSObjectProtocol {
    
    ///代理方法
    //不可选，必须实现
    func passValue(text: String)
    func passValue(text1: String, text2: String)
    
    //可选
    //@objc optional
    @objc optional func optionalPassValue(text: String)


}
 
