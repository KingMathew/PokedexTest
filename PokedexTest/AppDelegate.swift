//
//  AppDelegate.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var globalNavigationController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let rootViewController = MainFlowWireFrame.createMainFlowModule()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        globalNavigationController = navigationController
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        return true
    }

    


}

