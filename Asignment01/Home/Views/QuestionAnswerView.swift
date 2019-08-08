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
    
    var questiondata: Question? {
        didSet {
            tableView?.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        guard let count = questiondata?.options?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell", for: indexPath) as? QuestionAnswerTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel?.text = questiondata?.options?[indexPath.row]
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return questiondata?.question
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let selectedAnswer = questiondata?.options?[indexPath.row]
        guard let answer = questiondata?.answer else { return  }
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
