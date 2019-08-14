//
//  QuestionAnswerView.swift
//  Asignment01
//
//  Created by Mamatha S on 29/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

class QuestionAnswerView: UIView {
    
    @IBOutlet weak private var tableView: UITableView!
    
    var questiondata: QuestionAnswerViewModel? {
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

/// Extending Table view methods to QuestionAnswerViewController
extension QuestionAnswerView : UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = questiondata?.displayOptions?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell", for: indexPath) as? QuestionAnswerTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel?.text = questiondata?.displayOptions?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return questiondata?.displayQuestion
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let selectedAnswer = questiondata?.displayOptions?[indexPath.row]
        guard let answer = questiondata?.displayAnswer else { return  }
        if selectedAnswer == answer {
            cell?.backgroundColor = UIColor.green
        } else {
            cell?.backgroundColor = UIColor.red
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        /// Accesing cellForRow method in didSelectRow method of tableview
        let cell = tableView.cellForRow(at: indexPath) 
        cell?.backgroundColor = UIColor.white
    }
}
