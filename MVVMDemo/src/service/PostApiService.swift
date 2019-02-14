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
        case post(String)
        
        var path: String {
            switch self {
            case .posts:
                return "posts"
            case .post(let id):
                return "posts/\(id)"
            }
        }
        
        var url: URL? {
            switch self {
            case .posts:
                return URL(string: PostApiService.hostname + Path.posts.path)
            case .post(let id):
                return URL(string: PostApiService.hostname + Path.post(id).path)
            }
        }
    }
    
    func getAllPosts() -> Single<[Post]> {
        return sendRequest(url: Path.posts.url, type: [Post].self)
    }
    
    func getPost(by postId: String) -> Single<Post> {
        return sendRequest(url: Path.post(postId).url, type: Post.self)
    }
    
    func getPosts(by userId: String) {
        
    }
}
