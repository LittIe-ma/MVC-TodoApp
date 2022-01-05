//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by yasudamasato on 2021/12/20.
//

import Foundation
import RealmSwift

final class TodoData: Object {
  @objc dynamic var text: String?
}
