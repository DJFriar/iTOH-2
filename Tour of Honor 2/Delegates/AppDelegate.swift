//
//  AppDelegate.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Setup DB
        CoreData.initialDbSetup()
        
        // Verify Subscription
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
        if let date = formatter.date(from: checkSubscription()) {
            if date > Date() || UserDefaults.standard.object(forKey: "net.tommyc.iTOH.AnnualSub") == nil {
                UserDefaultsConfig.isSubscriber = true
            }
        }
        print("Expiration is \(checkSubscription()) and isSubscriber is \(UserDefaultsConfig.isSubscriber)")
        
        // Setup Imagery
        ImageWriter.copyFilesFromBundleToDocumentsFolderWith(fileExtension: ".png")
//        ImageWriter.copyFilesFromBundleToDocumentsFolderWith(fileExtension: ".jpg")
        
        #if PROD
        print("Production build!")
        #elseif DEV
        print("Development build")
        #elseif DEBUG
        print("Debug build")
        #endif
        
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

