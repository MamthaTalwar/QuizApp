//
//  FirstCollectionViewCell.swift
//  Asignment01
//
//  Created by Mamatha S on 09/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

///Class QuizHomeCollectionViewCell is used to declare outlets required for QuizSelectViewController
class QuizHomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageName: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     layer.borderColor = UIColor.lightGray.cgColor
     layer.borderWidth = 0.5
    }
}
