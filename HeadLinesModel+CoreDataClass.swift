//
//  HeadLinesModel+CoreDataClass.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 29/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//
//

import UIKit
import CoreData

@objc(HeadLinesModel)
public class HeadLinesModel: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case articles = "articles"
    }

    public func encode(to encoder: Encoder) throws {
  
    }
    
    public required init(from decoder: Decoder) throws {
        var appDelegate: AppDelegate {
            return UIApplication.shared.delegate as! AppDelegate
        }
        
        var context: NSManagedObjectContext {
            return appDelegate.persistentContainer.viewContext
        }
        let itemDesc = NSEntityDescription.entity(forEntityName: "HeadLinesModel", in: context)
        super.init(entity: itemDesc!, insertInto: context)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        let articlesArray = (try? values.decodeIfPresent([Articles].self, forKey: .articles)) ?? []
        self.addToArticles(NSSet(array: articlesArray))
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    
}


