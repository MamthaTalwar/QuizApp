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
     func actionOfView(_ selectedIndex: IndexPath)
}

class QuizSelectView: UIView {
    
    @IBOutlet weak private var collectionView: UICollectionView!
    private let images = ["sports", "maths","dance","art","technolgy","geography"]
    weak var delegate: QuizSelectViewDelegate?
    let cellinterSpace  =  5
   
    
    var quiz: QuizSelectViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewDelegatesFunc()
        customLayout()
        print("hi")
    }
    
    /// This function used to set properties for modifying view of collection view
    private func customLayout() {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = CGFloat(cellinterSpace)
    }
    
    /// This function is used to set delgeates for Collection View
    private func collectionViewDelegatesFunc() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
   
}

/// Extending Collection view methods to QuizSelectViewController class
extension QuizSelectView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = quiz?.categoryName?.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as? QuizHomeCollectionViewCell,
              let category = quiz?.categoryName?[indexPath.row] else {
            return UICollectionViewCell()
        }
    
        let imageName = images[indexPath.row]
        cell.setData(category.uppercased(), image: imageName)
        return cell
   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.collectionView.frame.size.width - 30)/2
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.actionOfView(indexPath)
        guard let cell = collectionView.cellForItem(at: indexPath) as? QuizHomeCollectionViewCell else { return }
        cell.selectBorderCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? QuizHomeCollectionViewCell else { return }
        cell.deSelectBorderCell()
    }
}
