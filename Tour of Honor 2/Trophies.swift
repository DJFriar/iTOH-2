//
//  Trophies.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct Trophies: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Trophies")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
                .padding(8)
                Spacer()
            }
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct Trophies_Previews: PreviewProvider {
    static var previews: some View {
        Trophies()
    }
}
