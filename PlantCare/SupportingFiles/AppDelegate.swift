//
//  AppDelegate.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarController: MainTabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        AppAppearance.setup()
        
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        
        tabBarController = MainTabBarController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .primaryText
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        AppData.loadFromCache()
        
        return true
    }

}

