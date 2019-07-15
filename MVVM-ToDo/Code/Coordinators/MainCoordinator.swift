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
    func showTaskView(taskRow: Int)
    func close()
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

    func showTaskView(taskRow: Int) {
        let viewModel = TaskViewModel(coordinator: self)
        viewModel.takeRow(at: taskRow, isAble: true)
        let viewController = TaskViewController(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

    func close() {
        guard let vc = navigationController.viewControllers.first(where: { $0 is MainViewController }) else {
            navigationController.popToRootViewController(animated: true)
            return
        }
        navigationController.popToViewController(vc, animated: true)
    }
}
