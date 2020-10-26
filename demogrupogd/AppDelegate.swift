//
//  AppDelegate.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/24/20.
//

import UIKit
import SVProgressHUD
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.overrideUserInterfaceStyle = .light
            
        }
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        UITabBarItem.appearance().badgeColor = Constants.colorSecundario
        UITabBarItem.appearance()
            .setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: Constants.colorSecundario], for: .selected)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIToolbar.self]).tintColor = Constants.colorSecundario
        UINavigationBar.appearance().barTintColor = Constants.colorFondo
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor =
            .white
        UINavigationBar.appearance().tintColor = Constants.colorSecundario
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:
            UIColor.white]
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

