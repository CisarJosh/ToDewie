//
//  Category.swift
//  ToDewie
//
//  Created by Holiday Twin Drive-In on 1/29/18.
//  Copyright © 2018 Josh. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
