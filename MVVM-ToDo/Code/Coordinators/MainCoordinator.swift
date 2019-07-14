//
//  MainCoordinator.swift
//  MVVM-ToDo
//
//  Created by Filip on 13/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

protocol MainCoordinatorProtocol: CoordinatorProtocol {
    func showTaskView()
}

final class MainCoordinator: MainCoordinatorProtocol {
    private let parentCoordinator: ApplicationParentCoordinatorProtocol
    private let navigationController = ToDoNavigationController()

    init(parentCoordinator: ApplicationParentCoordinatorProtocol) {
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let viewModel = MainViewModel(coordinator: self)
        let viewController = MainViewController(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
        parentCoordinator.showRootViewController(rootViewController: navigationController)
    }

    func showTaskView() {
        let viewModel = TaskViewModel(coordinator: self)
        let viewController = TaskViewController(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)

    }
}
