//
//  PostTableCell.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/31.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class PostTableCell: UITableViewCell {
    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 2
        label.text = ""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    var bodyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(bodyLabel)
        
        titleLabel.snp.makeConstraints { (m) in
            m.top.equalTo(5)
            m.leading.equalTo(15)
            m.trailing.equalTo(-15)
        }
        
        bodyLabel.snp.makeConstraints { (m) in
            m.top.equalTo(titleLabel.snp.bottom).offset(8)
            m.leading.trailing.equalTo(titleLabel)
            m.bottom.equalTo(-5)
        }
    }
    
    func bind(post: Post) {
        self.titleLabel.text = post.title
        self.bodyLabel.text = post.body
    }
}
