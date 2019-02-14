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
        ctner.register(PostApiService.self) { _ in PostApiService() }
        ctner.register(UserApiService.self) { _ in UserApiService() }
        return ctner
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let postNavigation = UINavigationController(rootViewController: PostViewController())
        postNavigation.tabBarItem = UITabBarItem(
            title: "Posts",
            image: nil,
            selectedImage: nil)
        
        let tabController = UITabBarController()
        tabController.viewControllers = [postNavigation]

        window?.rootViewController = tabController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
