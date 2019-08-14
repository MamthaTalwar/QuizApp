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
    func actionOfView(_ selectedIndex: IndexPath)
}

class QuestionListView: UIView {
    
    @IBOutlet weak private var tableView: UITableView!
    weak var delegate: QuestionListViewDelegate?
    
    var quizCategory: QuestionListViewModel? {
        didSet {
            tableView?.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewDelgatesFunc()
    }
    
    /// This function is used to set delegates for TableView
    private func tableViewDelgatesFunc() {
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
        return quizCategory?.displayQuestionList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as? QuestionListTableViewCell else {
            return UITableViewCell()
        }
        
        if let questions = quizCategory?.displayQuestionList?[indexPath.row] {
            cell.labelName?.text = questions
        }
        cell.questionSave.tag = indexPath.row
        cell.questionSave.addTarget(self, action: #selector(questionSaveButton(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    /// Tapped question from questionlistView page is saved in favoriteViewController
    ///
    /// - Parameter sender: associated question of that button gets saved
    @objc func questionSaveButton(_ sender: UIButton) { 
        guard let questions = quizCategory?.displayQuestionList?[sender.tag] else { return }
        CoreDatabaseManager.saveFavoriteData(questions) { (success) in
            if success {
                /// Saved Data successfully

            } else {
                /// There was an error saving data
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.actionOfView(indexPath)
    }
    
    /// To provide dynamic row height for the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



