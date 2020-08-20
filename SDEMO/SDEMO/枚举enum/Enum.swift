//
//  Enum.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/20.
//  Copyright © 2020 tv. All rights reserved.
//

import Foundation

enum Season: Int{
    case Spring
    case Summer
    case Fall
    case Winter
}
 
// 映射到整型
enum Movement: Int {
    case Left = 0
    case Right = 1
    case Top = 2
    case Bottom = 3
}

// 同样你可以与字符串一一对应
enum House: String {
    case Baratheon = "Ours is the Fury"
    case Greyjoy = "We Do Not Sow"
    case Martell = "Unbowed, Unbent, Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family, Duty, Honor"
    case Tyrell = "Growing Strong"
}

// 或者float double都可以(同时注意枚举中的花式unicode)
enum Constants: Double {
    case π = 3.14159
    case e = 2.71828
    case φ = 1.61803398874
    case λ = 1.30357
}
