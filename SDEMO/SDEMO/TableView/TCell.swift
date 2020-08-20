//
//  TCell.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/20.
//  Copyright © 2020 tv. All rights reserved.
//

import UIKit

class TCell: UITableViewCell {
    
    lazy var firstNameLabel: UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.text = ""
        //        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.text = ""
        //        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.text = ""
        //        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.contentMode = .scaleAspectFit;
        imageView.image = UIImage(named: "ic_liveroom_addpeople")
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(avatarImageView);
        self.contentView.addSubview(firstNameLabel);
        self.contentView.addSubview(lastNameLabel);
        self.contentView.addSubview(ageLabel);
        
        //        avatarImageView.backgroundColor = UIColor.green;
        //        firstNameLabel.backgroundColor = UIColor.green;
        //        lastNameLabel.backgroundColor = UIColor.green;
        
        avatarImageView.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            //            make.leading.equalToSuperview().offset(10)
            make.leading.equalTo(self.contentView).offset(10)
            make.centerY.equalTo(self.contentView)
            
        }
        
        ageLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-10)
            make.centerY.equalTo(self.contentView)
        }
        
        firstNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            make.trailing.lessThanOrEqualTo(ageLabel.snp.leading).offset(-10)
            make.top.equalTo(avatarImageView.snp.top)
            make.height.equalTo(25)
        }
        lastNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            make.trailing.lessThanOrEqualTo(ageLabel.snp.leading).offset(-10)
            make.bottom.equalTo(avatarImageView.snp.bottom)
            make.height.equalTo(25)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
