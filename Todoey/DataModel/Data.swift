//
//  data.swift
//  Todoey
//
//  Created by Harting, R.P.G. (Rob) on 09/10/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var age: Int = 0
}
