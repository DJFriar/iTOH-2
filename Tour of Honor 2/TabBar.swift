//
//  TabBar.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct TabBar : View {
    
    @EnvironmentObject var filters: UserFilters

    var body: some View {

        
        TabView {
            Settings()
                .tabItem({
                    Image(systemName: "gear")
                    Text("Settings")
                })
            Stats()
                .tabItem({
                    Image(systemName: "gamecontroller")
                    Text("Stats")
                })
            Trophies()
                .tabItem({
                    Image(systemName: "sparkles")
                    Text("Trophies")
                })
//            NationalParks()
//                .tabItem({
//                    Image(systemName: "shield")
//                    Text("Parks")
//                })
            PurchaseView()
                .tabItem({
                    Image(systemName: "shield")
                    Text("IAP")
                })
            BonusList()
            .tabItem({
                Image(systemName: "flag")
                Text("Bonuses")
            })
        }
                        .background(Color.primary)
            .overlay(
                VStack {
                    Spacer()
                    Image("branding_stripe")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom,50)
                }
            )
        .edgesIgnoringSafeArea(.top)

    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().environment(\.colorScheme, .dark)
            TabBar()
                .previewDevice("iPhone SE")
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraSmall)
        }
    }
}
