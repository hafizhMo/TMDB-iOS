//
//  CoreDataManager.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 15/02/23.
//

import Foundation
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext

    private init() {
        container = NSPersistentContainer(name: "TMDB-CD")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        context = container.viewContext
    }
}
