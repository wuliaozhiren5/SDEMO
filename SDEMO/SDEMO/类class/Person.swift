//
//  Person.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/20.
//  Copyright © 2020 tv. All rights reserved.
//

import Foundation

class Person {
    var firstName: String = ""
    var lastName: String = ""
    var age: Int = 0
    var type: Season = .Spring
    
    init(firstName: String, lastName: String, age: Int, type: Season) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.type = type
    }
}
