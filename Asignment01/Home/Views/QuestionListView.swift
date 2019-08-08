//
//  QuestionListView.swift
//  Asignment01
//
//  Created by Mamatha S on 29/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

/// Protocol used to selected question to QuestionListViewController
protocol QuestionListViewDelegate : class {
    func actionOfView(_ selectedQuestion: Question)
}

class QuestionListView: UIView {
    
    @IBOutlet weak private var tableView: UITableView!
    weak var delegate: QuestionListViewDelegate?
    
    var quizCategory: QuizCategory? {
        didSet {
            tableView?.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
    }
}

/// Extending Table view methods to QuestionListViewController
extension QuestionListView : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = quizCategory?.questionList?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as? QuestionListTableViewCell else {
            return UITableViewCell()
        }
        
        if let questions = quizCategory?.questionList?[indexPath.row] {
            cell.labelName?.text = questions.question
        }
        cell.questionSave.tag = indexPath.row
        cell.questionSave.addTarget(self, action: #selector(questionSaveButton(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = UIColor.red
        return cell
    }
    
    /// Tapped question from question list from questionlistView page is saved
    ///
    /// - Parameter sender: associated question of that button gets saved
    @objc func questionSaveButton(_ sender: UIButton) {
        guard let questions = quizCategory?.questionList?[sender.tag], let tappedQuestion = questions.question else { return }
        CoreDatabaseManager.saveFavoriteData(tappedQuestion) { (success) in
            if success {
                print("data saved successfully")
                
            } else {
                print("There was an error saving data")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        guard let questions = quizCategory?.questionList?[indexPath.row] else {  return }
        delegate?.actionOfView(questions)
    }
    
    /// To provide dynamic row height for the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



