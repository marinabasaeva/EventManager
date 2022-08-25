//
//  EventDetailViewController.swift
//  EventManager
//
//  Created by Marina Basaeva on 7/14/22.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var eventTitleTextField: UITextField!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    
    var event: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let event = event {
            title = "Event Details"
            eventTitleTextField.text = event.title
            eventDatePicker.date = event.date ?? Date()
        } else {
            title = "Create New Event"
        }
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = eventTitleTextField.text,
              !title.isEmpty
        else {return}
        
        let date = eventDatePicker.date
        
        if let event = event {
            EventController.shared.updateEvent(event: event, title: title, date: date)
        } else {
            EventController.shared.createEvent(title: title, date: date)
        }
        navigationController?.popViewController(animated: true)
    }
   

}//End of class
