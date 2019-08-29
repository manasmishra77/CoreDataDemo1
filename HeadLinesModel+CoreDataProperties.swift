//
//  HeadLinesModel+CoreDataProperties.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 29/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//
//

import Foundation
import CoreData


extension HeadLinesModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeadLinesModel> {
        return NSFetchRequest<HeadLinesModel>(entityName: "HeadLinesModel")
    }

    @NSManaged public var status: String?
    @NSManaged public var articles: NSSet?

}

// MARK: Generated accessors for articles
extension HeadLinesModel {

    @objc(addArticlesObject:)
    @NSManaged public func addToArticles(_ value: Articles)

    @objc(removeArticlesObject:)
    @NSManaged public func removeFromArticles(_ value: Articles)

    @objc(addArticles:)
    @NSManaged public func addToArticles(_ values: NSSet)

    @objc(removeArticles:)
    @NSManaged public func removeFromArticles(_ values: NSSet)

}
