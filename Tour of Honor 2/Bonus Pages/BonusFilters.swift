//
//  BonusFilters.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 5/4/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct BonusFilters: View {
    @EnvironmentObject var filters: UserFilters

    var body: some View {
        VStack{
        Text("Categories")
          List {

            ForEach([
                ["All",""],
                ["Doughboys","Doughboys"],
                ["Gold Star Family","Gold Star Family"],
                ["Hueys","Hueys"],
                ["Madonna Trail","Madonna of the Trail"],
                ["Tour of Honor","Tour of Honor"],
                ["War Dogs / K9","War Dogs"]
            ], id: \.self) {
              item in
              HStack {
                Button(action: { print("\(item[1])"); self.filters.category = item[1]; self.filters.tabSelection = 4} ) {
                    Text("\(item[0])")
                }
              }
            }
            .buttonStyle(BorderlessButtonStyle())
          }
        Text("States")
        List {
            ForEach([
                        ["All",""],
                        ["Alabama","AL"],
                        ["Alaska","AK"],
                        ["Arizona","AZ"],
                        ["Arkansas","AR"],
                        ["California","CA"],
                        ["Colorado","CO"],
                        ["Connecticut","CT"],
                        ["Delaware","DE"],
                        ["Florida","FL"],
                        ["Georgia","GA"],
                        ["Hawaii","HI"],
                        ["Idaho","ID"],
                        ["Illinois","IL"],
                        ["Indiana","IN"],
                        ["Iowa","IA"],
                        ["Kansas","KS"],
                        ["Kentucky","KY"],
                        ["Louisiana","LA"],
                        ["Maine","ME"],
                        ["Maryland","MD"],
                        ["Massachusetts","MA"],
                        ["Michigan","MI"],
                        ["Minnesota","MN"],
                        ["Mississippi","MS"],
                        ["Missouri","MO"],
                        ["Montana","MT"],
                        ["Nebraska","NE"],
                        ["Nevada","NV"],
                        ["New Hampshire","NH"],
                        ["New Jersey","NJ"],
                        ["New Mexico","NM"],
                        ["New York","NY"],
                        ["North Carolina","NC"],
                        ["North Dakota","ND"],
                        ["Ohio","OH"],
                        ["Oklahoma","OK"],
                        ["Oregon","OR"],
                        ["Pennsylvania","PA"],
                        ["Rhode Island","RI"],
                        ["South Carolina","SC"],
                        ["South Dakota","SD"],
                        ["Tennessee","TN"],
                        ["Texas","TX"],
                        ["Utah","UT"],
                        ["Vermont","VT"],
                        ["Virginia","VA"],
                        ["Washington","WA"],
                        ["West Virginia","WV"],
                        ["Wisconsin","WI"],
                        ["Wyoming","WY"]
            ], id: \.self) {
                item in
                HStack {
                    Button(action: { print("\(item[1])"); self.filters.state = item[1]; self.filters.tabSelection = 4} ) {
                        Text("\(item[0])")
                    }
                }
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
    }
    
}

struct BonusFilters_Previews: PreviewProvider {
    static var previews: some View {
        BonusFilters()
    }
}
