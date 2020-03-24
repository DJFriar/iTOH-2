//
//  FilteredTrophyList.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/18/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import CoreData
import SwiftUI

struct FilteredTrophyList: View {
    var fetchRequest: FetchRequest<Bonus>
    var bonuses: FetchedResults<Bonus> { fetchRequest.wrappedValue }
    var testimage: UIImage?
    var sampleImageMissing = ImageReader.getImageFromDocDir(named: "sample_image_missing.png")
    @EnvironmentObject var filters: UserFilters
    @EnvironmentObject var activeBonus: ActiveBonus
    
    @State var showingBonusDetail = false
    
    var body: some View {
        NavigationView{
            List(bonuses, id: \.self) { item in
                Button(action: { self.setupBonusData(bonus:item) }) {
                    HStack(spacing: 12.0) {
                        Image(uiImage: self.showBonusImage(code: item.code.lowercased()) ?? self.sampleImageMissing! )
                            .renderingMode(.original)
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
                    BonusDetail()
                        .modifier(SystemServices())
                }
            }
                
            .navigationBarTitle(Text("Trophies"), displayMode: .inline)
            .navigationBarHidden(true)
//            .navigationBarItems(trailing: HStack {
//                Button(action: { self.filters.category = "*"; self.filters.region = "*"; }) {
//                    Text("Clear filters")
//                }
//            })
        }
    }
    
    func setupBonusData(bonus: AnyObject){
        self.showingBonusDetail = true
        self.activeBonus.name = bonus.name
        self.activeBonus.category = bonus.category
        self.activeBonus.code = bonus.code
        self.activeBonus.state = bonus.state
        self.activeBonus.city = bonus.city
        self.activeBonus.region = bonus.region
        self.activeBonus.captured = bonus.captured
        self.activeBonus.submitted = bonus.submitted
        self.activeBonus.sampleImage = bonus.sampleImage
        self.activeBonus.gps = bonus.gps
        self.activeBonus.primaryImage = bonus.primaryImage
        self.activeBonus.alternateImage = bonus.alternateImage
        
    }
    
    func showBonusImage(code: String) -> UIImage?{
        var documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        documentsPath.append("/2020\(code).jpg")
        let url = URL(fileURLWithPath: documentsPath)
        do {
            let imageData = try Data.init(contentsOf: url)
            return UIImage(data: imageData)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    init(regionFilter: String) {
        
        let regionPredicate = NSPredicate(format: "region BEGINSWITH %@", regionFilter)
        //        let categoryPredicate = NSPredicate(format: "category LIKE %@", categoryFilter)
        //        let statePredicate = NSPredicate(format: "state LIKE %@", stateFilter)
        let filterPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [regionPredicate])
        fetchRequest = FetchRequest<Bonus>(entity: Bonus.entity(), sortDescriptors: [], predicate: filterPredicate)
        
        //        var documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //        documentsPath.append("/copy.jpg")
        //        let url = URL(fileURLWithPath: documentsPath)
        //        print("-------------")
        //        print(url)
        //        print("-------------")
        //        do {
        //            let imageData = try Data.init(contentsOf: url)
        //            testimage = UIImage(data: imageData)
        //        } catch {
        //            print(error.localizedDescription)
        //        }
    }
    
    
}
