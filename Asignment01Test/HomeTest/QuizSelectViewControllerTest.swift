//
//  QuizSelectViewControllerTest.swift
//  Asignment01Test
//
//  Created by Mamatha S on 31/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import XCTest
@testable import Asignment01

class QuizSelectViewControllerTest: XCTestCase {
    
    /// Step 1:  First create a reference of controllerclass which needs to be tested
    var quizSelectViewControllerInstance : QuizSelectViewController!
    
    
    /// Step 2: Get the Testing ViewController from Storyboard and load the view (calling ViewDidLoad)
    override func setUp() {
        quizSelectViewControllerInstance = UIStoryboard(name: "QuizStoryboard", bundle: nil).instantiateViewController(withIdentifier: "QuizSelectViewController") as! QuizSelectViewController
        let _ = quizSelectViewControllerInstance?.view
    }
    
    /// Step 3: Test the functions which are included in QuizSelectViewController
    
     ///Mock: fake interactions with library or system objects by using stubs and mocks
    func testactionOfView() {
        let dict: [String: Any] = ["category": "category"]
        let selected_category = QuizCategory(dict)
        /// Fail
        //XCTAssertNil(selected_category, "does not navigate to question list page")
        ///Pass
        XCTAssertTrue(selected_category != nil, "Should navigate to question list page of category")
    }
    func testPercentageCalculator() {
        // Should be 25
        let p = quizSelectViewControllerInstance.addQuizAddition(firstNo: 10,secondNo: 10)
      // XCTAssertTrue(p, "")
       
        
       
    }
   
   


    /// Step 4: Make sure everything is cleared  after test completes  its excution
    override func tearDown() {
       quizSelectViewControllerInstance = nil
    }
    }
