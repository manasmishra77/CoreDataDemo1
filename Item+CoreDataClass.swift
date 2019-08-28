//
//  Item+CoreDataClass.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 28/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Item)
public class Item: NSManagedObject, Decodable {
    
   
    public required init(from decoder: Decoder) throws {
        var appDelegate: AppDelegate {
            return UIApplication.shared.delegate as! AppDelegate
        }
        
        var context: NSManagedObjectContext {
            return appDelegate.persistentContainer.viewContext
        }
        let itemDesc = NSEntityDescription.entity(forEntityName: "Item", in: context)
        super.init(entity: itemDesc!, insertInto: context)
    }
    
    
    

}
