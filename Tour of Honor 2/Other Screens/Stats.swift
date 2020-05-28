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
                    Text("OVERALL STATS")
                        .font(.caption)
                        .padding(.top,8)
                    Text("Total Submitted")
                        .padding(.leading, 8)
                    Text("Total Captured")
                        .padding(.leading, 8)
                    Text("")
                        .padding(.leading, 8)
                    Text("CATEGORY STATS")
                        .font(.caption)
                        .padding(.top,8)
                    Text("Memorials (TOH)")
                        .padding(.leading, 8)
                    Text("Doughboys (DB)")
                        .padding(.leading, 8)
                    Text("Hueys (H)")
                        .padding(.leading, 8)
                    Text("K9 / War Dogs (K9)")
                        .padding(.leading, 8)
                    Text("Gold Star Families (GSF)")
                        .padding(.leading, 8)
                    //                    Text("National Parks (NP)")
                    //                        .padding(.leading, 8)
                }
                .padding(8)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("")
                        .font(.caption)
                        .padding(.top,8)
                    Text("\(Bonus.countSubmitted())")
                    Text("\(Bonus.countCaptured())")
                    Text("")
                    Text("")
                        .font(.caption)
                        .padding(.top,8)
                    Text("\(Bonus.countSubmittedTOH())")
                    Text("\(Bonus.countSubmittedDB())")
                    Text("\(Bonus.countSubmittedHuey())")
                    Text("\(Bonus.countSubmittedK9())")
                    Text("\(Bonus.countSubmittedGSF())")
                    //                    Text("\(Bonus.countSubmittedNPT())")
                }
                .padding(8)
                //                .padding(.top, 16)
                //                .padding(.trailing, 16)
            }
            HStack {
                Text("* Note that all of the above stats are tracked within the app itself only and do not reflect what the TOH has or has not received. Submitted means that you pressed the Submit Memorial button. Captured means you took a picture, but have not pressed Submit yet.")
                    .padding(.top,16)
                    .font(.caption)
            }
            HStack {
                Text("** This page only updates when the app is opened. If you have taken and submitted some more memorials, then the next time the app is quit and re-opened these stats will be updated.")
                    .padding(.top,16)
                    .font(.caption)
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
