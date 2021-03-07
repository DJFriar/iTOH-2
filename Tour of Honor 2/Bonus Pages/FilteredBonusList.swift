//
//  FilteredList.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 3/7/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
import CoreData
import SwiftUI

struct FilteredBonusList: View {
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
                        Image(uiImage: self.showBonusImage(sampleImage: item.sampleImage) ?? self.sampleImageMissing! )
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
            .navigationBarTitle(Text("Bonuses"))
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
    
    func showBonusImage(sampleImage: String) -> UIImage?{
        var documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        documentsPath.append("/\(sampleImage)")
        let url = URL(fileURLWithPath: documentsPath)
        do {
            let imageData = try Data.init(contentsOf: url)
            return UIImage(data: imageData)
        } catch {
            print(error.localizedDescription)
            if (ImageReader.getImageFromDocDir(named: sampleImage) != nil) {
                print("image already found on device")
            } else {
//                print("\(sampleImage) not on device, search server...." )
                if let imgURL = URL(string: "https://www.tourofhonor.com/2021appimages/\(sampleImage)") {
                    // create your document folder url
                    let documentsUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    // your destination file url
                    let destination = documentsUrl.appendingPathComponent(imgURL.lastPathComponent)
                    // check if it exists before downloading it
                    if FileManager().fileExists(atPath: destination.path) {
                    } else {
                        //  if the file doesn't exist
                        //  just download the data from your url
                        URLSession.shared.downloadTask(with: imgURL, completionHandler: { (location, response, error) in
                            // after downloading your data you need to save it to your destination url
                            guard
                                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                                let location = location, error == nil
                                else { return }
                            do {
                                try FileManager.default.moveItem(at: location, to: destination)
                                print("downloading....")
                            } catch {
                                print(error)
                            }
                        }).resume()
                    }
                }
            }
//            return nil
            do {
                let imageData = try Data.init(contentsOf: url)
                return UIImage(data: imageData)
            } catch {
                return nil
            }
        }
    }
    
    
    init(categoryFilter: String, stateFilter: String) {
        if (categoryFilter.count > 0 && stateFilter.count > 0){
            let predicate = NSPredicate(format: "category == %@ AND state == %@", categoryFilter, stateFilter)
            fetchRequest = FetchRequest<Bonus>(entity: Bonus.entity(), sortDescriptors: [NSSortDescriptor(key: "code", ascending: true)], predicate: predicate)
            
        } else if (categoryFilter.count > 0 && stateFilter.count <= 0){
            let predicate = NSPredicate(format: "category == %@", categoryFilter)
            fetchRequest = FetchRequest<Bonus>(entity: Bonus.entity(), sortDescriptors: [NSSortDescriptor(key: "code", ascending: true)], predicate: predicate)
        } else if (categoryFilter.count <= 0 && stateFilter.count > 0){
            let predicate = NSPredicate(format: "state == %@", stateFilter)
            fetchRequest = FetchRequest<Bonus>(entity: Bonus.entity(), sortDescriptors: [NSSortDescriptor(key: "code", ascending: true)], predicate: predicate)
        } else {
            fetchRequest = FetchRequest<Bonus>(entity: Bonus.entity(), sortDescriptors: [NSSortDescriptor(key: "code", ascending: true)])
            
        }
        
    }
}
