//
//  IAPTestingView.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/15/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
//  Based on tutorial found at: https://blog.apphud.com/swift-tutorial-subscriptions/
//

import Foundation
import SwiftUI
import Combine
import StoreKit

struct IAPTestingView : View {

    @ObservedObject var productsStore : ProductsStore
    @State var show_modal = false
    
    var body: some View {
          
        VStack() {
            ForEach (productsStore.products, id: \.self) { prod in
                Text(prod.subscriptionStatus()).lineLimit(nil).frame(height: 80)
            }
            Button(action: {
                print("Button Pushed")
                self.show_modal = true
            }) {
                Text("Present")
            }.sheet(isPresented: self.$show_modal) {
                 PurchaseView()
            }
        }
    }
}

