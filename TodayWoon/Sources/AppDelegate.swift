//
//  AppDelegate.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        
        self.window = window
        window.rootViewController = navigationController
        
        appCoordinator = AppCoordinator(navigationController)
        appCoordinator?.start()
        
        window.makeKeyAndVisible()
        
        return true
    }

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        return true
    }
}
