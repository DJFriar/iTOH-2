//
//  Bonus+CoreDataClass.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 1/26/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftUI


@objc(Bonus)
public class Bonus: NSManagedObject, Identifiable {
    
    class func count() -> Int {
        let fetchCountRequest: NSFetchRequest<Bonus> = Bonus.fetchRequest()
        do {
            let count = try CoreData.stack.backgroundContext.count(for: fetchCountRequest)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countSubmitted() -> Int {
        let countSubmittedFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countSubmittedFetch.predicate = NSPredicate(format: "submitted == %@", NSNumber(value: true))
        do {
            let count = try CoreData.stack.backgroundContext.count(for: countSubmittedFetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countCaptured() -> Int {
        let countCapturedFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countCapturedFetch.predicate = NSPredicate(format: "captured == %@", NSNumber(value: true))
        do {
            let count = try CoreData.stack.backgroundContext.count(for: countCapturedFetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countSubmittedTOH() -> Int {
        let countSubmittedTOHFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countSubmittedTOHFetch.predicate = NSPredicate(format: "submitted == %@ AND category == 'Tour of Honor'", NSNumber(value: true))
        do {
            let count = try CoreData.stack.backgroundContext.count(for: countSubmittedTOHFetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countSubmittedDB() -> Int {
        let countSubmittedDBFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countSubmittedDBFetch.predicate = NSPredicate(format: "submitted == %@ AND category == 'Doughboys'", NSNumber(value: true))
        do {
            let count = try CoreData.stack.backgroundContext.count(for: countSubmittedDBFetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countSubmittedK9() -> Int {
        let countSubmittedK9Fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countSubmittedK9Fetch.predicate = NSPredicate(format: "submitted == %@ AND category == 'War Dogs'", NSNumber(value: true))
        do {
            let count = try CoreData.stack.backgroundContext.count(for: countSubmittedK9Fetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countSubmittedNPT() -> Int {
        let countSubmittedNPTFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countSubmittedNPTFetch.predicate = NSPredicate(format: "submitted == %@ AND category == 'National Parks'", NSNumber(value: true))
        do {
            let count = try CoreData.stack.backgroundContext.count(for: countSubmittedNPTFetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countSubmittedHuey() -> Int {
        let countSubmittedHueyFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countSubmittedHueyFetch.predicate = NSPredicate(format: "submitted == %@ AND category == 'Hueys'", NSNumber(value: true))
        do {
            let count = try CoreData.stack.backgroundContext.count(for: countSubmittedHueyFetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countSubmitted911() -> Int {
        let countSubmitted911etch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countSubmitted911etch.predicate = NSPredicate(format: "submitted == %@ AND category == '911'", NSNumber(value: true))
        do {
            let count = try CoreData.stack.backgroundContext.count(for: countSubmitted911etch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countSubmittedGSF() -> Int {
        let countSubmittedGSFFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countSubmittedGSFFetch.predicate = NSPredicate(format: "submitted == %@ AND category == 'Gold Star Family'", NSNumber(value: true))
        do {
            let count = try CoreData.stack.backgroundContext.count(for: countSubmittedGSFFetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    //MARK: CRUD
    
    class func newBonus() -> Bonus {
        
        return Bonus(context: CoreData.stack.backgroundContext)
    }
    class func createBonus(name: String, code: String, city: String, state: String, category: String, region: String, gps: String, sampleImage: String, order: Int?) -> Bonus {
        //let moc = CoreData.stack.backgroundContext
        
        let bonus = Bonus.newBonus()
        bonus.name = name
        bonus.code = code
        bonus.category = category
        bonus.city = city
        bonus.state = state
        bonus.region = region
        bonus.gps = gps
        bonus.sampleImage = sampleImage
        bonus.primaryImage = "no_image_taken.png"
        bonus.alternateImage = "optional_2nd_Image.png"
        bonus.order = Int32(order ?? 0)
        bonus.captured = false
        bonus.submitted = false
        
        do {
            try CoreData.stack.save()
        } catch let error as NSError {
            //fatalError("Unresolved error \(error), \(error.userInfo)")
            print("bonus did not save")
        }
        return bonus
    }
    
    @discardableResult class func updateBonusKey(code: String, key: String, newVal: Any) -> Bool {
        let moc = CoreData.stack.backgroundContext
        let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        bonusesFetch.predicate = NSPredicate(format: "code = %@", code)
        do {
            let fetchedBonuses = try moc.fetch(bonusesFetch) as! [Bonus]
            if let bonusRecord = fetchedBonuses.first {
                bonusRecord.setValue(newVal, forKey: key)
               try moc.save()
            }
        } catch {
            fatalError("Failed to fetch bonuses: \(error)")
        }
        return true
    }
    
    @discardableResult class func updateCapturedFlag(state: Bool, code: String) -> Bool {
        let moc = CoreData.stack.backgroundContext
        let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        bonusesFetch.predicate = NSPredicate(format: "code = %@", code)
        
        do {
            let fetchedBonuses = try moc.fetch(bonusesFetch) as! [Bonus]
            if let bonusRecord = fetchedBonuses.first {
                if (state){
                    bonusRecord.setValue(true, forKey: "captured")
                } else {
                    bonusRecord.setValue(false, forKey: "captured")
                }
                CoreData.stack.save()
            }
        } catch {
            fatalError("Failed to fetch bonuses: \(error)")
        }
        return true
    }
    
    @discardableResult class func nukeData() -> Bool {
        let moc = CoreData.stack.backgroundContext
        let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        do {
            let fetchedBonuses = try moc.fetch(bonusesFetch) as! [Bonus]
            for object in fetchedBonuses {
                moc.delete(object)
            }
            try moc.save()
        } catch {
            fatalError("Failed to fetch bonuses: \(error)")
        }
        return true
    }
    
    @discardableResult class func updateData() -> Bool {
        let url = URL(string: "https://apps.perrycraft.net/wp-json/toh/v1/bonus-data")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let json = dataResponse
                struct BonusEntry: Codable {
                    var sampleImage: String
                    var bonusName: String
                    var bonusCode: String
                    var bonusCategory: String
                    var region: String
                    var city: String
                    var state: String
                    var GPS: String
                }
                
                let decoder = JSONDecoder()
                let bonuses = try decoder.decode([BonusEntry].self, from: json)
                

                
                for (i,bonus) in bonuses.enumerated() {
                    let moc = CoreData.stack.backgroundContext
                    let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
                    bonusesFetch.predicate = NSPredicate(format: "code = %@", bonus.bonusCode)
                    let codeResult = try moc.fetch(bonusesFetch)
                    print("===================================")
                    print(codeResult.count)
                    if codeResult.count == 0 {
                        print("inserting \(bonus.bonusCode)")
                        let _ = Bonus.createBonus(
                            name: bonus.bonusName,
                            code: bonus.bonusCode,
                            city: bonus.city,
                            state: bonus.state,
                            category: bonus.bonusCategory,
                            region: bonus.region,
                            gps: bonus.GPS,
                            sampleImage: bonus.sampleImage,
                            order: i
                        )
                    } else {
                        print("updating \(bonus.bonusCode)")
                        Bonus.updateBonusKey(code: bonus.bonusCode, key: "sampleImage", newVal: bonus.sampleImage )
                        Bonus.updateBonusKey(code: bonus.bonusCode, key: "name", newVal: bonus.bonusName )
                        Bonus.updateBonusKey(code: bonus.bonusCode, key: "category", newVal: bonus.bonusCategory )
                        Bonus.updateBonusKey(code: bonus.bonusCode, key: "region", newVal: bonus.region )
                        Bonus.updateBonusKey(code: bonus.bonusCode, key: "city", newVal: bonus.city )
                        Bonus.updateBonusKey(code: bonus.bonusCode, key: "state", newVal: bonus.state )
                        Bonus.updateBonusKey(code: bonus.bonusCode, key: "gps", newVal: bonus.GPS )
                    }
                    
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
            
        }
        task.resume()
        
        
        return true
    }
    
    @discardableResult class func forceLoadData() -> Bool {
        let moc = CoreData.stack.backgroundContext
        
        let url = URL(string: "https://apps.perrycraft.net/wp-json/toh/v1/bonus-data")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                let json = dataResponse
                
                struct BonusEntry: Codable {
                    var sampleImage: String
                    var bonusName: String
                    var bonusCode: String
                    var bonusCategory: String
                    var region: String
                    var city: String
                    var state: String
                    var GPS: String
                }
                
                let decoder = JSONDecoder()
                let bonuses = try decoder.decode([BonusEntry].self, from: json)
                
                moc.performAndWait {
                    for (i,bonus) in bonuses.enumerated() {
                        print("\t\(bonus.bonusName) (\(bonus.bonusCode))")
                        
                        let _ = Bonus.createBonus(
                            name: bonus.bonusName,
                            code: bonus.bonusCode,
                            city: bonus.city,
                            state: bonus.state,
                            category: bonus.bonusCategory,
                            region: bonus.region,
                            gps: bonus.GPS,
                            sampleImage: bonus.sampleImage,
                            order: i
                        )
                    }
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Failure to save context: \(error)")
                    }
                }
                
            } catch let parsingError {
                print("error while loading data")
                print("Error", parsingError)
            }
        }
        task.resume()
        return true
    }
    
    @discardableResult class func getBonusImagesFromServer() -> Bool{
        let moc = CoreData.stack.backgroundContext
        let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        do {
            let fetchedBonuses = try moc.fetch(bonusesFetch) as! [Bonus]
            for object in fetchedBonuses {
                if (ImageReader.getImageFromDocDir(named: object.sampleImage) != nil) {
                    //print("\(object.code) image already found on device")
                } else {
                    //print("\(object.sampleImage) not on device, search server...." )
                    if let imgURL = URL(string: "https://www.tourofhonor.com/2021appimages/\(object.sampleImage)") {
                        // create your document folder url
                        let documentsUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
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
                                    else { return print("Image \(object.code) not found on server") }
                                do {
                                    try FileManager.default.moveItem(at: location, to: destination)
                                    //print("downloading....")
                                } catch {
                                    print(error)
                                }
                            }).resume()
                        }
                    }
                }
            }
        } catch {
            fatalError("Failed to fetch bonuses: \(error)")
        }
        return true
    }
    class func getBonusesKey(key:String) -> [String] {
        let moc = CoreData.stack.backgroundContext
        let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        bonusesFetch.propertiesToFetch = ["\(key)"]
        do {
            let fetchedBonuses = try moc.fetch(bonusesFetch) as! [Bonus]
            var elements = ["Tour of Honor"]
            for bonus in fetchedBonuses {
                if elements.contains("\(bonus.category)") {
                } else {
                    elements.append("\(bonus.category)")
                }
            }
            return elements
        } catch {
            fatalError("Failed to fetch bonuses: \(error)")
        }
    }
}
