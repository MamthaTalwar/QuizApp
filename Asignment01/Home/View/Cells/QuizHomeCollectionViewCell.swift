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
    
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var imageName: UIImageView!
    let selectCellBorder = 2
    let deSelectCellBorder = 0.5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
    }
    
    /// Displays selected category name along with the image
    ///
    /// - Parameters:
    ///   - categoryName: selected category name
    ///   - name: selected category name image
    
    func setData(_ categoryName: String?, image name: String) {
        labelName.text = categoryName
        imageName.image = UIImage(named: name)
    }
    
    func selectBorderCell() {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = CGFloat(selectCellBorder)
    }
    
    func deSelectBorderCell() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = CGFloat(deSelectCellBorder)
    }
}
