//
//  TODOListViewController.swift
//  ToDoApp
//
//  Created by yasudamasato on 2021/12/20.
//

import UIKit

final class ToDoListViewController: UIViewController {

  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(UINib.init(nibName: ToDoItemCell.className, bundle: nil), forCellReuseIdentifier: ToDoItemCell.className)
      tableView.delegate = self
      tableView.dataSource = self
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension ToDoListViewController: UITableViewDelegate {

}

extension ToDoListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoItemCell.className) as? ToDoItemCell else {
      fatalError()
    }
    return cell
  }
}
