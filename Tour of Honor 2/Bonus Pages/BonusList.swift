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
    
    var body: some View {
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
            .navigationBarTitle(Text("Bonuses"))
            //            .navigationBarHidden(true)
        }
        .saturation(self.bonusEarned ? 0 : 1)
    }
}

struct BonusData: Identifiable {
    var id = UUID()
    var sampleImage: String
    var bonusName: String
    var bonusCode: String
    var bonusCategory: String
    var city: String
    var state: String
}

let sampleBonusData = [
    BonusData(sampleImage: "2019tx6",
              bonusName: "Something in Texas",
              bonusCode: "TX6",
              bonusCategory: "Tour of Honor",
              city: "Texarkana",
              state: "TX"),
    BonusData(sampleImage: "2019ca1",
              bonusName: "Something in California",
              bonusCode: "CA1",
              bonusCategory: "Tour of Honor",
              city: "Lompoc",
              state: "CA"),
    BonusData(sampleImage: "2019ma3",
              bonusName: "Something in Massachusetts",
              bonusCode: "MA3",
              bonusCategory: "K9",
              city: "Walther",
              state: "MA"),
    BonusData(sampleImage: "2019tx5",
              bonusName: "Something else in Texas",
              bonusCode: "TX5",
              bonusCategory: "Tour of Honor",
              city: "Pecos",
              state: "TX"),
    BonusData(sampleImage: "2019ca5",
              bonusName: "Something else in California",
              bonusCode: "CA5",
              bonusCategory: "Huey",
              city: "San Diego",
              state: "CA"),
    BonusData(sampleImage: "2019nv4",
              bonusName: "Something in Nevada",
              bonusCode: "NV4",
              bonusCategory: "Tour of Honor",
              city: "Reno",
              state: "NV"),
    BonusData(sampleImage: "2019fl7",
              bonusName: "Something in Florida",
              bonusCode: "FL7",
              bonusCategory: "Gold Medal Family",
              city: "St. Augustine",
              state: "FL")
]



struct BonusList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BonusList().environment(\.colorScheme, .dark)
            BonusList().environment(\.colorScheme, .light)
        }
    }
}
