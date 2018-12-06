//
//  EntriesListTableViewController.swift
//  JournalCD
//
//  Created by Greg Hughes on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import UIKit
import CoreData

class EntriesListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        guard let entry = fetchedResultsController.fetchedObjects?[indexPath.row] else {return UITableViewCell()}
        // Configure the cell...
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.timestamp?.asString

        return cell
    }
    
    
    
    
    
    let fetchedResultsController: NSFetchedResultsController<Entry> = {
        
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "timeStamp", ascending: true)]
        
        return NSFetchedResultsController(fetchRequest: Entry.fetchRequest(), managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
