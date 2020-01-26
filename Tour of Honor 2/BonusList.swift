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
    
    var body: some View {
        NavigationView {
            List(bonuses) { item in
                NavigationLink(destination: BonusDetail(bonusName: item.bonusName, bonusCode: item.bonusCode, city: item.city, image: item.image)) {
                    HStack(spacing: 12.0) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .background(Color.white)
                            .cornerRadius(15)
                        
                        VStack(alignment: .leading) {
                            Text(item.bonusCode)
                                .font(.headline)
                            Text(item.bonusName)
//                                .lineLimit(1)
//                                .lineSpacing(4)
                                .font(.subheadline)
                                .frame(height: 25.0)
                            Text("\(item.city), \(item.state)")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.top, 4)
                        }
                    }
                }
//                .padding(.vertical, 8.0)
            }
            .navigationBarTitle(Text("Bonuses"))
            .navigationBarItems(trailing:
                Button(action: { self.showSettings.toggle() }) {
                    Image(systemName: "gear")
                        .sheet(isPresented: self.$showSettings) {
                            Text("Settings")
                    }
                }
            )
        }
    }
}

struct BonusData: Identifiable {
    var id = UUID()
    var image: String
    var bonusName: String
    var bonusCode: String
    var city: String
    var state: String
}

let sampleBonusData = [
    BonusData(image: "2019tx6",
              bonusName: "Something in Texas",
              bonusCode: "TX6",
              city: "Texarkana",
              state: "TX"),
    BonusData(image: "2019ca1",
              bonusName: "Something in California",
              bonusCode: "CA1",
              city: "Lompoc",
              state: "CA"),
    BonusData(image: "2019ma3",
              bonusName: "Something in Massachusetts",
              bonusCode: "MA3",
              city: "Walther",
              state: "MA"),
    BonusData(image: "2019tx5",
              bonusName: "Something else in Texas",
              bonusCode: "TX5",
              city: "Pecos",
              state: "TX"),
    BonusData(image: "2019ca5",
              bonusName: "Something else in California",
              bonusCode: "CA5",
              city: "San Diego",
              state: "CA"),
    BonusData(image: "2019nv4",
              bonusName: "Something in Nevada",
              bonusCode: "NV4",
              city: "Reno",
              state: "NV"),
    BonusData(image: "2019fl7",
              bonusName: "Something in Florida",
              bonusCode: "FL7",
              city: "St. Augustine",
              state: "FL")
]







struct BonusList_Previews: PreviewProvider {
    static var previews: some View {
        BonusList()
    }
}
