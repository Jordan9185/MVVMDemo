//
//  UserApiService.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/30.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
import RxSwift

class UserApiService: BaseApiService {
    
    enum Path {
        case users
        
        var path: String {
            switch self {
            case .users:
                return "users"
            }
        }
        
        var url: URL? {
            switch self {
            case .users:
                return URL(string: UserApiService.hostname + Path.users.path)
            }
        }
    }
    
    func getAllUser() -> Single<[User]> {
        return sendRequest(url: Path.users.url, type: [User].self)
    }
    
    func getUserProfile(by userId: Int) {
        
    }
}
