//
//  AppDelegate.swift
//  SurfEducationProject
//
//  Created by Malygin Georgii on 02.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }

        runMainFlow()

        return true
    }

    func runMainFlow() {
        window?.rootViewController = TabBarConfigurator().configure()
    }

}
