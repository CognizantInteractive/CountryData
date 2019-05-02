//
//  AppDelegate.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window =  UIWindow()
        let mainViewController = CDViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.isNavigationBarHidden = false
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barStyle = .default
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        ReachabilityManager.shared.stopMonitoring()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        ReachabilityManager.shared.startMonitoring()
    }
}
