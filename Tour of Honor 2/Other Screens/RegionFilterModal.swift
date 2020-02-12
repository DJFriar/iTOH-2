//
//  RegionFilterModal.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/12/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct RegionFilterModal: View {
    var stateOptions = stateValues
    var regionOptions = regionValues
    @Binding var showRegionFilterModal : Bool
    
    var body: some View {
        VStack {
            Text("Choose Your Filters")
                .font(.title)
                .padding(.vertical,16)
            HStack {
                VStack {
                    Text("By Region")
                        .font(.headline)
                        .padding(.bottom,8)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            ForEach(regionOptions) { item in
                                RegionMenu(text: item.regionName)
                            }
                            Spacer()
                        }
                        .onTapGesture {
                            self.showRegionFilterModal.toggle()
                        }
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
                VStack {
                    Text("By State")
                        .font(.headline)
                        .padding(.bottom,8)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            ForEach(stateOptions) { item in
                                StateMenu(text: item.stateName)
                            }
                            Spacer()
                        }
                        .onTapGesture {
                            self.showRegionFilterModal.toggle()
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            .padding(.horizontal,32)
        }
    }
}

struct RegionFilterModal_Previews: PreviewProvider {
    static var previews: some View {
        RegionFilterModal(showRegionFilterModal: .constant(true))
    }
}
