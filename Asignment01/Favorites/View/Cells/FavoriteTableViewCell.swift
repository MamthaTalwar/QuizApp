//
//  FavoriteTableViewCell.swift
//  Asignment01
//
//  Created by Mamatha S on 19/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

///FavoriteTableViewCell is used to create outlets required for  FavoriteViewController
class FavoriteTableViewCell: UITableViewCell {

   @IBOutlet weak var listLabel: UILabel!
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
