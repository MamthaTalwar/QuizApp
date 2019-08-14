//
//  SaveData.swift
//  Asignment01
//
//  Created by Mamatha S on 17/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/// CoreDatabaseManager class contains all CURD operations performed on Core Data
class CoreDatabaseManager {
    
    /// This function is used to perform save data operation
    class func saveFavoriteData(_ question: String, completionHandler: (_ success: Bool)->()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let newquestion = NSEntityDescription.insertNewObject(forEntityName: "QuizEntity", into: context)
        newquestion.setValue(question, forKey: "question")
        do {
            try context.save ()
            completionHandler(true)
        } catch {
            completionHandler(false)
        }
    }
    
    /// This function is used to perform fetch data operation
    class func fetchFavoriteData(completionHandler: (_ success: Bool,_ array : [String])->()) {
        guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchrequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "QuizEntity")
        //fetchrequest.predicate = NSPredicate(format: "question=%@", question)
        do {
            let result = try context.fetch(fetchrequest)
            var array: [String] = []
            for res in result  as! [NSManagedObject] {
                if let question = res.value(forKey: "question") as? String {
                    array.append(question)
                }
            }
            completionHandler(true,array)
           
        } catch {
            completionHandler(false, [])
            print("There was an error fetching data")
        }
    }
    
    /// This function is used to perform delete data operation
    class func deleteDataFromFavorite(_ question: String, completionHandler: (_ success: Bool)->()) {
        guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchrequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "QuizEntity")
        fetchrequest.predicate = NSPredicate(format: "question=%@", question)
        do {
            let test = try context.fetch(fetchrequest)
            let objectToDelete = test[0] as! NSManagedObject
            context.delete(objectToDelete)
            do {
                try context.save()
                completionHandler(true)
            } catch {
                print("Failed to delete Data")
                completionHandler(false)
            }
        }
        catch {
            print("Failed to delete Data")
            completionHandler(false)
        }
    }
}

