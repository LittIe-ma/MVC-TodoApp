//
//  Realm.swift
//  ToDoApp
//
//  Created by yasudamasato on 2021/12/20.
//

import RealmSwift

final class RealmOperate {
  static let shared = RealmOperate()
  private init() {}

  private let realm = try! Realm()

  func numberOfItems() -> Int {
    realm.objects(TodoData.self).count
  }

  func add(_ text: TodoData) {
    try! realm.write { realm.add(text) }
  }

  func delete(_ text: TodoData) {
    try! realm.write { realm.delete(text) }
  }

  func deleteAll() {
    try! realm.write { realm.deleteAll() }
  }

  func update(index: Int, text: String) {
    let todo: Results<TodoData> = realm.objects(TodoData.self)
    try! realm.write { todo[index].text = text }
  }
}

