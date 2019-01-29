//
//  PostApiService.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/29.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
import RxSwift

class PostApiService: BaseApiService {
    func getAllPosts() -> Single<[Post]> {
        return sendRequest(url: Path.posts.url, type: [Post].self)
    }
}
