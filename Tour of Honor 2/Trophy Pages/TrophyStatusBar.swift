//
//  TrophyStatusBar.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/23/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct TrophyStatusBar: View {
    var body: some View {
        HStack {
            Text("3/7 Captured")
                .padding(.leading, 12)
            Spacer()
            Button(action: {
                print("Trophy submitted")
            }) {
                Text("Submit Trophy")
                    .multilineTextAlignment(.center)
            }
            .padding(.trailing, 12)
        }
    }
}

struct TrophyStatusBar_Previews: PreviewProvider {
    static var previews: some View {
        TrophyStatusBar()
    }
}
