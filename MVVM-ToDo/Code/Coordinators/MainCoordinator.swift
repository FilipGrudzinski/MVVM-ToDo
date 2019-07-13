//
//  MainCoordinator.swift
//  MVVM-ToDo
//
//  Created by Filip on 13/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

protocol MainCoordinatorProtocol: CoordinatorProtocol {
    func showEditingView()
}

final class MainCoordinator: MainCoordinatorProtocol {
    private let parentCoordinator: ApplicationParentCoordinatorProtocol
    private let navigationController = UINavigationController()

    init(parentCoordinator: ApplicationParentCoordinatorProtocol) {
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let viewModel = MainViewModel(coordinator: self)
        let viewController = MainViewController(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
        parentCoordinator.showRootViewController(rootViewController: navigationController)
    }

    func showEditingView() {
        
    }
}
