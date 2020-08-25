//
//  TCell.swift
//  SDEMO
//
//  Created by rrtv on 2020/8/20.
//  Copyright © 2020 tv. All rights reserved.
//

import UIKit


protocol TCellDelegate: NSObjectProtocol {
    
    func follow(cell: TCell, person: Person)
}

class TCell: UITableViewCell {
    
    var person : Person?
    weak var delegate:TCellDelegate?
    
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
        //        imageView.image = UIImage(named: "ic_liveroom_addpeople")
        return imageView
    }()
    
    
    lazy var followButton: UIButton = {
        let btn = UIButton.init()
        btn.frame = CGRect(x: 0, y: 200, width: 200, height: 50)
        
        //文字
        btn.setTitle("关注", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        
        //设置按钮图片
        //btn.setBackgroundImage(UIImage(named: "gougou.jpg"), for: .normal)
        //           btn.setImage(UIImage(named: "ic_inputbox_delete_noclickable"), for: .normal)
        
        //背景色
        //        btn.backgroundColor = UIColor.gray
        
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
        
        //点击
        //           btn.addTarget(self, action: #selector(buttonClick1), for: .touchUpInside)
        btn.addTarget(self, action: #selector(clickFollowBtn(button:)), for: .touchUpInside)
        //btn.addTarget(self, action: #selector(switchTypeAction), for: .touchUpInside)
        
        return btn
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
        self.contentView.addSubview(followButton);
        
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
        
        
        followButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    //数据填充
    //    func fillViewWithData(data:Any) {
    //    }
    
    //数据填充
    func fillViewWithData(data: Person) {
        person = data; 
        if let temp = person {
            avatarImageView.image = UIImage(named: "ic_liveroom_addpeople")
            firstNameLabel.text = temp.firstName
            lastNameLabel.text = temp.lastName
            ageLabel.text = "\(temp.age)"
            
            if !temp.isFollow {
                followButton.setTitle("关注", for: .normal)
                followButton.setTitleColor(UIColor.red, for: .normal)
            } else {
                followButton.setTitle("已关注", for: .normal)
                followButton.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @objc func clickFollowBtn(button: UIButton) {
        print("你点击了我这个Follow按钮 ");
        if self.delegate != nil {
            if let temp = person {
                self.delegate?.follow(cell: self, person: temp)
            }
        }
        
    }
}
