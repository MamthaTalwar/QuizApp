//
//  FavoriteView.swift
//  Asignment01
//
//  Created by Mamatha S on 01/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

class FavoriteView: UIView {
    
    private var questions: [String] = []
    @IBOutlet weak private var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 44
    }
    
    /// This function is used to fetchdata from database
    func fetchDataFromDataBase() {
        CoreDatabaseManager.fetchFavoriteData { (success, array) in
            questions = array
            tableView.reloadData()
        }
    }
}

// MARK: - Extending Table view methods to FavoriteViewController
extension FavoriteView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        let savedQuestions = questions[indexPath.row]
        cell.listLabel.text = savedQuestions
        let imageletter = cell.listLabel.text!
        cell.imageFirstLetter.setImageForName(imageletter, backgroundColor: nil, circular: true, textAttributes: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != UITableViewCell.EditingStyle.delete { return }
        let deleteQuestions = questions.remove(at: indexPath.row)
        CoreDatabaseManager.deleteDataFromFavorite(deleteQuestions) { (success) in
            if success {
                tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
