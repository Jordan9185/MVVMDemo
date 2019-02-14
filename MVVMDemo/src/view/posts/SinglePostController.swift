//
//  SinglePostController.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/2/11.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SinglePostController: UIViewController {
    private let post: Post
    
    private let contentView: UITextView = {
        let v = UITextView(frame: .zero)
        return v
    }()
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.text = post.body
    }

    private func setupViews() {
        self.view.addSubview(contentView)
        
        contentView.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
    }
}
