//
//  Bonuses.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 2/1/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct BonusList: View {

    @EnvironmentObject var filters: UserFilters
    @State private var showingCategoryFilter = false
    @State private var showingStateFilter = false

    var body: some View {
        ZStack {
            VStack {
                FilteredList(categoryFilter: self.filters.category, stateFilter: self.filters.state)
            }
            VStack {
                Spacer()
                FilterMenuBar()
                    .background(Color.clear)
            }
        
        }

    
        
    }
     
}

struct Bonuses_Previews: PreviewProvider {
    static var previews: some View {
        BonusList()
    }
}
