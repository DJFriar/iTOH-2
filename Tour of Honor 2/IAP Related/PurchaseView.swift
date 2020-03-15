//
//  PurchaseView.swift
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
import Combine

struct PurchaseView : View {
    
    @State private var isDisabled : Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    private func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }

    var body: some View {
                           
        ScrollView (showsIndicators: false) {
            
            VStack {
                Text("Unlock All Bonuses").font(.title)
                Text("Choose one of the packages above").font(.subheadline)
                
                self.purchaseButtons()
                self.aboutText()
                self.helperButtons()
                self.termsText().frame(width: UIScreen.main.bounds.size.width)
                self.dismissButton()
                
                }.frame(width : UIScreen.main.bounds.size.width)
            }.disabled(self.isDisabled)
    }

    // MARK:- View creations
    
    func purchaseButtons() -> some View {
        // remake to ScrollView if has more than 2 products because they won't fit on screen.
        HStack {
            Spacer()
            ForEach(ProductsStore.shared.products, id: \.self) { prod in
                PurchaseButton(block: {
                    self.purchaseProduct(skproduct: prod)
                }, product: prod).disabled(IAPManager.shared.isActive(product: prod))
            }
            Spacer()
        }
    }
    
    func helperButtons() -> some View{
        HStack {
            Button(action: {
                self.termsTapped()
            }) {
                Text("Terms of use").font(.footnote)
            }
            Button(action: {
                self.restorePurchases()
            }) {
                Text("Restore Purchases").font(.footnote)
            }
            Button(action: {
                self.privacyTapped()
            }) {
                Text("Privacy Policy").font(.footnote)
            }
            }.padding()
    }
    
    func aboutText() -> some View {
        Text("""
                • View state memorials as soon as they are released
                • Unlimited submissions
                • Unlock all auxilary bonuses
                """).font(.subheadline).lineLimit(nil)
    }
    
    func termsText() -> some View{
        // Set height to 600 because SwiftUI has bug that multiline text is getting cut even if linelimit is nil.
        VStack {
            Text(terms_text).font(.footnote).lineLimit(nil).padding()
            Spacer()
            }.frame(height: 350)
    }
    
    func dismissButton() -> some View {
        Button(action: {
            self.dismiss()
        }) {
            Text("Not now").font(.footnote)
            }.padding()
    }
    
    //MARK:- Actions
    
    func restorePurchases(){
        
        IAPManager.shared.restorePurchases(success: {
            self.isDisabled = false
            ProductsStore.shared.handleUpdateStore()
            self.dismiss()
            
        }) { (error) in
            self.isDisabled = false
            ProductsStore.shared.handleUpdateStore()
            
        }
    }
    
    func termsTapped(){
        
    }
    
    func privacyTapped(){
        
    }
    
    func purchaseProduct(skproduct : SKProduct){
        print("did tap purchase product: \(skproduct.productIdentifier)")
        isDisabled = true
        IAPManager.shared.purchaseProduct(product: skproduct, success: {
            self.isDisabled = false
            ProductsStore.shared.handleUpdateStore()
            self.dismiss()
        }) { (error) in
            self.isDisabled = false
            ProductsStore.shared.handleUpdateStore()
        }
    }
}
