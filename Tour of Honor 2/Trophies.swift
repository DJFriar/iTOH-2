//
//  Trophies.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct Trophies: View {
    var bonuses = sampleBonusData
    @State var showSettings = false
    @State var showBonuses = false
    @State var bonusEarned = true
    @State var showStatePicker = false
    @State var showCategoryPicker = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
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
                                        //                                .lineLimit(1)
                                        //                                .lineSpacing(4)
                                        .font(.subheadline)
                                        .frame(height: 25.0)
                                    HStack {
                                        Text(item.bonusCategory)
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.gray)
                                            .padding(.top, 4)
                                        Spacer()
                                        Text(item.bonusCode)
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.gray)
                                            .padding(.top, 4)
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Trophies"))
                .navigationBarItems(trailing: HStack {
                    FilterByCategory(showCategoryPicker: $showCategoryPicker)
                    Spacer()
                    FilterByState(showStatePicker: $showStatePicker)
                })
            }
            .saturation(self.bonusEarned ? 0 : 1)
            // Currently, enabling either line 73 or 74 will break the NavigationLink. This is enabled here, but disabled on the BonusViews.
            StatePicker(showStatePicker: $showStatePicker)
            CategoryPicker(showCategoryPicker: $showCategoryPicker)
        }
    }
}

struct Trophies_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Trophies().darkModeFix()
            Trophies().environment(\.colorScheme, .light)
        }
    }
}


