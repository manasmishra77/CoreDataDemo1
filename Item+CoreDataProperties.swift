//
//  Item+CoreDataProperties.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 28/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var count: Int64
    @NSManaged public var list: ListOfItems?

}
