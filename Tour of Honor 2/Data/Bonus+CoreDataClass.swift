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


@objc(Bonus)
public class Bonus: NSManagedObject, Identifiable {
    
    class func count() -> Int {
        let fetchCountRequest: NSFetchRequest<Bonus> = Bonus.fetchRequest()
        do {
            let count = try CoreData.stack.context.count(for: fetchCountRequest)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countSubmitted() -> Int {
        let countSubmittedFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countSubmittedFetch.predicate = NSPredicate(format: "submitted == %@", NSNumber(value: true))
        do {
            let count = try CoreData.stack.context.count(for: countSubmittedFetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    class func countCaptured() -> Int {
        let countCapturedFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        countCapturedFetch.predicate = NSPredicate(format: "captured == %@", NSNumber(value: true))
        do {
            let count = try CoreData.stack.context.count(for: countCapturedFetch)
            return count
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    //MARK: CRUD
    
    class func newBonus() -> Bonus {
        
        return Bonus(context: CoreData.stack.context)
    }
    class func createBonus(name: String, code: String, city: String, state: String, category: String, region: String, gps: String, sampleImage: String, order: Int?) -> Bonus {
        
        let bonus = Bonus.newBonus()
        bonus.name = name
        bonus.code = code
        bonus.category = category
        bonus.city = city
        bonus.state = state
        bonus.region = region
        bonus.gps = gps
        bonus.sampleImage = "2020\(code).jpg".lowercased()
        bonus.primaryImage = "no_image_taken.png"
        bonus.alternateImage = "optional_2nd_Image.png"
        bonus.order = Int32(order ?? 0)
        bonus.captured = false
        bonus.submitted = false
        CoreData.stack.save()
        
        return bonus
    }
    
    class func updateBonus(code: String) -> Bool {
        print("test \(code)")
        return true
    }
    @discardableResult class func updateBonusKey(code: String, key: String, newVal: Any) -> Bool {
        let moc = CoreData.stack.context
        let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        bonusesFetch.predicate = NSPredicate(format: "code = %@", code)
        
        do {
            let fetchedBonuses = try moc.fetch(bonusesFetch) as! [Bonus]
            print(fetchedBonuses)
            if let bonusRecord = fetchedBonuses.first {
                print(bonusRecord.name)
                
                print("Updated: key \(key) to value \(newVal)")
                bonusRecord.setValue(newVal, forKey: key)
                
                CoreData.stack.save()
            }
            
            
        } catch {
            fatalError("Failed to fetch bonuses: \(error)")
        }
        
        
        return true
    }
    @discardableResult class func updateCapturedFlag(state: Bool, code: String) -> Bool {
        
        let moc = CoreData.stack.context
        let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        bonusesFetch.predicate = NSPredicate(format: "code = %@", code)
        
        do {
            let fetchedBonuses = try moc.fetch(bonusesFetch) as! [Bonus]
            print(fetchedBonuses)
            if let bonusRecord = fetchedBonuses.first {
                print(bonusRecord.name)
                if (state){
                    print("Submitted: \(code)")
                    bonusRecord.setValue(true, forKey: "captured")
                } else {
                    print("Reset: \(code)")
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
        
        let moc = CoreData.stack.context
        let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        //bonusesFetch.predicate = NSPredicate(format: "code = %@", code)
        do {
            let fetchedBonuses = try moc.fetch(bonusesFetch) as! [Bonus]
            print(fetchedBonuses)
            for object in fetchedBonuses {
                moc.delete(object)
            }
            try moc.save()
            
            
        } catch {
            fatalError("Failed to fetch bonuses: \(error)")
        }
        
        return true
    }
    @discardableResult class func forceLoadData() -> Bool {
        let url = URL(string: "https://www.basicbitch.dev/bonuses.json")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let json = dataResponse
                
                struct BonusEntry: Codable {
                    var sampleImage: String?
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
                
                print("The following bonuses are available:")
                for (i,bonus) in bonuses.enumerated() {
                    print("\t\(bonus.bonusName) (\(bonus.bonusCode) )")
                    
                    let _ = Bonus.createBonus(
                        name: bonus.bonusName,
                        code: bonus.bonusCode,
                        city: bonus.city,
                        state: bonus.state,
                        category: bonus.bonusCategory,
                        region: bonus.region,
                        gps: bonus.GPS,
                        sampleImage: "2019ca1",
                        order: i
                    )
                }
                
            } catch let parsingError {
                print("Error", parsingError)
            }
            
        }
        task.resume()
        
        
        return true
    }
    class func getBonusesKey(key:String) -> [String] {
        
        let moc = CoreData.stack.context
        let bonusesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")
        bonusesFetch.propertiesToFetch = ["\(key)"]
        do {
            let fetchedBonuses = try moc.fetch(bonusesFetch) as! [Bonus]
            print(fetchedBonuses)
            var elements = ["Tour of Honor"]
            for bonus in fetchedBonuses {
                if elements.contains("\(bonus.category)") {
                } else {
                    elements.append("\(bonus.category)")
                }
            }
            
            print(elements)
            return elements
        } catch {
            fatalError("Failed to fetch bonuses: \(error)")
        }
    }
    
    
}
