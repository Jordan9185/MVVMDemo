//
//  BaseApiService.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/28.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class BaseApiService {
    private let dispostBag = DisposeBag()
    private static let hostname = "https://jsonplaceholder.typicode.com/"
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
                return URL(string: BaseApiService.hostname + Path.posts.path)
            }
        }
    }
    
    private enum ApiError: Error {
        case urlError
    }
    
    func sendRequest<T: Codable>(url: URL?, type: T.Type) -> Single<T> {
        return Single<T>.create { observer in
            
            guard
                let url = url,
                UIApplication.shared.canOpenURL(url)
                else {
                    observer(.error(ApiError.urlError))
                    return Disposables.create {}
            }
            
            let req = URLRequest(url: url)
            
            let task = AF.request(req).responseDecodable { (res: DataResponse<T>) in
                switch res.result {
                case .failure(let error):
                    observer(.error(error))
                case .success(let value):
                    observer(.success(value))
                }
                
            }
            
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
