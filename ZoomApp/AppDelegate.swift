//
//  AppDelegate.swift
//  ZoomApp
//
//  Created by Himalaya Rajput on 16/04/20.
//  Copyright © 2020 Himalaya Rajput. All rights reserved.
//

import UIKit
import MobileRTC
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MobileRTCAuthDelegate {
    func onMobileRTCAuthReturn(_ returnValue: MobileRTCAuthError) {
        if returnValue != MobileRTCAuthError_Success {
            print("SDK authentication failed")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MobileRTC.shared().switchDomain("zoom.us", force: false)
        print(MobileRTC.shared().mobileRTCDomain)
        let authService = MobileRTC.shared().getAuthService()
        print(authService)
        if (authService != nil) {
            authService?.delegate = self
            authService?.clientKey = "bJqGEoYlZOVvJo8vBXPXN7ei68076j0Aoy5r"
            authService?.clientSecret = "jqlJ8drZf6wXJnA91HRdA98D8EStAr7ZxVxh"
            authService?.sdkAuth()
        }
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

