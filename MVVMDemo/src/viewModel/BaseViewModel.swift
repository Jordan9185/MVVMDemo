//
//  BaseViewModel.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/29.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class BaseViewModel {
    let bag = DisposeBag()
    
    func getApiService<T: BaseApiService>(type: T.Type) -> T {
        guard let service = AppDelegate.container.resolve(T.self) else {
            fatalError("Container not regist \(type)")
        }
        return service
    }
}
