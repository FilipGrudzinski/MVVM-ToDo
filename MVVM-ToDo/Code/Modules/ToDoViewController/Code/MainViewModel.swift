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
    var texts: MainViewModel.Texts { get }
    var dataSourceCount: Int { get }

    func getData()
    func task(at indexPath: IndexPath) -> ToDoModel
    func isDoneTask(at indexPath: IndexPath)
    func showTaskView()
}

protocol MainViewModelDelegate: class {
    func reloadData()
}

final class MainViewModel {
    struct Texts {
        let title = "To Do App"
    }
    weak var delegate: MainViewModelDelegate!
    private var data: [ToDoModel] = []

    private let coordinator: MainCoordinator
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension MainViewModel: MainViewModelProtcol {
    func isDoneTask(at indexPath: IndexPath) {
        var model = task(at: indexPath)
        model.isDone.toggle()
        data[indexPath.row] = model
        delegate.reloadData()
    }

    func task(at indexPath: IndexPath) -> ToDoModel {
        return data[indexPath.row]
    }

    func showTaskView() {
        coordinator.showTaskView()
    }

    var dataSourceCount: Int {
        return data.count
    }

    func getData() {
        data = [ToDoModel(title: "Dom", description: "dsadasdadsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdass", isDone: true),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: true)]
    }

    var texts: MainViewModel.Texts {
        return Texts()
    }
}
