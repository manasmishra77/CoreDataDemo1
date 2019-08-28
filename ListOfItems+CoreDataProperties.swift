//
//  ListOfItems+CoreDataProperties.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 28/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//
//

import Foundation
import CoreData


extension ListOfItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListOfItems> {
        return NSFetchRequest<ListOfItems>(entityName: "ListOfItems")
    }

    @NSManaged public var count: Int64
    @NSManaged public var title: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension ListOfItems {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
