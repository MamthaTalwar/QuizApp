//
//  QuestionListViewControllerTest.swift
//  Asignment01Test
//
//  Created by Mamatha S on 31/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import XCTest
@testable import Asignment01

class QuestionListViewControllerTest: XCTestCase {
    
    /// Step 1:  First create a reference of controllerclass which needs to be tested
    var quizListViewControllerInstance : QuestionListViewController!
    
      /// Step 2: Get the Testing ViewController from Storyboard and load the view (calling ViewDidLoad)
    override func setUp() {
        quizListViewControllerInstance = UIStoryboard(name: "QuizStoryboard", bundle: nil).instantiateViewController(withIdentifier: "QuestionListViewController") as! QuestionListViewController
        let _ = quizListViewControllerInstance?.view
    }
    
    /// Step 3: Test the functions which are included in QuestionListViewController
    ///Mock: fake interactions with library or system objects by using stubs and mocks
    func testactionOfView() {
        let dict: [String: Any] = ["Question": "question"]
        let selected_question = Question(dict)
        /// Fail
        XCTAssertNil(selected_question, "does not navigate to question answer page")
        /// Pass
        XCTAssertNotNil(selected_question, "Should go to QuestionAnswer page")
    }

    override func tearDown() {
      quizListViewControllerInstance = nil
    }
}
