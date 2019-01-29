//
//  MainViewModel.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/29.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel: BaseViewModel {
    lazy var postApiService = getApiService(type: PostApiService.self)
    
    let posts = BehaviorRelay<[Post]>(value: [])
    
    func getAllPost() {
        postApiService
            .getAllPosts()
            .subscribe(
                onSuccess: { (posts) in
                    self.posts.accept(posts)
            }) { (error) in
                print(error)
        }.disposed(by: bag)
    }
}
