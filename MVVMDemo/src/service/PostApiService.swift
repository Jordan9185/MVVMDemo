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
    enum Path {
        case posts
        
        var path: String {
            switch self {
            case .posts:
                return "posts"
            }
        }
        
        var url: URL? {
            switch self {
            case .posts:
                return URL(string: PostApiService.hostname + Path.posts.path)
            }
        }
    }
    
    func getAllPosts() -> Single<[Post]> {
        return sendRequest(url: Path.posts.url, type: [Post].self)
    }
    
    func getPost(by postId: Int) {
        
    }
    
    func getPosts(by userId: Int) {
        
    }
}
