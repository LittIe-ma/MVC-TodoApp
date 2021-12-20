//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by yasudamasato on 2021/12/20.
//

import Foundation
import RealmSwift

struct Items {
  var items: [RealmData]?
}

class RealmData {
  @objc dynamic var text: String?
}
