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
    
    //简化后的天干地支：“甲、乙、丙、丁、戊、己、庚、辛、壬、癸”称为十天干，“子、丑、寅、卯、辰、巳、午、未、申、酉、戌、亥”称为十二地支。
    //    var data: [Person] = [Person.init(firstName: "甲", lastName: "111", age: 20, type: Season.Spring),
    //                          Person.init(firstName: "乙", lastName: "222", age: 21, type: Season.Summer),
    //                          Person.init(firstName: "丙", lastName: "333", age: 22, type: Season.Fall),
    //                          Person.init(firstName: "丁", lastName: "444", age: 23, type: Season.Winter),
    //                          Person.init(firstName: "戊", lastName: "555", age: 24, type: Season.Spring),
    //                          Person.init(firstName: "己", lastName: "666", age: 25, type: Season.Summer),
    //                          Person.init(firstName: "庚", lastName: "777", age: 26, type: Season.Fall),
    //                          Person.init(firstName: "辛", lastName: "888", age: 27, type: Season.Winter),
    //                          Person.init(firstName: "壬", lastName: "999", age: 28, type: Season.Spring),
    //                          Person.init(firstName: "癸", lastName: "101010", age: 29, type: Season.Summer),
    //    ]
    var data: [Person] = []
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //数据
        data = [Person.init(firstName: "甲", lastName: "111", age: 20, type: Season.Spring),
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
        
        //UI
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        //创建表头标签
        let headerFrame = CGRect(x:0, y:0, width:self.view.bounds.size.width, height:30)
        let headerLabel = UILabel(frame: headerFrame)
        headerLabel.backgroundColor = UIColor.black
        headerLabel.textColor = UIColor.white
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.text = "tableHeaderView"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        self.tableView.tableHeaderView = headerLabel
        
        //创建表尾标签
        let frameFrame = CGRect(x:0, y:0, width:self.view.bounds.size.width, height:30)
        let footLabel = UILabel(frame: frameFrame)
        footLabel.backgroundColor = UIColor.black
        footLabel.textColor = UIColor.white
        footLabel.numberOfLines = 0
        footLabel.lineBreakMode = .byWordWrapping
        footLabel.text = "tableHeaderView"
        footLabel.font = UIFont.italicSystemFont(ofSize: 20)
        self.tableView.tableFooterView = footLabel
    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let person = data[indexPath.row]
        let alertController = UIAlertController(title: "提示!",
                                                message: "你选中了【\(person.firstName)】", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default,handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //滑动删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
    
    //修改删除按钮的文字
    //    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    //        return "删除"
    //    }
    
}

extension TVC: UITableViewDataSource {
    //分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //返回表格行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        return data.count
    }
    //创建各单元显示内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        //system cell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentity, for: indexPath)
        //        cell.accessoryType = .disclosureIndicator
        //        cell.textLabel?.text = "\(indexPath.section)" + "_" + "\(indexPath.row)"
        //        return cell
        
        //old数据
        //let person: Person = data[indexPath.row]
        //new数据
        let row = indexPath.row;
        var person : Person?
        if row < (data.count) {
            //数据正常
            person = data[indexPath.row]
        } else {
            //数据异常
            person = nil
        }
        
        //system cell
        let cell = tableView.dequeueReusableCell(withIdentifier: TcellIdentity, for: indexPath) as! TCell
        cell.accessoryType = .disclosureIndicator
        //        cell.textLabel?.text = "\(indexPath.section)" + "\(indexPath.row)"
        //        cell.textLabel?.text = "112312312"
        //        cell.nameLabel.text = "\(indexPath.section)" + "_" + "\(indexPath.row)"
        //        cell.nameLabel.text = person.firstName + "_" + person.lastName + "_" + "\(person.age)" + "_" + "\(person.type.rawValue)"
        
        //选中效果
        cell.selectionStyle = .none
        //        if let temp = person {
        //            cell.firstNameLabel.text = temp.firstName
        //            cell.lastNameLabel.text = temp.lastName
        //            cell.ageLabel.text = "\(temp.age)"
        //        } else {
        //
        //        }
        
        if let temp = person {
            cell.fillViewWithData(data: temp)
        } else {
        }
        return cell
    }
    
    //滑动删除必须实现的方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        print("删除\(indexPath.row)")
        let index = indexPath.row
        data.remove(at: index)
        self.tableView.deleteRows(at: [indexPath], with: .top)
    }
    
}
