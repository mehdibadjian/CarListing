//
//  ListingCarCellTableViewCell.swift
//  CarListing
//
//  Created by Mehdi on 24/07/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit
import SnapKit

class ListingCarTableViewCell: UITableViewCell {
  
  var iconImageView: UIImageView!
  var carLabel: UILabel!
  var priceLabel: UILabel!
  var dateAddedLabel: UILabel!
  
  static var identifier: String {
    return String(describing: self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.configureView()
  }
  
  func configureView() {
    self.iconImageView = UIImageView.init()
    self.iconImageView.contentMode = UIViewContentMode.scaleAspectFill
    self.iconImageView.layer.masksToBounds = true
    self.iconImageView.layer.borderColor = UIColor.lightGray.cgColor
    self.iconImageView.layer.borderWidth = 1
    self.iconImageView.image = UIImage(named: "edit")
    self.addSubview(self.iconImageView)
  
    self.carLabel = UILabel(frame: .zero)
    self.carLabel.font = UIFont.boldSystemFont(ofSize: 12)
    self.carLabel.textColor = .black
    self.carLabel.lineBreakMode = .byWordWrapping
    self.carLabel.textAlignment = .left
    self.carLabel.numberOfLines = 1
    self.addSubview(self.carLabel)

    self.priceLabel = UILabel(frame: .zero)
    self.priceLabel.font = UIFont.systemFont(ofSize: 12)
    self.priceLabel.textColor = .black
    self.priceLabel.lineBreakMode = .byWordWrapping
    self.priceLabel.textAlignment = .left
    self.priceLabel.numberOfLines = 1
    self.addSubview(self.priceLabel)
    
    self.dateAddedLabel = UILabel(frame: .zero)
    self.dateAddedLabel.font = UIFont.systemFont(ofSize: 12)
    self.dateAddedLabel.textColor = .black
    self.dateAddedLabel.lineBreakMode = .byWordWrapping
    self.dateAddedLabel.textAlignment = .right
    self.dateAddedLabel.numberOfLines = 1
    self.addSubview(self.dateAddedLabel)
    
    self.layoutConstraints()
  }
  
  func layoutConstraints() {
    
    self.iconImageView.snp.makeConstraints { (make) in
      make.left.equalTo(self.snp.left).offset(20)
      make.centerY.equalTo(self)
      make.width.height.equalTo(80)
    }
    
    self.carLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.iconImageView.snp.right).offset(20)
      make.right.equalTo(self.snp.right).offset(-20)
      make.top.equalTo(self.iconImageView.snp.top).offset(0)
    }
    
    self.priceLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.carLabel.snp.left).offset(0)
      make.right.equalTo(self.carLabel.snp.right).offset(0)
      make.top.equalTo(self.carLabel.snp.bottom).offset(5)
    }
    
    self.dateAddedLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.carLabel.snp.left).offset(0)
      make.right.equalTo(self.carLabel.snp.right).offset(0)
      make.bottom.equalTo(self.iconImageView.snp.bottom).offset(0)
    }
  }
}
