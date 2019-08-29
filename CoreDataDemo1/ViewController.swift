//
//  ViewController.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 28/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var context: NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func configureViews() {
        let nib = UINib(nibName: CoreDataTableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CoreDataTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    @IBAction func tappedOnButton(_ sender: UIButton) {
        switch sender {
        case button1:
            
            NetworkManager.getHeadLines { (isSuccess, headlinesModel) in
                if isSuccess {
                    do {
                        try self.context.save()
                    } catch {
                        print(error)
                    }
                }
            }
            
            
            print("btn1 cases")
            return
            let listOfItemsentityDesc = NSEntityDescription.entity(forEntityName: "ListOfItems", in: context)
            let newItemList = NSManagedObject(entity: listOfItemsentityDesc!, insertInto: context) as! ListOfItems
            let itemDesc = NSEntityDescription.entity(forEntityName: "Item", in: context)
            var items: [Item] = []
            for _ in 0...4 {
                let newItem = NSManagedObject(entity: itemDesc!, insertInto: context) as! Item
                newItem.count = Int64(CGFloat.random())
                newItem.subtitle = String.random()
                newItem.title = String.random()
                newItem.list = newItemList
                items.append(newItem)
            }
            newItemList.count = 3
            newItemList.addToItems(NSSet(array: items))
            do {
                try context.save()
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListOfItems")
                let result = try context.fetch(fetchRequest).first as! ListOfItems
                print(result.count)
                let firstItem = result.items?.first(where: { (_) -> Bool in
                    return true
                }) as! Item
                 print(firstItem)
                 print(result)
                
            } catch {
                print(error)
            }
        case button2:
            
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HeadLinesModel")
                let result = try context.fetch(fetchRequest).first as! HeadLinesModel
                print(result)
                let firstArticle = result.articles?.first(where: { (_) -> Bool in
                    return true
                }) as! Articles
                context.delete(result)
                print(firstArticle)
            } catch {
                print(error)
            }
            
            return
            //Delete one item
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListOfItems")
                let result = try context.fetch(fetchRequest).first as! ListOfItems
                print(result.count)
                let firstItem = result.items?.first(where: { (_) -> Bool in
                    return true
                }) as! Item
                print(firstItem)
                print(result)
                result.removeFromItems(firstItem)
                let secondItem = result.items?.first(where: { (_) -> Bool in
                    return true
                }) as! Item
                print(firstItem)
                print(result)
                
            } catch {
                print(error)
            }
            
            print("btn2 cases")
        case button3:
            print("btn3 cases")
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Articles")
                let result = try context.fetch(fetchRequest).first as! Articles
                print(result)
//                let firstArticle = result.articles?.first(where: { (_) -> Bool in
//                    return true
//                }) as! Articles
               // print(firstArticle)
            } catch {
                print(error)
            }
        default:
            print("Default cases")
        }
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoreDataTableViewCell.reuseIdentifier, for: indexPath) as! CoreDataTableViewCell
        return cell
    }
    
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension String {
    
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
