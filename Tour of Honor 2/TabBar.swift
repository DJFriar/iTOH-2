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
                    Image(systemName: "house")
                    Text("Stats")
                })
            Trophies()
                .tabItem({
                    Image(systemName: "sparkles")
                    Text("Trophies")
                })
            BonusList()
                .tabItem({
                    Image(systemName: "flag")
                    Text("Bonuses")
                })
            ContentView()
            .tabItem({
                Image(systemName: "flag")
                Text("Bonuses")
            })
        }
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
