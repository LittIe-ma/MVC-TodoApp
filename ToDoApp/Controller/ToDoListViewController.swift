//
//  TODOListViewController.swift
//  ToDoApp
//
//  Created by yasudamasato on 2021/12/20.
//

import UIKit
import RealmSwift

final class ToDoListViewController: UIViewController {

  @IBOutlet private weak var todoTextField: UITextField! {
    didSet {
      todoTextField.delegate = self
    }
  }
  @IBOutlet private weak var addButton: UIButton! {
    didSet {
      addButton.addTarget(self, action: #selector(didTapAddButton(_sender:)), for: .touchUpInside)
    }
  }
  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(UINib.init(nibName: ToDoItemCell.className, bundle: nil), forCellReuseIdentifier: ToDoItemCell.className)
      tableView.delegate = self
      tableView.dataSource = self
    }
  }
  private let realm = try! Realm()
  private var todo: Results<TodoData>!

  override func viewDidLoad() {
    super.viewDidLoad()
    todo = realm.objects(TodoData.self)
    print(Realm.Configuration.defaultConfiguration.fileURL!)
  }

  @objc private func didTapAddButton(_sender: UIResponder) {
    guard !(todoTextField.text ?? "").isEmpty else { return }
    let todo = TodoData()
    todo.text = todoTextField.text
    RealmOperate.shared.add(todo)
    todoTextField.text = ""
    tableView.reloadData()
  }
}

extension ToDoListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
}

extension ToDoListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    RealmOperate.shared.numberOfItems()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoItemCell.className) as? ToDoItemCell else {
      fatalError()
    }
    cell.configure(item: todo[indexPath.row])
    return cell
  }
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      RealmOperate.shared.delete(todo[indexPath.row])
      tableView.deleteRows(at: [indexPath], with: .automatic)
      tableView.reloadData()
    }
  }
}

extension ToDoListViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    todoTextField.resignFirstResponder()
    return true
  }
}
