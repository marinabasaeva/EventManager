//
//  Event + Convenience.swift
//  EventManager
//
//  Created by Marina Basaeva on 7/15/22.
//

import CoreData

extension Event {
    @discardableResult convenience init(title: String, date: Date, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.date = date
    }
}
