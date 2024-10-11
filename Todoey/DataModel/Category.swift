//
//  Category.swift
//  Todoey
//
//  Created by Harting, R.P.G. (Rob) on 10/10/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

// Object comes from realm
class Category: Object {
    @objc dynamic var name: String = ""
    // forward relationship
    let items = List<Item>()
    
}
