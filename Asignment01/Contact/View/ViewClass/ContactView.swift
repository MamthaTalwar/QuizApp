//
//  ContactView.swift
//  Asignment01
//
//  Created by Mamatha S on 02/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit
import RealmSwift
import SCLAlertView
import InitialsImageView

class ContactView: UIView {
    
    var realm: Realm!
    @IBOutlet weak var tableView: UITableView!
    
    /// addContact is an array which is of result type in Realm
    var addContact: Results<Contact> {
        return realm.objects(Contact.self)
    }
    
    override func awakeFromNib() {
        realm = try? Realm()
        tableViewDelegatesFunc()
    }
    
    /// This function is used to set delgates for Tableview
    private func tableViewDelegatesFunc() {
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }
   
    /// addContact function is used to add the new name and contact
    @IBAction func addContact(_ sender: Any) {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false,
            showCircularIcon: false
        )
        
        let alert = SCLAlertView(appearance: appearance)
        let nameTextField = alert.addTextField("Enter your name")
        let contactTextField = alert.addTextField("Enter your contact no")
        let addButtonColor = UIColor(red: 75.0/255.0, green: 0/255.0, blue: 130.0/255.0, alpha: 1.0)
        
        /// ADD BUTTON
        alert.addButton("Add", backgroundColor: addButtonColor, textColor: UIColor.white) {
            let addNewContact = Contact()
            addNewContact.name = nameTextField.text!
            addNewContact.number = contactTextField.text!
            try! self.realm.write {
                self.realm.add(addNewContact)
                let indexpath = IndexPath(row: self.addContact.count - 1, section: 0)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [indexpath], with: .automatic)
                self.tableView.endUpdates()
            }
        }
        
        /// CANCEL BUTTON
        let cancelButtonColor = UIColor(red: 75.0/255.0, green: 0/255.0, blue: 130.0/255.0, alpha: 1.0)
        alert.addButton("Cancel", backgroundColor: cancelButtonColor, textColor: UIColor.white) {
            alert.hideView()
        }
        alert.showInfo("CONTACT", subTitle: "Addcontact")
    }
}

// MARK: - Extending Table view methods to ContactViewController
extension ContactView: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addContact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as? ContactTableViewCell else { return UITableViewCell() }
        let cellData = addContact[indexPath.row]
        cell.Name.text = cellData.name
        let  imageletter =  cell.Name.text!
        cell.Contact.text = cellData.number
        cell.imageFirstLetter.setImageForName(imageletter, backgroundColor: nil, circular: true, textAttributes: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let delete = addContact[indexPath.row]
            try! self.realm.write {
                self.realm.delete(delete)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
}
