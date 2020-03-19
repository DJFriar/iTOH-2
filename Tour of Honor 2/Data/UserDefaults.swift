//
//  UserDefaults.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 3/4/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import Foundation

struct UserDefaultsConfig {
    @UserDefault("has_seen_app_introduction", defaultValue: false)
    static var hasSeenAppIntroduction: Bool
    
    @UserDefault("has_configured_app", defaultValue: false)
    static var hasConfiguredApp: Bool
    
    @UserDefault("initial_active_tab", defaultValue: 0)
    static var initialActiveTab: Int
    
    @UserDefault("riderFlagNumber", defaultValue: "")
    static var riderFlagNumber: String
    
    @UserDefault("pillionFlagNumber", defaultValue: "")
    static var pillionFlagNumber: String
    
    @UserDefault("trophyHunter", defaultValue: false)
    static var trophyHunter: Bool
    
    @UserDefault("useGoogleMaps", defaultValue: false)
    static var useGoogleMaps: Bool
    
    @UserDefault("isSubscriber", defaultValue: false)
    static var isSubscriber: Bool
        
}

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

class UserFilters: ObservableObject {
    @Published var category = "*"
    @Published var state = "*"
    @Published var region = "*"
    @Published var showing = true
}

class ActiveBonus: ObservableObject {
    @Published var category = ""
    @Published var name = ""
    @Published var code = ""
    @Published var state = ""
    @Published var city = ""
    @Published var region = ""
    @Published var captured = false
    @Published var sampleImage = ""
    @Published var gps = ""
    @Published var primaryImage = ""
    @Published var alternateImage = ""
    @Published var submitted = false
}

public func checkSubscription() -> String {
    guard let subscriptionExpirationDate:String = UserDefaults.standard.string(forKey: "net.tommyc.iTOH.AnnualSub") else {
        return "No Subscription Found"
    }
    return subscriptionExpirationDate
}
