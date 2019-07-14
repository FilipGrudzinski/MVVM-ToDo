//
//  TaskViewModel.swift
//  MVVM-ToDo
//
//  Created by Filip on 14/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation

protocol TaskViewModelProtocol: class {
    var delegate: TaskViewModelDelegate! { get set }
}

protocol TaskViewModelDelegate: class {
}

final class TaskViewModel {

    weak var delegate: TaskViewModelDelegate!
    
    private let coordinator: MainCoordinator

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension TaskViewModel: TaskViewModelProtocol {
    
}
