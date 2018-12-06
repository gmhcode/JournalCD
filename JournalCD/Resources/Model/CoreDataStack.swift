//
//  CoreDataStack.swift
//  JournalCD
//
//  Created by Greg Hughes on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//


import Foundation
import CoreData

enum CoreDataStack{
    
    static let container: NSPersistentContainer = {
        // ^^ gives us something to put into MOC
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        
        let container = NSPersistentContainer(name: appName)
        container.loadPersistentStores(){( storeDescription, error) in
            //
            if let error = error as NSError? {
                fatalError("💩 Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext}
}

