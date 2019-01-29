//
//  MainViewController.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/28.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    private let viewModel: MainViewModel = MainViewModel()
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.posts.asObservable().bind { (posts) in
            print(posts)
        }.disposed(by: bag)
        
        viewModel.getAllPost()
    }
}

