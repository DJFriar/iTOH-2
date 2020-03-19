//
//  PurchaseButton.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/15/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
//  Based on tutorial found at: https://blog.apphud.com/swift-tutorial-subscriptions/
//

import Foundation
import SwiftUI
import StoreKit

struct PurchaseButton : View {
    
    var block : SuccessBlock!
    var product : SKProduct!
    
    var body: some View {
        
        Button(action: {
            self.block()
        }) {
            Text(product.localizedPrice())
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .font(.subheadline)
        }
        .padding(.vertical, 4)
            .frame(width: 120, height: 50)
            .scaledToFill()
            .border(Color(UIColor.systemBlue), width: 1)
    }
}
