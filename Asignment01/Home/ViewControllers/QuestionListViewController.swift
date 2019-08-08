//
//  SecondViewController.swift
//  Asignment01
//
//  Created by Mamatha S on 09/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit
import CoreData

/// Class QuestionListViewController is used to display the questions based on category selected for taking quiz
class QuestionListViewController: UIViewController, QuestionListViewDelegate {
    
    /// Calling QuestionListView in QuestionListViewController
    var quizCategory: QuizCategory? {
        didSet {
            (self.view as? QuestionListView)?.quizCategory = quizCategory
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as? QuestionListView)?.delegate = self
        //// jvojfiovj dfjvokf dvjs dkfvjiofdj vjdfov fdhviojh
        
        /*
        f
        vdfv
        fvv
        dfv
        */
    }
    
    /// ActionOfView protocol method is used to get the selected question and display selected question along with options in questionanswerviewController
    ///
    /// - Parameter selectedQuestion: selected question is fetched and navigated to its related question answer page 
    func actionOfView(_ selectedQuestion: Question) {
        guard let questionWithOptionPage = self.storyboard?.instantiateViewController(withIdentifier:"QuestionAnswerViewController") as? QuestionAnswerViewController else { return }
        questionWithOptionPage.questiondata = selectedQuestion
        self.navigationController?.pushViewController(questionWithOptionPage, animated: true)
    }
}






