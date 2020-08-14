//
//  AppDelegate.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/05.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let vc = GitHubSearchRepositoryListViewController()
        let ui = GitHubSearchRepositoryUIImpl()
        ui.viewController = vc
        let presenter = GitHubSearchRepositoryPresenterImpl()
        vc.inject(ui: ui, presenter: presenter)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        
        
        return true
    }
}

