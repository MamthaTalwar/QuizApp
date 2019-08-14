//
//  RealmModelData .swift
//  Asignment01
//
//  Created by Mamatha S on 02/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import Foundation
import RealmSwift

/// Realm Model Data
class Contact: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var number: String = ""
}
