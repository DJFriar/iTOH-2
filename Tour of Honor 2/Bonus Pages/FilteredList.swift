//
//  FilteredList.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 3/7/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
import CoreData
import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Bonus>
    var bonuses: FetchedResults<Bonus> { fetchRequest.wrappedValue }
    var sampleImageMissing = ImageReader.getImageFromDocDir(named: "sample_image_missing.png")
    @EnvironmentObject var filters: UserFilters
    @EnvironmentObject var activeBonus: ActiveBonus

    @State var showingBonusDetail = false
 
    var body: some View {
        NavigationView{
            List(bonuses, id: \.self) { item in
                Button(action: { self.setupBonusData(bonus:item) }) {
                HStack(spacing: 12.0) {
                    Image(uiImage: self.sampleImageMissing!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .cornerRadius(15)
                        .saturation(item.submitted ? 1 : 0)

                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.name)
                                .font(.headline)
                            Spacer()
                            Image(systemName: item.submitted ? "checkmark.shield.fill" : "checkmark.shield")
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
                }.sheet(isPresented: self.$showingBonusDetail) {
                    //FilterA()
                    BonusDetail()
                    .modifier(SystemServices())
                }
                }
                
            .navigationBarTitle(Text("Bonuses"))
            .navigationBarItems(trailing: HStack {
                Button(action: { self.filters.category = ""; self.filters.state = ""; }) {
                    Text("Clear filters")
                }
            })
            
        }
    

    }
    func setupBonusData(bonus: AnyObject){
        self.showingBonusDetail = true
        self.activeBonus.name = bonus.name
        self.activeBonus.category = bonus.category
        self.activeBonus.code = bonus.code
        self.activeBonus.state = bonus.state
        self.activeBonus.city = bonus.city
        self.activeBonus.captured = bonus.captured
        self.activeBonus.submitted = bonus.submitted
        self.activeBonus.sampleImage = bonus.sampleImage
        self.activeBonus.gps = bonus.gps
        self.activeBonus.primaryImage = bonus.primaryImage
        self.activeBonus.alternateImage = bonus.alternateImage

    }
    init(categoryFilter: String, stateFilter: String) {
        
        print("category filter: \(categoryFilter)")
        print("state filter: \(stateFilter)")
        
        if (categoryFilter.count > 0 && stateFilter.count > 0){
            var predicate = NSPredicate(format: "category BEGINSWITH %@ AND state BEGINSWITH %@", categoryFilter, stateFilter)
            fetchRequest = FetchRequest<Bonus>(entity: Bonus.entity(), sortDescriptors: [], predicate: predicate)

        } else if (categoryFilter.count > 0 && stateFilter.count <= 0){
            var predicate = NSPredicate(format: "category BEGINSWITH %@", categoryFilter)
            fetchRequest = FetchRequest<Bonus>(entity: Bonus.entity(), sortDescriptors: [], predicate: predicate)
        } else if (categoryFilter.count <= 0 && stateFilter.count > 0){
            var predicate = NSPredicate(format: "state BEGINSWITH %@", stateFilter)
            fetchRequest = FetchRequest<Bonus>(entity: Bonus.entity(), sortDescriptors: [], predicate: predicate)
        } else {
            fetchRequest = FetchRequest<Bonus>(entity: Bonus.entity(), sortDescriptors: [])

        }
    

        

          //var predicate = NSCompoundPredicate(type:.and, subpredicates:[
            //    NSPredicate(format: "lastName BEGINSWITH %@", lastNameFilter),
            //    NSPredicate(format: "firstName BEGINSWITH %@", firstNameFilter)])
        //            var predicate = NSPredicate(format: "lastName BEGINSWITH %@", lastNameFilter)
        
        print(fetchRequest)
    }
}
