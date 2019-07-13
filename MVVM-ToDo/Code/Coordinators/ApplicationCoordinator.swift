//
//  ApplicationCoordinator.swift
//  MVVM-ToDo
//
//  Created by Filip on 13/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol: class {
    func start()
}

protocol ApplicationCoordinatorProtocol: CoordinatorProtocol {
    init(window: UIWindow?)
}

protocol ApplicationParentCoordinatorProtocol {
    func showRootViewController(rootViewController: UIViewController)
}

final class ApplicationCoordinator: ApplicationCoordinatorProtocol {

    private weak var window: UIWindow?

     private var mainCoordinator: MainCoordinatorProtocol?

    required init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        mainCoordinator = MainCoordinator(parentCoordinator: self)
        mainCoordinator?.start()
    }
}

extension ApplicationCoordinator: ApplicationParentCoordinatorProtocol {
    func showRootViewController(rootViewController: UIViewController) {
        window?.rootViewController = rootViewController
    }
}
