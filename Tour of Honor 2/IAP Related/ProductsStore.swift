//
//  ProductsStore.swift
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

class ProductsStore : ObservableObject {
    
    static let shared = ProductsStore()
    
    @Published var products: [SKProduct] = []
    @Published var anyString = "123" // little trick to force reload ContentView from PurchaseView by just changing any Published value
    
    func handleUpdateStore(){
        anyString = UUID().uuidString
    }
    
    func initializeProducts(){
        IAPManager.shared.startWith(arrayOfIds: [subscription_1, subscription_2], sharedSecret: shared_secret) { products in
            self.products = products
        }
    }
}