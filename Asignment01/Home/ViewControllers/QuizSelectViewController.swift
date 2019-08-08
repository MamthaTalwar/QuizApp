//
//  FirstViewController.swift
//  Asignment01
//
//  Created by Mamatha S on 09/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

/// Class QuizSelectViewController is used to display the category for taking quiz
class QuizSelectViewController: UIViewController, QuizSelectViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        (self.view as? QuizSelectView)?.delegate = self
        addQuizAddition(firstNo: 10,secondNo: 10)
        
    }
 
    /// Calling QuizSelectView in QuizSelectViewController
    var quiz: Quiz? {
        didSet {
            (self.view as? QuizSelectView)?.quiz = quiz
        }
    }
    
    /// This function is used to call a function fectchquizdata
    private func configureView() {
        fetchQuizData()
    }
    
    /// This fuction is used for Fetching Quiz Data
    private func fetchQuizData() {
        DispatchQueue.global(qos: .background).async {
            do {
                typealias jsonType = [String: Any]
                guard let fileURL = Bundle.main.url(forResource: "example", withExtension: "json") else { return }
                let data = try Data(contentsOf: fileURL)
                guard let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? jsonType,
                      let quizJson = jsonData["quiz"] as? [Dictionary<String, Any>] else { return }
                
                DispatchQueue.main.async {
                    self.quiz = Quiz(quizJson)
                }
           } catch {
                print("Failed to load data \(error.localizedDescription)")
           }
       }
    }
    
    /// ActionofView protocol method is used to get the category selected from quizselectviewcontroller and navigate to question list page
    ///
    /// - Parameter selectedCategory: selected category is fetched and navigated to its related question page
    func actionOfView(_ selectedCategory: QuizCategory) {
        guard let questionListPage = self.storyboard?.instantiateViewController(withIdentifier: "QuestionListViewController") as? QuestionListViewController else { return }
        questionListPage.quizCategory = selectedCategory
        self.navigationController?.pushViewController(questionListPage, animated: true)
    }
    
    /// This function does not serve any purpose for this controller class. Used for Unit Testing
    func addQuizAddition(firstNo: Int, secondNo: Int) {
        let result = firstNo + secondNo
        print("value of two nos is \(result)")
    }
}





