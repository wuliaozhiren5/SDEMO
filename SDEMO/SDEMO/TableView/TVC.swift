//
//  TVC.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/20.
//  Copyright © 2020 tv. All rights reserved.
//

import UIKit
import SnapKit

class TVC: UIViewController {
    
    let cellIdentity = "CellID"
    let TcellIdentity = "TCellID"
    
    var tableTitle: String? =  ""
    
    //        简化后的天干地支：“甲、乙、丙、丁、戊、己、庚、辛、壬、癸”称为十天干，“子、丑、寅、卯、辰、巳、午、未、申、酉、戌、亥”称为十二地支。
    var data: [Person] = [Person.init(firstName: "甲", lastName: "111", age: 20, type: Season.Spring),
                          Person.init(firstName: "乙", lastName: "222", age: 21, type: Season.Summer),
                          Person.init(firstName: "丙", lastName: "333", age: 22, type: Season.Fall),
                          Person.init(firstName: "丁", lastName: "444", age: 23, type: Season.Winter),
                          Person.init(firstName: "戊", lastName: "555", age: 24, type: Season.Spring),
                          Person.init(firstName: "己", lastName: "666", age: 25, type: Season.Summer),
                          Person.init(firstName: "庚", lastName: "777", age: 26, type: Season.Fall),
                          Person.init(firstName: "辛", lastName: "888", age: 27, type: Season.Winter),
                          Person.init(firstName: "壬", lastName: "999", age: 28, type: Season.Spring),
                          Person.init(firstName: "癸", lastName: "101010", age: 29, type: Season.Summer),
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //array
//        var someInts = [Int]()
//        print("someInts is of type [Int] with \(someInts.count) items.")
//        // 打印 "someInts is of type [Int] with 0 items."
//        someInts.append(3)
//        // someInts 现在包含一个 Int 值
//        someInts = []
//        // someInts 现在是空数组，但是仍然是 [Int] 类型的。
//
//
//        var shoppingList: [String] = ["Eggs", "Milk"]
//        // shoppingList 已经被构造并且拥有两个初始项。
////        var shoppingList = ["Eggs", "Milk"]
         
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        // Do any additional setup after loading the view.
        
    }
    
    lazy var tableView: UITableView = {
        let tempTableView = UITableView (frame: self.view.bounds, style: .plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        // cell预估高度
        tempTableView.estimatedRowHeight = 0
        tempTableView.estimatedSectionHeaderHeight = 0;
        tempTableView.estimatedSectionFooterHeight = 0;
        tempTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentity)
        tempTableView.register(TCell.self, forCellReuseIdentifier: TcellIdentity)
        return tempTableView
    }()
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension TVC: UITableViewDelegate {
    //行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
    }
}

extension TVC: UITableViewDataSource {
    //分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //返回表格行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        return data.count
    }
    //创建各单元显示内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        //system cell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentity, for: indexPath)
        //        cell.accessoryType = .disclosureIndicator
        //        cell.textLabel?.text = "\(indexPath.section)" + "_" + "\(indexPath.row)"
        //        return cell
        
        
        let person: Person = data[indexPath.row]
        //system cell
        let cell = tableView.dequeueReusableCell(withIdentifier: TcellIdentity, for: indexPath) as! TCell
        cell.accessoryType = .disclosureIndicator
        //        cell.textLabel?.text = "\(indexPath.section)" + "\(indexPath.row)"
        //        cell.textLabel?.text = "112312312"
//        cell.nameLabel.text = "\(indexPath.section)" + "_" + "\(indexPath.row)"
//        cell.nameLabel.text = person.firstName + "_" + person.lastName + "_" + "\(person.age)" + "_" + "\(person.type.rawValue)"
        
        
        cell.firstNameLabel.text = person.firstName
        cell.lastNameLabel.text = person.lastName
        
        return cell
    }
    
    
}
