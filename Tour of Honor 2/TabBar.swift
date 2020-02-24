//
//  TabBar.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct TabBar : View {
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
            MailView()
            .tabItem({
                Image(systemName: "tray.and.arrow.up")
                Text("Email Test")
            })
            NationalParks()
                .tabItem({
                    Image(systemName: "shield")
                    Text("Parks")
                })
            BonusList2()
            .tabItem({
                Image(systemName: "flag")
                Text("Bonuses")
            })
        }
            .overlay(
                VStack {
                    Spacer()
                    Image("branding_stripe")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom,50)
                }
                
//                Rectangle()
//                .foregroundColor(.red)
//                    .frame(width: nil, height: 4)
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
