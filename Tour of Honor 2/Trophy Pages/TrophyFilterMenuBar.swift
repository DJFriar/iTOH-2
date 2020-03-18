//
//  FilterMenuBar.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/16/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct TrophyFilterMenuBar: View {
    @EnvironmentObject var filters: UserFilters
    @State private var showingCategoryFilter = false
    @State private var showingStateFilter = false
    @State private var showingRegionFilter = false
    
    var categories = Bonus.getBonusesKey(key: "category")
    let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
    var body: some View {
        ZStack {
            HStack(alignment: .center){
                Spacer()
                HStack {
                    Button(action: { self.showingCategoryFilter = true }) {
                        Text("Categories")
                            .frame(width: 80, height: 20, alignment: .center)
                            .padding(2)
                            .padding(.horizontal,10)
                            .font(.footnote)
                    }.actionSheet(isPresented: $showingCategoryFilter) {
                        ActionSheet(title: Text("Category"), message: Text("Current: \(self.filters.category)"), buttons: [
                            .default(Text("All")) { self.filters.category = "*"  },
                            .default(Text("Doughboys")) {  self.filters.category = "Doughboys" },
                            .default(Text("Gold Star Family")) { self.filters.category = "Gold Star Family"  },
                            .default(Text("Hueys")) {self.filters.category = "Hueys"  },
                            .default(Text("Madonna Trail")) {self.filters.category = "Madonna Trail"  },
                            .default(Text("Tour of Honor")) { self.filters.category = "Tour of Honor" },
                            .default(Text("War Dogs")) { self.filters.category = "War Dogs"  },
                            .cancel()
                        ])
                    }
                }
                .background(Color(UIColor.systemGray5))
                .cornerRadius(40)
                .padding(.trailing,10)
                HStack {
                    Button(action: { self.showingRegionFilter = true }) {
                        Text("Regions")
                            .frame(width: 80, height: 20, alignment: .center)
                            .padding(2)
                            .padding(.horizontal,10)
                            .font(.footnote)
                    }.actionSheet(isPresented: $showingRegionFilter) {
                        ActionSheet(title: Text("Region"), message: Text("Current: \(self.filters.region)"), buttons: [
                            .default(Text("All")) { self.filters.region = "*"  },
                            .default(Text("Alabama")){ self.filters.region = "AL"  },
                            .default(Text("Alaska")){ self.filters.region = "AK"  },
                            .default(Text("Arizona")){ self.filters.region = "AZ"  },
                            .default(Text("Arkansas")){ self.filters.region = "AR"  },
                            .default(Text("California")){ self.filters.region = "CA"  },
                            .default(Text("Colorado")){ self.filters.region = "CO"  },
                            .default(Text("Connecticut")){ self.filters.region = "CT"  },
                            .default(Text("Dakotas")) {  self.filters.region = "Dakotas" },
                            .default(Text("Delaware")){ self.filters.region = "DE"  },
                            .default(Text("Florida")){ self.filters.region = "FL"  },
                            .default(Text("Georgia")){ self.filters.region = "GA"  },
                            .default(Text("Hawaii")){ self.filters.region = "HI"  },
                            .default(Text("Idaho")){ self.filters.region = "ID"  },
                            .default(Text("Illinois")){ self.filters.region = "IL"  },
                            .default(Text("Indiana")){ self.filters.region = "IN"  },
                            .default(Text("Iowa")){ self.filters.region = "IA"  },
                            .default(Text("Kansas")){ self.filters.region = "KS"  },
                            .default(Text("Kentucky")){ self.filters.region = "KY"  },
                            .default(Text("Louisiana")){ self.filters.region = "LA"  },
                            .default(Text("Maine")){ self.filters.region = "ME"  },
                            .default(Text("Maryland")){ self.filters.region = "MD"  },
                            .default(Text("Massachusetts")){ self.filters.region = "MA"  },
                            .default(Text("Michigan")){ self.filters.region = "MI"  },
                            .default(Text("Mid-Atlantic")) { self.filters.region = "Mid-Atlantic"  },
                            .default(Text("Minnesota")){ self.filters.region = "MN"  },
                            .default(Text("Mississippi")){ self.filters.region = "MS"  },
                            .default(Text("Missouri")){ self.filters.region = "MO"  },
                            .default(Text("Montana")){ self.filters.region = "MT"  },
                            .default(Text("Nebraska")){ self.filters.region = "NE"  },
                            .default(Text("Nevada")){ self.filters.region = "NV"  },
                            .default(Text("New England")) {self.filters.region = "New England"  },
                            .default(Text("New Hampshire")){ self.filters.region = "NM"  },
                            .default(Text("New Jersey")){ self.filters.region = "NJ"  },
                            .default(Text("New Mexico")){ self.filters.region = "NM"  },
                            .default(Text("New York")){ self.filters.region = "NY"  },
                            .default(Text("North Carolina")){ self.filters.region = "NC"  },
                            .default(Text("North Dakota")){ self.filters.region = "ND"  },
                            .default(Text("Ohio")){ self.filters.region = "OH"  },
                            .default(Text("Oklahoma")){ self.filters.region = "OK"  },
                            .default(Text("Oregon")){ self.filters.region = "OR"  },
                            .default(Text("Pennsylvania")){ self.filters.region = "PA"  },
                            .default(Text("Rhode Island")){ self.filters.region = "RI"  },
                            .default(Text("South Carolina")){ self.filters.region = "SC"  },
                            .default(Text("South Dakota")){ self.filters.region = "SD"  },
                            .default(Text("Tennessee")){ self.filters.region = "TN"  },
                            .default(Text("Texas")){ self.filters.region = "TX"  },
                            .default(Text("Utah")){ self.filters.region = "UT"  },
                            .default(Text("Vermont")){ self.filters.region = "VT"  },
                            .default(Text("Virginia")){ self.filters.region = "VA"  },
                            .default(Text("Washington")){ self.filters.region = "WA"  },
                            .default(Text("Washington, DC")){ self.filters.region = "DC"  },
                            .default(Text("West Virginia")){ self.filters.region = "WV"  },
                            .default(Text("Wisconsin")){ self.filters.region = "WI"  },
                            .default(Text("Wyoming")){ self.filters.region = "WY"  },
                            .cancel()
                        ])
                    }
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(40)
                    .padding(.trailing,10)
                }
                Spacer()
//                HStack {
//                    Button(action: { self.showingRegionFilter = true }) {
//                        Text("Regions")
//                            .frame(width: 80, height: 20, alignment: .center)
//                            .padding(2)
//                            .padding(.horizontal,10)
//                            .font(.footnote)
//                    }.actionSheet(isPresented: $showingRegionFilter) {
//                        ActionSheet(title: Text("Region"), message: Text("Current: \(self.filters.category)"), buttons: [
//                            .default(Text("All")) { self.filters.category = "*"  },
//                            .default(Text("Dakotas")) {  self.filters.category = "Dakotas" },
//                            .default(Text("Mid-Atlantic")) { self.filters.category = "Mid-Atlantic"  },
//                            .default(Text("New England")) {self.filters.category = "New England"  },
//                            .default(Text("Everything Else")) {self.filters.category = "Everything Else"  },
//                            .cancel()
//                        ])
//                    }
//                }
//                .background(Color(UIColor.systemGray5))
//                .cornerRadius(40)
//                Spacer()
            }
            .padding(4)
        }
        .padding(.bottom,4)
        .background(Color.clear)
    }
}

struct TrophyFilterMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FilterMenuBar().environment(\.colorScheme, .dark)
            FilterMenuBar().environment(\.colorScheme, .light)
        }
    }
}
