//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Johnathan Aviles on 1/18/21.
//

import CoreData

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
     let request = NSFetchRequest<Entry>(entityName: "Entry")
     request.predicate = NSPredicate(value: true)
     return request
    }()
    
    func createEntry(title: String, bodyText: String) {
        Entry(title: title, bodyText: bodyText)
        CoreDataStack.saveContext()
    }
    
    func fetchEntry() {
        entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
    }
    
    func update(entry: Entry, title: String, bodyText: String) {
        entry.title = title
        entry.bodyText = bodyText
        entry.timeStamp = Date()
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(entry: Entry) {
        entry.managedObjectContext?.delete(entry)
        CoreDataStack.saveContext()
        fetchEntry()
    }
}
