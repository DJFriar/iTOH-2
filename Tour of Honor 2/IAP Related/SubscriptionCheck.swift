//
//  SubscriptionCheck.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/19/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

class SubscriptionCheck: NSObject {
    
    @State var isSubscriber = UserDefaultsConfig.isSubscriber
    
    func checkSubscription() -> Int {
        if isSubscriber {
            //    If user is a subscriber, carry on
            print("User is a subscriber!")
            return 0
        } else {    //    If user is not a subscriber, check how many submissions they have done.
            print("User has exceeed free trial limits.")
            if Bonus.countSubmitted() > 6 {
                return 2
            } else {
                print("Free Trial Mode: \(Bonus.countSubmitted()) submissions used.")
                return 1
            }
        }
    }
}

