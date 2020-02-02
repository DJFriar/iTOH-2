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
        
        var body: some View {
            NavigationView {
                List(bonuses, id: \.self) { bonus in
                    Text(bonus.name ?? "Unknown")
                }
            }
    }
}

struct BBonusList2_Previews: PreviewProvider {
    static var previews: some View {
        BonusList2()
    }
}
