//
//  SecondTableViewCell.swift
//  Asignment01
//
//  Created by Mamatha S on 09/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit
import CoreData
/// Class QuestionListTableViewCell is used to declare outlets required for class QuestionListViewController
class QuestionListTableViewCell: UITableViewCell {

    @IBOutlet weak public var questionSave: UIButton!
    @IBOutlet weak public var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
}
