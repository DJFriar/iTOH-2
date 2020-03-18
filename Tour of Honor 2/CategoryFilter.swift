//
//  CategoryFilter.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 3/7/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct CategoryFilter: View {
     var categories = ["All", "Hueys", "Tour of Honor" ]
    @EnvironmentObject var filters: UserFilters

    @State var categoryFilterIndex = 0

      var body: some View {
            NavigationView{
                VStack{
                    Text(self.filters.category)
                    Form{
                        Section{
                            Picker(selection: $categoryFilterIndex.onChange(categoryFilterChange), label: Text("Please choose a letter")) {
                               ForEach(0 ..< categories.count) {
                                    Text(self.categories[$0]).tag($0)
                               }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                        }


                    }
                    Text("Current selection: \(categoryFilterIndex)").font(.caption)
                }
                .navigationBarTitle(Text("Category:"))
            }
         }
      func categoryFilterChange(_ tag: Int) {
          print("New value: \(categories[tag])")
        self.filters.category = categories[tag]
        print("Env object is: \(self.filters.category)")

      }
    
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}

struct CategoryFilter_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFilter()
    }
}
