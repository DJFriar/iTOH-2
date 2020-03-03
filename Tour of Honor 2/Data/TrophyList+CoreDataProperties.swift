//
//  TrophyList+CoreDataProperties.swift
//  Tour of Honor 2
//
//  Created by Keisha Perry on 3/2/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//
//

import Foundation
import CoreData


extension TrophyList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrophyList> {
        return NSFetchRequest<TrophyList>(entityName: "TrophyList")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var completed: Bool

}
