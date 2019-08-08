//
//  FavoriteViewController.swift
//  Asignment01
//
//  Created by Mamatha S on 18/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

/// Class FavoriteViewController  contains list of saved Questions that are saved from Maths and sports category
class FavoriteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        (self.view as? FavoriteView)?.fetchDataFromDataBase()
    }
}

