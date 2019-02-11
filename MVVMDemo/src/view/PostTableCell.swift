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
            m.centerX.centerY.equalToSuperview()
            m.size.equalTo(CGSize(width: 300, height: 50))
        }
    }
    
    func bind(post: Post) {
        self.titleLabel.text = post.title
        self.bodyLabel.text = post.body
    }
}
