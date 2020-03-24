//
//  Trophies.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct Trophies: View {
    @EnvironmentObject var filters: UserFilters
    @State private var showingCategoryFilter = false
    @State private var showingStateFilter = false
    
    var body: some View {
        VStack {
            VStack {
                NavigationView {
                    List(regionValues) { regionValues in
                        NavigationLink(destination: FilteredTrophyList(regionFilter: regionValues.regionName)) {
                             Text(regionValues.regionName)
                        }
                    }
                    .navigationBarTitle("Trophies")
                }
            }
            Spacer()
            VStack {
                TrophyStatusBar()
                    .padding(.bottom,10)
                    .background(BlurView(style: .systemThinMaterial).opacity(0.8))
                //                TrophyFilterMenuBar()
                //                    .background(BlurView(style: .systemThinMaterial).opacity(0.8))
            }
            
        }
        
    }
    
}


struct RegionList : Identifiable {
    var id = UUID()
    var regionName : String
}

let regionValues: [RegionList] = [
    RegionList(regionName: "Alabama"),
    RegionList(regionName: "Alaska"),
    RegionList(regionName: "Arizona"),
    RegionList(regionName: "Arkansas"),
    RegionList(regionName: "California"),
    RegionList(regionName: "Colorado"),
    RegionList(regionName: "Dakotas"),
    RegionList(regionName: "Florida"),
    RegionList(regionName: "Georgia"),
    RegionList(regionName: "Hawaii"),
    RegionList(regionName: "Idaho"),
    RegionList(regionName: "Illinois"),
    RegionList(regionName: "Indiana"),
    RegionList(regionName: "Iowa"),
    RegionList(regionName: "Kansas"),
    RegionList(regionName: "Kentucky"),
    RegionList(regionName: "Louisiana"),
    RegionList(regionName: "Michigan"),
    RegionList(regionName: "Mid-Atlantic"),
    RegionList(regionName: "Minnesota"),
    RegionList(regionName: "Mississippi"),
    RegionList(regionName: "Missouri"),
    RegionList(regionName: "Montana"),
    RegionList(regionName: "Nebraska"),
    RegionList(regionName: "Nevada"),
    RegionList(regionName: "New England"),
    RegionList(regionName: "New Mexico"),
    RegionList(regionName: "New York"),
    RegionList(regionName: "North Carolina"),
    RegionList(regionName: "Ohio"),
    RegionList(regionName: "Oklahoma"),
    RegionList(regionName: "Oregon"),
    RegionList(regionName: "Pennsylvania"),
    RegionList(regionName: "South Carolina"),
    RegionList(regionName: "Tennessee"),
    RegionList(regionName: "Texas"),
    RegionList(regionName: "Utah"),
    RegionList(regionName: "Virginia"),
    RegionList(regionName: "Washington"),
    RegionList(regionName: "West Virginia"),
    RegionList(regionName: "Wisconsin"),
    RegionList(regionName: "Wyoming")
    
]

struct Trophies_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Trophies().darkModeFix()
            Trophies().environment(\.colorScheme, .light)
        }
    }
}


