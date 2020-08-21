//
//  CCell.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/20.
//  Copyright © 2020 tv. All rights reserved.
//

import UIKit

class CCell: UICollectionViewCell {
    
    var person : Person?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.text = ""
        //        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.contentMode = .scaleAspectFit;
        //        imageView.image = UIImage(named: "ic_liveroom_addpeople")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(avatarImageView);
        self.contentView.addSubview(titleLabel);
        avatarImageView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(self.contentView)
        }
        titleLabel.snp.makeConstraints { (make) in 
            make.center.equalTo(self.contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coderå:) has not been implemented")
    }
    
    //    //数据填充
    //    func fillViewWithData(data:Any) {
    //    }
    
    //数据填充
    func fillViewWithData(data: Person) {
        person = data;
        if let temp = person {
            avatarImageView.image = UIImage(named: "ic_liveroom_addpeople")
            titleLabel.text = temp.firstName
        }
        
    }
}
