//
//  Router.swift
//  ToDoApp
//
//  Created by yasudamasato on 2021/12/20.
//

import UIKit

final class Router {

  static let shared = Router()
  private init() {}

  private var window: UIWindow?

  func showRoot(window: UIWindow) {
    guard let vc = UIStoryboard.init(name: "ToDoList", bundle: nil).instantiateInitialViewController() else {
      return
    }
    let nav = UINavigationController(rootViewController: vc)
    window.rootViewController = nav
    window.makeKeyAndVisible()
    self.window = window
  }
}
