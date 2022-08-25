//
//  EventTableViewCell.swift
//  EventManager
//
//  Created by Marina Basaeva on 7/14/22.
//

import UIKit

protocol EventTableViewCellDelegate: AnyObject {
    func eventWasAttendedButtonTapped(_ sender: EventTableViewCell)
    
}

class EventTableViewCell: UITableViewCell {
    
    weak var delegate: EventTableViewCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var wasAttendedButton: UIButton!
    
    var event: Event?{
        didSet {
            updateViews()
        }
    }
    var wasAttended: Bool = false
    
    func updateViews() {
        guard let event = event else {return}
        titleLabel.text = event.title
        let image = wasAttended ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
        wasAttendedButton.setImage(image, for: .normal)
        wasAttendedButton.tintColor = .black
    }
    
    @IBAction func wasAttendedButtonTapped(_ sender: Any) {
        guard event != nil else {return}
        wasAttended.toggle()
        print("WasAttendedButton tapped")
        delegate?.eventWasAttendedButtonTapped(self)
            
    
    }
    

}//End of class
