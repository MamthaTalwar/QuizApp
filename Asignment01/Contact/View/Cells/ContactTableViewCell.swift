//
//  ContactTableViewCell.swift
//  Asignment01
//
//  Created by Mamatha S on 02/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit
/// ContactTableViewCell used to create outlets for displayig contacts
class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Contact: UILabel!
    @IBOutlet weak var imageFirstLetter: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
