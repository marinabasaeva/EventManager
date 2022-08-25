//
//  EventListViewController.swift
//  EventManager
//
//  Created by Marina Basaeva on 7/14/22.
//

import UIKit

class EventListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EventController.shared.fetchEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEventDetail",
           let indexPath = tableView.indexPathForSelectedRow,
           let destination = segue.destination as? EventDetailViewController {
            let event = EventController.shared.events[indexPath.row]
            destination.event = event
            
        } 
    }

}//End of class

extension EventListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventController.shared.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell else {return UITableViewCell()}
        
        let event = EventController.shared.events[indexPath.row]
        cell.titleLabel.text = event.title
        cell.delegate = self
        
        return cell
    }
    
    
}

extension EventListViewController: UITableViewDelegate {}

extension EventListViewController: EventTableViewCellDelegate {
    func eventWasAttendedButtonTapped(_ sender: EventTableViewCell) {
        guard let event = sender.event else {return}
        EventController.shared.markEventAttended(event: event)
        sender.updateViews()
    }
    
}
