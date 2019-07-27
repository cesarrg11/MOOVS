//
//  AppDelegate.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    public var appConfiguration:AppConfigurationProtocol?

    
    /// Application inir
    ///
    /// - Parameters:
    ///   - application: Current application
    ///   - launchOptions: Launch options
    /// - Returns: Boolean result
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barTintColor = .redSoft
        UINavigationBar.appearance().isTranslucent = false
        UISegmentedControl.appearance().tintColor = .redSoft
        UITabBar.appearance().barTintColor = .redSoft
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().isTranslucent = false
        self.window?.tintColor = .white
        
        ServiceLocator.initValues()
        self.appConfiguration = ServiceLocator.resolve()
    
        return true
    }
}

