//
//  HorizontalCVC.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/21.
//  Copyright © 2020 tv. All rights reserved.
//

import UIKit

class HorizontalCVC: UIViewController {
    
    let cellIdentity = "CellID"
    let headerIdentity = "Header"
    let footerIdentity = "Footer"
    let cCellIdentity = "CCellID"
    
    
    var data: [Person] = []
    
    lazy var collectView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5);
        layout.itemSize = CGSize(width: 50 , height: 50)
        layout.minimumLineSpacing = 10.0;
        layout.minimumInteritemSpacing = 10.0
        //        //头尾
        //        layout.footerReferenceSize = CGSize(width: self.view.frame.width, height: 150)
        //        layout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 50)
        let collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = true
        //cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentity)
        collectionView.register(CCell.self, forCellWithReuseIdentifier: cCellIdentity)
        //头尾
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentity)
        collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerIdentity)
        
        return collectionView
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
        //关闭导航栏半透明效果
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(collectView)
        collectView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.height.equalTo(100)
        }
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

extension HorizontalCVC: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return 30
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //system cell
        //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentity, for: indexPath)
        //        cell.backgroundColor = UIColor.gray
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
        //user cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cCellIdentity, for: indexPath) as! CCell
        //        cell.backgroundColor = UIColor.gray
        if let temp = person {
            cell.fillViewWithData(data: temp)
        } else {
        }
        cell.backgroundColor = .red
        return cell
    }
    
    //设置 区头和区尾
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader  {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentity, for: indexPath) as! HeaderCollectionReusableView
            headerView.backgroundColor = UIColor.red
            return headerView
        }
        else
        {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentity, for: indexPath) as! FooterCollectionReusableView
            footerView.backgroundColor = UIColor.green
            return footerView
        }
    }
    
}

extension HorizontalCVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

