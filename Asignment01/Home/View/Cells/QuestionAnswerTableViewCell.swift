//
//  ThirdTableViewCell.swift
//  Asignment01
//
//  Created by Mamatha S on 09/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

/// Class QuestionAnswerTableViewCell is used to declare outlets required for QuestionAnswerViewController class
class QuestionAnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
       super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
    }

}
