//
//  Articles+CoreDataClass.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 29/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Articles)
public class Articles: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case descriptionOfContent = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(source, forKey: .source)
        try container.encode(author, forKey: .author)
        try container.encode(title, forKey: .title)
        try container.encode(descriptionOfContent, forKey: .descriptionOfContent)
        try container.encode(url, forKey: .url)
        try container.encode(urlToImage, forKey: .urlToImage)
        try container.encode(publishedAt, forKey: .publishedAt)
    }
    
    required public init(from decoder: Decoder) throws {
        var appDelegate: AppDelegate {
            return UIApplication.shared.delegate as! AppDelegate
        }
        
        var context: NSManagedObjectContext {
            return appDelegate.persistentContainer.viewContext
        }
        let itemDesc = NSEntityDescription.entity(forEntityName: "Articles", in: context)
        super.init(entity: itemDesc!, insertInto: context)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decodeIfPresent(Source.self, forKey: .source)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        descriptionOfContent = try values.decodeIfPresent(String.self, forKey: .descriptionOfContent)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
}
