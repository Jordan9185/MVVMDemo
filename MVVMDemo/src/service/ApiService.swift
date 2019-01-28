//
//  ApiService.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/28.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class ApiService {
    private let dispostBag = DisposeBag()
    private static let hostname = "https://jsonplaceholder.typicode.com/"
    private enum Path {
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
                return URL(string: ApiService.hostname + Path.posts.path)
            }
        }
    }
    
    private enum ApiError: Error {
        case urlError
    }
    
    func getAllPosts() -> Single<[Post]> {
        return Single<[Post]>.create { observer in
            
            guard
                let postsUrl = Path.posts.url,
                UIApplication.shared.canOpenURL(postsUrl)
                else {
                    observer(.error(ApiError.urlError))
                    
                    return Disposables.create {}
            }
            
            
            let req = URLRequest(url: postsUrl)

            let task = AF.request(req).responseDecodable { (res: DataResponse<[Post]>) in
                observer(.success(res.result.value ?? []))
            }
            
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
