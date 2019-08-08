//
//  NotifyView.swift
//  Asignment01
//
//  Created by Mamatha S on 01/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit
import UserNotifications

class NotifyView: UIView {
    
    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var notiButtonOutlet: UIButton!
    
    /// Schedule Notification
    @IBAction func allowNotification(_ sender: Any) {
       
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound]) {  (granted,error) in
            if granted {
                print("yes")
            } else {
                print("no")
            }
        }
        
        /// Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Local Notification Demonstration"
        content.subtitle = "From Sapient"
        content.body = "Notification Triggerred"
        
        ///  Create trigger
        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        ///  Create request
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        /// Register
        center.add(request){ (error) in }   
        
  }
}




