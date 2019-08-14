//
//  ThirdViewController.swift
//  Asignment01
//
//  Created by Mamatha S on 09/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

/// Class QuestionAnswerViewController is used to display question along with options based on category selected for taking quiz
class QuestionAnswerViewController: UIViewController {
    
     /// Property observer to set the data
     var questiondata: Question? {
        didSet {
            (self.view as? QuestionAnswerView)?.questiondata = questiondata
        }
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


