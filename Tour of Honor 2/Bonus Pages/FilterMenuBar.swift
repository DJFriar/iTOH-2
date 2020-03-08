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
    var body: some View {
        ZStack{
            HStack(alignment: .center, spacing: 60){
                Button(action: { self.showingCategoryFilter = true }) {
                               Text("Categories")
                                   .padding(2)
                                   .padding(.leading,40)
                                   .font(.footnote)
                                   .foregroundColor(.white)
                           }.sheet(isPresented: $showingCategoryFilter) {
                               //FilterA()
                               CategoryFilter()
                               .modifier(SystemServices())
                           }
                Button(action: { self.showingStateFilter = true }) {
                               Text("States")
                                   .padding(2)
                                   .padding(.trailing,40)
                                   .font(.footnote)
                                   .foregroundColor(.white)
                           }.sheet(isPresented: $showingStateFilter) {
                               StateFilter()
                               .modifier(SystemServices())
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
