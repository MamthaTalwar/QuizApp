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
    
    /// Property observer to set the data
    var quizCategory: QuizCategory? {
        didSet {
            (self.view as? QuestionListView)?.quizCategory = quizCategory
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as? QuestionListView)?.delegate = self
    }
    
    /// ActionOfView protocol method is used to get the selected question and display selected question along with options in questionAnswerViewController
    ///
    /// - Parameter selectedQuestion: selected question is fetched and navigated to its related question answer page
    func actionOfView(_ selectedIndex: IndexPath) {
        guard let questionWithOptionPage = self.storyboard?.instantiateViewController(withIdentifier:"QuestionAnswerViewController") as? QuestionAnswerViewController,
        let selectedQuestion = quizCategory?.questionList?[selectedIndex.row] else { return }
        questionWithOptionPage.questiondata = selectedQuestion
        self.navigationController?.pushViewController(questionWithOptionPage, animated: true)
    }
}






