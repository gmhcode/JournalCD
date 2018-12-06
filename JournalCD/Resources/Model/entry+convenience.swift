//
//  entry+convenience.swift
//  JournalCD
//
//  Created by Greg Hughes on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    convenience init(title: String, body: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context){
        
        self.init(context: context)
        //^ tells extension that the convenience init is from this superclass
        self.title = title
        self.body = body
        self.timestamp = timestamp
        
    }
    
}
