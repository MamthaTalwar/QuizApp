//
//  QuestionAnswerViewModel.swift
//  Asignment01
//
//  Created by Mamatha S on 11/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import Foundation

/// QuestionAnswerViewModel protocol Declaration used to get the options,questions and answers from QuizDataModel
protocol QuestionAnswerViewModel {
    var displayOptions: [String]? { get }
    var displayQuestion: String? { get }
    var displayAnswer: String? { get }
}

/// Question Object is  QuizModelData
/// QuestionAnswerViewModel is accessing  options,questions and answers from QuizModelData and assigning it to QuizAnswerView
extension Question: QuestionAnswerViewModel {
    var displayAnswer: String? {
        return self.answer
    }
    
    var displayQuestion: String? {
        return self.question
    }
    
    var displayOptions: [String]?  {
        return self.options
    }
}
