//
//  QuizSelectViewModel.swift
//  Asignment01
//
//  Created by Mamatha S on 11/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import Foundation

/// QuizSelectViewModel protocol Declaration used to get the category name from QuizDataModel
protocol QuizSelectViewModel {
    var categoryName: [String]? { get }
}

/// Quiz Object is QuizModelData
/// QuizSelectViewModel is accessing category name from QuizModelData and assigning it to QuizSelectView
extension Quiz: QuizSelectViewModel {
    var categoryName: [String]? {
        let name = self.categories?.compactMap({(name) -> String? in
            return name.name
        })
        return name
    }
}


