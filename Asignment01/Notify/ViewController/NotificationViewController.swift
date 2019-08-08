//
//  NotificationViewController.swift
//  Asignment01
//
//  Created by Mamatha S on 22/07/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit
import Foundation
import UserNotifications

/// NotificationView class is used to schedule local notifications 
class NotificationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateBell()
    }
    
    /// This Function is used to animate bell
   private func animateBell() {
        UIView.animate(withDuration: 0.1, delay: 1.0, animations: {
            ///imageTop outlet is declared in notify view..To access in notificationview controller viewname.function or variable name 
             (self.view as? NotifyView)?.imageTop.transform = CGAffineTransform(rotationAngle: CGFloat((-5.0 * Double.pi) / 180.0))
        }) { (finish) in
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options: [.autoreverse, .repeat], animations: {
                /// Set how many times to repeat the animation
                UIView.setAnimationRepeatCount(4)
                /// Rotate to the right
                (self.view as? NotifyView)?.imageTop.transform = CGAffineTransform(rotationAngle: CGFloat((5.0 * Double.pi) / 180.0))
            }, completion: { (_) in
                
                UIView.animate(withDuration: 0.1, animations: {
                (self.view as? NotifyView)?.imageTop.transform = CGAffineTransform.identity
                })
            })
        }
    }

}


    

