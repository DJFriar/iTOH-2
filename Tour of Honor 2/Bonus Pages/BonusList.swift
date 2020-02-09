//
//  BonusList.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct BonusList: View {
    var bonuses = sampleBonusData
    @State var showSettings = false
    @State var showBonuses = false
    @State var bonusEarned = true
    @State var showStatePicker = false
    @State var showCategoryPicker = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(bonuses) { item in
                    NavigationLink(destination: BonusDetail(bonusName: item.bonusName, bonusCode: item.bonusCode, city: item.city, sampleImage: item.sampleImage)) {
                        HStack(spacing: 12.0) {
                            Image(item.sampleImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .background(Color.white)
                                .cornerRadius(15)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(item.bonusName)
                                        .font(.headline)
                                    Spacer()
                                    Image(systemName: "checkmark.shield")
                                        .opacity(self.bonusEarned ? 100 : 0)
                                }
                                Text("\(item.city), \(item.state)")
                                    .font(.subheadline)
                                    .frame(height: 25.0)
                                HStack {
                                    Text(item.bonusCategory)
                                        .modifier(RowViewLine3())
                                    Spacer()
                                    Text(item.bonusCode)
                                        .modifier(RowViewLine3())
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Bonuses"))
                .navigationBarItems(trailing: HStack {
                    FilterByCategory(showCategoryPicker: $showCategoryPicker)
                    Spacer()
                    FilterByState(showStatePicker: $showStatePicker)
                })
            }
            .saturation(self.bonusEarned ? 0 : 1)
            // Currently, enabling either line 63 or 64 will break the NavigationLink. This is disabled here, but enabled on the Trophies page.
            //            StatePicker(showStatePicker: $showStatePicker)
            //            CategoryPicker(showCategoryPicker: $showCategoryPicker)
        }
    }
}

struct BonusList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BonusList().environment(\.colorScheme, .dark)
            BonusList().environment(\.colorScheme, .light)
        }
    }
}
