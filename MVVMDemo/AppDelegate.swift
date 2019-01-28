//
//  AppDelegate.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/28.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static let container: Container = {
        let ctner = Container()
        ctner.register(ApiService.self) { _ in ApiService() }

        return ctner
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
    
}
