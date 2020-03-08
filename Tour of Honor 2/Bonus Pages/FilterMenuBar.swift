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
    
    var categories = Bonus.getBonusesKey(key: "category")
    let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
    var body: some View {
        ZStack{
            HStack(alignment: .center, spacing: 60){
                Button(action: { self.showingCategoryFilter = true }) {
                               Text("Categories")
                                   .padding(2)
                                   .padding(.leading,40)
                                   .font(.footnote)
                                   .foregroundColor(.white)
                           }.actionSheet(isPresented: $showingCategoryFilter) {
                            ActionSheet(title: Text("Category"), message: Text("Current: \(self.filters.category)"), buttons: [
                                   .default(Text("Tour of Honor")) { self.filters.category = "Tour of Honor" },
                                   .default(Text("Hueys")) {self.filters.category = "Hueys"  },
                                   .default(Text("Doughboys")) {  self.filters.category = "Doughboys" },
                                   .default(Text("War Dogs")) { self.filters.category = "War Dogs"  },
                                   .default(Text("Gold Star Family")) { self.filters.category = "Gold Star Family"  },
                                    .default(Text("All")) { self.filters.category = ""  },
                                   .cancel()
                               ])
                           }
                           
                Button(action: { self.showingStateFilter = true }) {
                               Text("States")
                                   .padding(2)
                                   .padding(.trailing,40)
                                   .font(.footnote)
                                   .foregroundColor(.white)
                }.actionSheet(isPresented: $showingStateFilter) {
                            ActionSheet(title: Text("State"), message: Text("Current: \(self.filters.state)"), buttons: [
                                    .default(Text("Alabama")){ self.filters.state = "AL"  },
                                    .default(Text("Alaska")){ self.filters.state = "AK"  },
                                    .default(Text("Arizona")){ self.filters.state = "Arizona"  },
                                    .default(Text("Arkansas")){ self.filters.state = "Arkansas"  },
                                    .default(Text("California")){ self.filters.state = "California"  },
                                    .default(Text("Colorado")){ self.filters.state = "Colorado"  },
                                    .default(Text("Dakotas")){ self.filters.state = "Dakotas"  },
                                    .default(Text("Florida")){ self.filters.state = "Florida"  },
                                    .default(Text("Georgia")){ self.filters.state = "Georgia"  },
                                    .default(Text("Hawaii")){ self.filters.state = "Hawaii"  },
                                    .default(Text("Idaho")){ self.filters.state = "Idaho"  },
                                    .default(Text("Illinois")){ self.filters.state = "Illinois"  },
                                    .default(Text("Indiana")){ self.filters.state = "Indiana"  },
                                    .default(Text("Iowa")){ self.filters.state = "Iowa"  },
                                    .default(Text("Kansas")){ self.filters.state = "Kansas"  },
                                    .default(Text("Kentucky")){ self.filters.state = "Kentucky"  },
                                    .default(Text("Louisiana")){ self.filters.state = "Louisiana"  },
                                    .default(Text("Michigan")){ self.filters.state = "Michigan"  },
                                    .default(Text("Minnesota")){ self.filters.state = "Minnesota"  },
                                    .default(Text("Mississippi")){ self.filters.state = "Mississippi"  },
                                    .default(Text("Missouri")){ self.filters.state = "Missouri"  },
                                    .default(Text("Montana")){ self.filters.state = "Montana"  },
                                    .default(Text("Nebraska")){ self.filters.state = "Nebraska"  },
                                    .default(Text("Nevada")){ self.filters.state = "Nevada"  },
                                    .default(Text("New Mexico")){ self.filters.state = "New Mexico"  },
                                    .default(Text("New York")){ self.filters.state = "New York"  },
                                    .default(Text("North Carolina")){ self.filters.state = "North Carolina"  },
                                    .default(Text("Ohio")){ self.filters.state = "Ohio"  },
                                    .default(Text("Oklahoma")){ self.filters.state = "Oklahoma"  },
                                    .default(Text("Oregon")){ self.filters.state = "Oregon"  },
                                    .default(Text("Pennsylvania")){ self.filters.state = "Pennsylvania"  },
                                    .default(Text("South Carolina")){ self.filters.state = "South Carolina"  },
                                    .default(Text("Tennessee")){ self.filters.state = "Tennessee"  },
                                    .default(Text("Texas")){ self.filters.state = "Texas"  },
                                    .default(Text("Utah")){ self.filters.state = "Utah"  },
                                    .default(Text("Virginia")){ self.filters.state = "Virginia"  },
                                    .default(Text("Washington")){ self.filters.state = "Washington"  },
                                    .default(Text("West Virginia")){ self.filters.state = "West Virginia"  },
                                    .default(Text("Wisconsin")){ self.filters.state = "Wisconsin"  },
                                    .default(Text("Wyoming")){ self.filters.state = "Wyoming"  },
                                    .default(Text("All")) { self.filters.state = ""  },
                                   .cancel()
                               ])
                           }

                       }
                       .padding(8)
                       .background(Color.secondary)
                       .cornerRadius(40)
                   }
                   .padding(.bottom,8)
      


    }
    
}

struct FilterMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        FilterMenuBar()
    }
}
