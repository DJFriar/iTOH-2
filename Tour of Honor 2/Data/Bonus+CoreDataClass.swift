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
    class func createBonus(name: String, order: Int?) -> Bonus {
        
        let bonus = Bonus.newBonus()
        bonus.name = name
        bonus.order = Int32(order ?? 0)
        CoreData.stack.save()
        
        return bonus
    }
}
