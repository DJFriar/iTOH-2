//
//  FilterModal.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/11/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct BonusFilterModal: View {
    var categoryOptions = categoryValues
    var stateOptions = stateValues
    @Binding var showBonusFilterModal : Bool
    
    var body: some View {
        VStack {
            Text("Choose Your Filters")
                .font(.title)
                .padding(.vertical,16)
            HStack {
                VStack {
                    Text("By Category")
                        .font(.headline)
                        .padding(.bottom,8)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            ForEach(categoryOptions) { item in
                                CategoryMenu(text: item.categoryName)
                            }
                            Spacer()
                        }
                        .onTapGesture {
                            self.showBonusFilterModal.toggle()
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
                            self.showBonusFilterModal.toggle()
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

struct FilterModal_Previews: PreviewProvider {
    static var previews: some View {
        BonusFilterModal(showBonusFilterModal: .constant(true))
    }
}
