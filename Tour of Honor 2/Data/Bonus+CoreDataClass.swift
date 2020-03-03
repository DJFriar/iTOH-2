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
           
           let fetchRequest: NSFetchRequest<Bonus> = Bonus.fetchRequest()
           
           do {
               let count = try CoreData.stack.context.count(for: fetchRequest)
               return count
           } catch let error as NSError {
               fatalError("Unresolved error \(error), \(error.userInfo)")
           }
       }
    
    //MARK: CRUD
    
    class func newBonus() -> Bonus {
        
        return Bonus(context: CoreData.stack.context)
    }
    class func createBonus(name: String, code: String, city: String, state: String, category: String, sampleImage: String, order: Int?) -> Bonus {
        
        let bonus = Bonus.newBonus()
        bonus.name = name
        bonus.code = code
        bonus.category = category
        bonus.city = city
        bonus.state = state
        bonus.sampleImage = sampleImage
        bonus.order = Int32(order ?? 0)
        bonus.captured = false
        CoreData.stack.save()
        
        return bonus
    }
    
    class func updateBonus(code: String) -> Bool {
        print("test \(code)")
        return true
    }
    
    class func updateCapturedFlag(state: Bool, code: String) -> Bool {
      
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
    
    
    
}
