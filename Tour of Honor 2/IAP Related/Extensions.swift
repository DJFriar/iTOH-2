//
//  Extensions.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/15/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
//  Based on tutorial found at: https://blog.apphud.com/swift-tutorial-subscriptions/
//

import Foundation
import StoreKit

extension SKProduct {
    
    func subscriptionStatus() -> String {
        if let expDate = IAPManager.shared.expirationDateFor(productIdentifier) {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .medium
            
            let dateString = formatter.string(from: expDate)
            
            if Date() > expDate {
                return "Subscription expired: \(localizedTitle) at: \(dateString)"
            } else {
                return "Subscription active: \(localizedTitle) until:\(dateString)"
            }
        } else {
            return "Subscription not purchased: \(localizedTitle)"
        }
    }
    
    func localizedPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        let text = formatter.string(from: price)
        let period = subscriptionPeriod!.unit
        var periodString = ""
        switch period {
        case .day:
            periodString = "day"
        case .month:
            periodString = "month"
        case .week:
            periodString = "week"
        case .year:
            periodString = "year"
        default:
            break
        }
        let unitCount = subscriptionPeriod!.numberOfUnits
        let unitString = unitCount == 1 ? periodString : "\(unitCount) \(periodString)s"
        return (text ?? "") + "\nper \(unitString)"
    }
}
