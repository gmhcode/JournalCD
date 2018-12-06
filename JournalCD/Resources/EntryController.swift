//
//  EntryController.swift
//  JournalCD
//
//  Created by Greg Hughes on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

class EntryController{
    
    //shared instance
    
    static let shared = EntryController()
    private init(){}
    
    // MARK: - Crud
    func addEntryWith(title: String, body: String){
        Entry(title: title, body: body)
        
        saveToPersistence()
    }
    
    func update(entry: Entry, newtitle: String, body: String){
        entry.title = newtitle
        entry.body = body
        saveToPersistence()
    }
    
    func delete(entry: Entry){
        entry.managedObjectContext?.delete(entry)
        saveToPersistence()
    }
    
    
    
    
    // MARK: - Persistence
    func saveToPersistence(){
        
        do {
            
            try CoreDataStack.context.save()
        }
        catch{
            print("There was an error in \(#function) \(error) : \(error.localizedDescription)")
        }
    }
    
}
