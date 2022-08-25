//
//  EventController.swift
//  EventManager
//
//  Created by Marina Basaeva on 7/14/22.
//

import Foundation
import CoreData

class EventController {
    
    static let shared = EventController()
    
    private init() {}
    
    private lazy var fetchRequest: NSFetchRequest<Event> = {
        let request = NSFetchRequest<Event>(entityName: "Event")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    var events: [Event] = []
    
    // CRUD
    
    func createEvent(title: String, date: Date) {
        let event = Event(title: title, date: date)
        events.append(event)
        CoreDataStack.saveContext()
    }
    
    func fetchEvent() {
        let events = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(events.count)
        self.events = events
    }
    
    func updateEvent(event: Event, title: String, date: Date) {
        
        event.title = title
        event.date = date
        
        CoreDataStack.saveContext()
    }
    
    func markEventAttended(event: Event) {
        event.wasAttended.toggle()
        
        CoreDataStack.saveContext()
        
    }
    
    func deleteEvent() {
        
    }
    
    
} //End of class
