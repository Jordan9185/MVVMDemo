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

class PostsViewModel: BaseViewModel {
    lazy var postApiService = getApiService(type: PostApiService.self)
    
    lazy var userApiService = getApiService(type: UserApiService.self)
    
    let posts = BehaviorRelay<[Post]>(value: [])
    
    let users = BehaviorRelay<[User]>(value: [])
    
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
    
    func getAllUser() {
        userApiService
            .getAllUser()
            .subscribe(
                onSuccess: { (users) in
                    self.users.accept(users)
            }) { (error) in
                print(error)
            }.disposed(by: bag)
    }
}
