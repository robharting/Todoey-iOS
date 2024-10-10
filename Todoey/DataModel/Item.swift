//
//  Item.swift
//  Todoey
//
//  Created by Harting, R.P.G. (Rob) on 10/10/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic  var done: Bool = false
    // define the inverse relationsship
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
