//
//  FilterMenuBar.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 3/7/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct FilterMenuBar: View {
    @EnvironmentObject var filters: UserFilters
    @State private var showingCategoryFilter = false
    @State private var showingStateFilter = false
    @State private var showingRegionFilter = false
    
    var categories = Bonus.getBonusesKey(key: "category")
    let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
    var body: some View {
        ZStack{
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
                            .default(Text("Madonna Trail")) {self.filters.category = "Madonna of the Trail"  },
                            .default(Text("Tour of Honor")) { self.filters.category = "Tour of Honor" },
                            .default(Text("War Dogs / K9")) { self.filters.category = "War Dogs"  },
                            .cancel()
                        ])
                    }
                }
                .background(Color(UIColor.systemGray5))
                .cornerRadius(40)
                .padding(.trailing,10)
                HStack {
                    Button(action: { self.showingStateFilter = true }) {
                        Text("States")
                            .frame(width: 80, height: 20, alignment: .center)
                            .padding(2)
                            .padding(.horizontal,10)
                            .font(.footnote)
                    }.actionSheet(isPresented: $showingStateFilter) {
                        ActionSheet(title: Text("State"), message: Text("Current: \(self.filters.state)"), buttons: [
                            .default(Text("All")) { self.filters.state = "*"  },
                            .default(Text("Alabama")){ self.filters.state = "AL"  },
                            .default(Text("Alaska")){ self.filters.state = "AK"  },
                            .default(Text("Arizona")){ self.filters.state = "AZ"  },
                            .default(Text("Arkansas")){ self.filters.state = "AR"  },
                            .default(Text("California")){ self.filters.state = "CA"  },
                            .default(Text("Colorado")){ self.filters.state = "CO"  },
                            .default(Text("Connecticut")){ self.filters.state = "CT"  },
                            .default(Text("Delaware")){ self.filters.state = "DE"  },
                            .default(Text("Florida")){ self.filters.state = "FL"  },
                            .default(Text("Georgia")){ self.filters.state = "GA"  },
                            .default(Text("Hawaii")){ self.filters.state = "HI"  },
                            .default(Text("Idaho")){ self.filters.state = "ID"  },
                            .default(Text("Illinois")){ self.filters.state = "IL"  },
                            .default(Text("Indiana")){ self.filters.state = "IN"  },
                            .default(Text("Iowa")){ self.filters.state = "IA"  },
                            .default(Text("Kansas")){ self.filters.state = "KS"  },
                            .default(Text("Kentucky")){ self.filters.state = "KY"  },
                            .default(Text("Louisiana")){ self.filters.state = "LA"  },
                            .default(Text("Maine")){ self.filters.state = "ME"  },
                            .default(Text("Maryland")){ self.filters.state = "MD"  },
                            .default(Text("Massachusetts")){ self.filters.state = "MA"  },
                            .default(Text("Michigan")){ self.filters.state = "MI"  },
                            .default(Text("Minnesota")){ self.filters.state = "MN"  },
                            .default(Text("Mississippi")){ self.filters.state = "MS"  },
                            .default(Text("Missouri")){ self.filters.state = "MO"  },
                            .default(Text("Montana")){ self.filters.state = "MT"  },
                            .default(Text("Nebraska")){ self.filters.state = "NE"  },
                            .default(Text("Nevada")){ self.filters.state = "NV"  },
                            .default(Text("New Hampshire")){ self.filters.state = "NM"  },
                            .default(Text("New Jersey")){ self.filters.state = "NJ"  },
                            .default(Text("New Mexico")){ self.filters.state = "NM"  },
                            .default(Text("New York")){ self.filters.state = "NY"  },
                            .default(Text("North Carolina")){ self.filters.state = "NC"  },
                            .default(Text("North Dakota")){ self.filters.state = "ND"  },
                            .default(Text("Ohio")){ self.filters.state = "OH"  },
                            .default(Text("Oklahoma")){ self.filters.state = "OK"  },
                            .default(Text("Oregon")){ self.filters.state = "OR"  },
                            .default(Text("Pennsylvania")){ self.filters.state = "PA"  },
                            .default(Text("Rhode Island")){ self.filters.state = "RI"  },
                            .default(Text("South Carolina")){ self.filters.state = "SC"  },
                            .default(Text("South Dakota")){ self.filters.state = "SD"  },
                            .default(Text("Tennessee")){ self.filters.state = "TN"  },
                            .default(Text("Texas")){ self.filters.state = "TX"  },
                            .default(Text("Utah")){ self.filters.state = "UT"  },
                            .default(Text("Vermont")){ self.filters.state = "VT"  },
                            .default(Text("Virginia")){ self.filters.state = "VA"  },
                            .default(Text("Washington")){ self.filters.state = "WA"  },
                            .default(Text("Washington, DC")){ self.filters.state = "DC"  },
                            .default(Text("West Virginia")){ self.filters.state = "WV"  },
                            .default(Text("Wisconsin")){ self.filters.state = "WI"  },
                            .default(Text("Wyoming")){ self.filters.state = "WY"  },
                            .cancel()
                        ])
                    }
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(40)
                    .padding(.trailing,10)
                }
                Spacer()
            }
            .padding(4)
        }
        .padding(.bottom,4)
        .background(Color.clear)
    }
}

struct FilterMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FilterMenuBar().environment(\.colorScheme, .dark)
            FilterMenuBar().environment(\.colorScheme, .light)
        }
    }
}
