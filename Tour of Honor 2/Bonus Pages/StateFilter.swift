//
//  CategoryFilter.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 3/7/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct StateFilter: View {
     var states = ["All", "Arizona", "Alaska" ]
    @EnvironmentObject var filters: UserFilters

    @State var stateFilterIndex = 0

      var body: some View {
            NavigationView{
                VStack{
                    Text(self.filters.state)
                    Form{
                        Section{
                            Picker(selection: $stateFilterIndex.onChange(stateFilterChange), label: Text("Please choose a letter")) {
                               ForEach(0 ..< states.count) {
                                    Text(self.states[$0]).tag($0)
                               }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                        }


                    }
                    Text("Current selection: \(stateFilterIndex)").font(.caption)
                }
                .navigationBarTitle(Text("State:"))
            }
         }
      func stateFilterChange(_ tag: Int) {
          print("New value: \(states[tag])")
        self.filters.state = states[tag]
        print("Env object is: \(self.filters.state)")

      }
    
}


struct StateFilter_Previews: PreviewProvider {
    static var previews: some View {
        StateFilter()
    }
}
