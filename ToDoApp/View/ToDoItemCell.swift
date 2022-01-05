//
//  TODOItemCell.swift
//  ToDoApp
//
//  Created by yasudamasato on 2021/12/20.
//

import UIKit

final class ToDoItemCell: UITableViewCell {

  static var className: String { String(describing: ToDoItemCell.self) }

  @IBOutlet private weak var todoTextLabel: UILabel!

  override func prepareForReuse() {
    super.prepareForReuse()
    todoTextLabel.text = nil
  }

  func configure(item: TodoData) {
    todoTextLabel.text = item.text
  }
}
