//
//  Item.swift
//  Todoey
//
//  Created by Kenji Fukuda on 2018/11/04.
//  Copyright © 2018年 Kenji Fukuda. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    // each Item has a inverse relationship to its parent Category
    // destination of the link is Category.self
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
