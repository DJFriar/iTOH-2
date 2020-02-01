//
//  ContentView.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
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
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


