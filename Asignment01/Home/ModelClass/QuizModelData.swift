//
//  QuizModelData.swift
//  Asignment01
//
//  Created by Mamatha S on 09/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import Foundation

/// Model class created using Structure
/// Quiz Model Class
struct Quiz {
    var categories: [QuizCategory]?
    init(_  array: [Dictionary<String, Any>]) {
        self.categories = array.map { QuizCategory($0) }
    }
}

struct QuizCategory {
    var name : String?
    var questionList: [Question]?
    init(_ dict: Dictionary<String, Any>) {
        self.name = dict["name"] as? String
        guard let list = dict["list"] as? [Dictionary<String, Any>] else { return }
        self.questionList = list.map { Question($0) }
    }
}

struct Question {
    let question: String?
    let options: [String]?
    let answer: String?
    init(_ dict: Dictionary<String, Any>) {
        self.question = dict["question"] as? String
        self.options = dict["options"] as? [String]
        self.answer = dict["answer"] as? String
    }
}











