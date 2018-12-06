//
//  Category.swift
//  Todoey
//
//  Created by Kenji Fukuda on 2018/11/04.
//  Copyright © 2018年 Kenji Fukuda. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    // dynamic keyoword can monitor the change of the name value during run time
    @objc dynamic var name: String = ""
    // Category has items which points to Item object = define forward relationship
    // List is the container type in Realm used to define to-many relationships.
    let items = List<Item>()
}
