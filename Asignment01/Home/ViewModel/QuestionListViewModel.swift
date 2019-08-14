//
//  QuestionListViewModel.swift
//  Asignment01
//
//  Created by Mamatha S on 11/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import Foundation

/// QuestionListViewModel protocol Declaration used to get the questions from QuizDataModel
protocol QuestionListViewModel {
    var displayQuestionList: [String]? { get }
}

/// QuizCategory Object is QuizModelData
/// QuestionListViewModel is accessing  questions from QuizModelData and assigning it to QuizListView
extension QuizCategory: QuestionListViewModel {
    var displayQuestionList: [String]? {
        let question = self.questionList?.compactMap({ (question) -> String? in
            return question.question
        })

        return question
    }
}
