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

    func getData()
    func saveRow(at row: Int, isAble: Bool)
    func taskToShow(at row: Int) -> ToDoModel
    func close()
}

protocol TaskViewModelDelegate: class {
    func presentDescription(title: String?, description: String?)
    func isExisting(enable: Bool)
}

final class TaskViewModel {

    weak var delegate: TaskViewModelDelegate!
    
    private let coordinator: MainCoordinator
    private var datas: [ToDoModel] = []
    private var selectedRow: Int?
    private var isEnable: Bool?

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension TaskViewModel: TaskViewModelProtocol {
    func saveRow(at row: Int, isAble: Bool) {
        selectedRow = row
        isEnable = isAble
    }

    func close() {
        coordinator.close()
    }

//    func saveRow(at row: Int) {
//        selectedRow = row
//    }

    func taskToShow(at row: Int) -> ToDoModel {
        return datas[row]
    }

    func getData() {
        datas = [ToDoModel(title: "Dom", description: "dsadasdadsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdass", isDone: true),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: true)]
        guard let tempRow = selectedRow else { return }
        delegate.isExisting(enable: isEnable!)
        delegate.presentDescription(title: taskToShow(at: tempRow).title, description: taskToShow(at: tempRow).description)
    }
}
