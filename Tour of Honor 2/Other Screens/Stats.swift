//
//  Stats.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct Stats: View {
    @State var showIAP = false
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Stats")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .padding(8)
                Spacer()
            }
            HStack {
                Text("This page is still under development, but will be updated soon.")
            }
//            HStack {
//                Text("Current Rank")
//                    .font(.headline)
//                    .padding(.leading, 8)
//                Spacer()
//                Text("39 of 984")
//                .font(.headline)
//            }
//            .padding(.trailing,16)
//            .padding(.leading,8)
//            .padding(.vertical,16)
//
//            HStack {
//                VStack(alignment: .leading) {
//
//                    Text("OVERALL STATS")
//                        .font(.caption)
//                    Text("Total Memorial Visits")
//                        .padding(.leading, 8)
//                    Text("Total Doughboy Visits")
//                        .padding(.leading, 8)
//                }
//                .padding(8)
//                Spacer()
//                VStack(alignment: .trailing) {
//                    Text("15,986")
//                    Text("786")
//                }
//                .padding(.top, 16)
//                .padding(.trailing, 16)
//            }
            HStack {
                VStack(alignment: .leading) {
                    Text("PERSONAL STATS")
                        .font(.caption)
                    Text("Total Submitted")
                        .padding(.leading, 8)
                    Text("Total Captured")
                        .padding(.leading, 8)
                    Text("Memorial Visits")
                        .padding(.leading, 8)
                    Text("Doughboy Visits")
                        .padding(.leading, 8)


                }
                .padding(8)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(Bonus.countSubmitted())")
                    Text("\(Bonus.countCaptured())")
                    Text("N/A")
                    Text("N/A")
                }
                .padding(.top, 16)
                .padding(.trailing, 16)
            }
            Spacer()
        }
    }
}



struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Stats().darkModeFix()
            Stats().environment(\.colorScheme, .light)
        }
    }
}
