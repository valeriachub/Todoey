//
//  Category.swift
//  Todoey
//
//  Created by Valeria on 13.08.2018.
//  Copyright © 2018 Valeria. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    
    @objc dynamic var name : String = ""
    @objc dynamic var color : String = ""
    let items = List<Item>()
    
}
