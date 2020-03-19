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
    @State var trophyHunter = UserDefaultsConfig.trophyHunter
    @State private var selection = UserDefaultsConfig.initialActiveTab
    @State var hasConfiguredApp = UserDefaultsConfig.hasConfiguredApp
    @State var isSubscriber = UserDefaultsConfig.isSubscriber
    
    var body: some View {
        TabView(selection:$selection) {
            Settings()
                .tabItem({
                    Image(systemName: "gear")
                    Text("Settings")
                })
                .tag(0)
            if isSubscriber {
                Stats()
                    .tabItem({
                        Image(systemName: "gamecontroller")
                        Text("Stats")
                    })
                    .tag(1)
            }
            if trophyHunter {
                Trophies()
                    .tabItem({
                        Image(systemName: "sparkles")
                        Text("Trophies")
                    })
                    .tag(2)
            }
            //            NationalParks()
            //                .tabItem({
            //                    Image(systemName: "shield")
            //                    Text("Parks")
            //                })
            //                .tag(3)
            
            BonusList()
                .tabItem({
                    Image(systemName: "flag")
                    Text("Bonuses")
                })
                .tag(4)
        }
        .background(Color(UIColor.systemBackground))
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
            TabBar().darkModeFix()
            TabBar().darkModeFix()
                .previewDevice("iPhone SE")
                .environment(\.sizeCategory, .extraSmall)
        }
    }
}
