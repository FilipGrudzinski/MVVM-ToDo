//
//  ToDoViewModel.swift
//  MVVM-ToDo
//
//  Created by Filip on 13/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation

protocol MainViewModelProtcol: class {
    var delegate: MainViewModelDelegate! { get set }
}

protocol MainViewModelDelegate: class {

}

final class MainViewModel {
    weak var delegate: MainViewModelDelegate!

    private let coordinator: MainCoordinator
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension MainViewModel: MainViewModelProtcol {

}
