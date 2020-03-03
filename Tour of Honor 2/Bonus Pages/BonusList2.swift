//
//  Bonuses.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 2/1/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct BonusList2: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Bonus.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Bonus.code, ascending: true),
            NSSortDescriptor(keyPath: \Bonus.name, ascending: false)
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
            List(bonuses, id: \.self) { item in 
                NavigationLink(destination: BonusDetail(
                    bonusName: item.name,
                    bonusCode: item.code,
                    city: item.city,
                    sampleImage: item.sampleImage,
                    captured: item.captured
                )) {
                    HStack(spacing: 12.0) {
                        Image(item.sampleImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .background(Color.white)
                            .cornerRadius(15)
                            .saturation(item.captured ? 1 : 0)

                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.name)
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "checkmark.shield")
                                    .opacity(item.captured ? 100 : 0)
                            }
                            Text("\(item.city), \(item.state)")
                                //                                .lineLimit(1)
                                //                                .lineSpacing(4)
                                .font(.subheadline)
                                .frame(height: 25.0)
                            HStack {
                                Text(item.category)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .padding(.top, 4)
                                Spacer()
                                Text(item.code)
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
            .navigationBarItems(trailing: HStack {
                Button(action: { self.showBonusFilterModal.toggle() }) {
                    // If the filter is active, we should make this image "line.horizontal.3.decrease.circle.fill" instead.
                    Image(systemName: "line.horizontal.3.decrease.circle")
                }.sheet(isPresented: $showBonusFilterModal) {
                    BonusFilterModal(showBonusFilterModal: .constant(true))
                }
            })
        }
    }
}

struct Bonuses_Previews: PreviewProvider {
    static var previews: some View {
        BonusList2()
    }
}
