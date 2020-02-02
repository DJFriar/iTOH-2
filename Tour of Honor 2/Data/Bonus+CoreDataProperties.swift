//
//  Bonus+CoreDataProperties.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 2/1/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
//

import Foundation
import CoreData


extension Bonus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bonus> {
        return NSFetchRequest<Bonus>(entityName: "Bonus")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var order: Int32

}
