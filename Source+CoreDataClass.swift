//
//  Source+CoreDataClass.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 29/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Source)
public class Source: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
    }
    required public init(from decoder: Decoder) throws {
        var appDelegate: AppDelegate {
            return UIApplication.shared.delegate as! AppDelegate
        }
        
        var context: NSManagedObjectContext {
            return appDelegate.persistentContainer.viewContext
        }
        let itemDesc = NSEntityDescription.entity(forEntityName: "Source", in: context)
        super.init(entity: itemDesc!, insertInto: context)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
}
