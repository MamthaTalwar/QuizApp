//
//  Quiz.swift
//  Asignment01
//
//  Created by Mamatha S on 29/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

/// Protocol used to send selected category to QuizselectviewController
protocol QuizSelectViewDelegate: class {
    func actionOfView(_ selectedCategory: QuizCategory)
}

class QuizSelectView: UIView {
    
    @IBOutlet weak private var collectionView: UICollectionView!
    private let images = ["sports", "maths","dance","art","technolgy","geography"]
    weak var delegate: QuizSelectViewDelegate?
    
    var quiz: Quiz? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        customLayout()
    }
    
    /// This used to set properties for modifying view of collection view
    private func customLayout() {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 5
    }
}

/// Extending Collection view methods to QuizSelectViewController class
extension QuizSelectView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = quiz?.categories?.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as? QuizHomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let category = quiz?.categories?[indexPath.row] {
            
            cell.labelName?.text = category.name?.uppercased()
        }
        
       cell.imageName?.image = UIImage(named: images[indexPath.row])
      
       return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.collectionView.frame.size.width - 30)/2
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let category = quiz?.categories?[indexPath.row] else { return }
        delegate?.actionOfView(category)
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
         let cell = collectionView.cellForItem(at: indexPath)
         cell?.layer.borderColor = UIColor.lightGray.cgColor
         cell?.layer.borderWidth = 0.5
    }
}
