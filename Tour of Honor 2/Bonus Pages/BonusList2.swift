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
            NSSortDescriptor(keyPath: \Bonus.name, ascending: true),
            NSSortDescriptor(keyPath: \Bonus.id, ascending: false)
        ]
    ) var bonuses: FetchedResults<Bonus>
    
    @State var showSettings = false
    @State var showBonuses = false
    @State var bonusEarned = true

    var body: some View {
        //NavigationView {
        //   List(bonuses, id: \.self) { bonus in
        //        Text(bonus.name ?? "Unknown")
        //    }
       // }
        NavigationView {
                    List(bonuses) { item in
                        NavigationLink(destination: BonusDetail(
                            bonusName: item.name,
                            bonusCode: item.code,
                            city: item.city,
                            sampleImage: item.sampleImage
                        )) {
                            HStack(spacing: 12.0) {
                                Image(item.sampleImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .background(Color.white)
                                    .cornerRadius(15)
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(item.name)
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
                .saturation(self.bonusEarned ? 0 : 1)
            }
    
}

struct Bonuses_Previews: PreviewProvider {
    static var previews: some View {
        BonusList2()
    }
}