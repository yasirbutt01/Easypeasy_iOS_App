//
//  GenericTableViewCell.swift
//  easypeasy
//
//  Created by Ahmad on 06/10/2020.
//

import UIKit

class GenericTableViewCell: UITableViewCell {

    @IBOutlet weak var boldLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var arrowIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(boldTitle: String, detailStr:String, arrowIcon:UIImage = Icons.ARROW_RIGHT) {
        boldLabel.text = boldTitle
        detailLabel.isHidden = detailStr.isEmpty
        detailLabel.text = "- \(detailStr)"
        self.arrowIcon.image = arrowIcon
    }
}
