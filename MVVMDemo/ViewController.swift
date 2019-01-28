//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/28.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let apiService = AppDelegate.container.resolve(ApiService.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService?.getAllPosts().subscribe(onSuccess: { (posts) in
            print(posts)
        }, onError: { (error) in
            print(error)
        }).dispose()
        
    }


}

