//
//  NationalParks.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/12/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct NationalParks: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Bonus.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Bonus.name, ascending: true),
            NSSortDescriptor(keyPath: \Bonus.id, ascending: false)
        ]
    ) var bonuses: FetchedResults<Bonus>
    
    @State var showSettings = false
    @State var showBonuses = false
    @State var bonusEarned = true
    @State var showStatePicker = false
    @State var showCategoryPicker = false
    @State var showBonusFilterModal = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("This feature is coming soon, likely in early to mid June. In the meantime, please use the Bonuses tab below to capture your National Park visits. Remember not to submit them until you have completed your entire tour.")
                    .padding(.top,40)
                Spacer()
            }
                
                //                List(bonuses, id: \.self) { item in
                //                    NavigationLink(destination: BonusDetail(
                //                        bonusName: item.name,
                //                        bonusCode: item.code,
                //                        city: item.city,
                //                        sampleImage: item.sampleImage
                //                    )) {
                //                        HStack(spacing: 12.0) {
                //                            Image(item.sampleImage)
                //                                .resizable()
                //                                .aspectRatio(contentMode: .fill)
                //                                .frame(width: 60, height: 60)
                //                                .background(Color.white)
                //                                .cornerRadius(15)
                //
                //                            VStack(alignment: .leading) {
                //                                HStack {
                //                                    Text(item.name)
                //                                        .font(.headline)
                //                                    Spacer()
                //                                    Image(systemName: "checkmark.shield")
                //                                        .opacity(self.bonusEarned ? 100 : 0)
                //                                }
                //                                Text("\(item.city), \(item.state)")
                //                                    //                                .lineLimit(1)
                //                                    //                                .lineSpacing(4)
                //                                    .font(.subheadline)
                //                                    .frame(height: 25.0)
                //                                HStack {
                //                                    Text(item.category)
                //                                        .font(.caption)
                //                                        .fontWeight(.bold)
                //                                        .foregroundColor(.gray)
                //                                        .padding(.top, 4)
                //                                    Spacer()
                //                                    Text(item.code)
                //                                        .font(.caption)
                //                                        .fontWeight(.bold)
                //                                        .foregroundColor(.gray)
                //                                        .padding(.top, 4)
                //                                }
                //                            }
                //                        }
                //                    }
                //                }
                .navigationBarTitle(Text("National Parks"))
        }
        .saturation(self.bonusEarned ? 0 : 1)
    }
}

struct NationalParks_Previews: PreviewProvider {
    static var previews: some View {
        NationalParks()
    }
}
