//
//  AddressBookTableViewCell.swift
//  easypeasy
//
//  Created by Ahmad on 15/10/2020.
//

import UIKit

class AddressBookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selectionIcon: UIImageView!
    @IBOutlet weak var firstLabel: CircularBorderedLabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(model: UserContactModel, isSelected: Bool, isAppUser: Bool = true, flowType: addressBookScreenFlowType = .scheduleGreeting) {
        
        selectionIcon.isHidden = isSelected ? false : true
        phoneLabel.text = model.phoneNumber
        
        if model.firstName.isEmpty && model.lastName.isEmpty {
            nameLabel.text = model.company
            if let str = model.company.first {
                firstLabel.text = String(str).capitalized
            }
        } else {
            nameLabel.text = model.firstName + " " + model.lastName
            if let str = model.firstName.first {
                firstLabel.text = String(str).capitalized
            }
        }
        
    }

}
