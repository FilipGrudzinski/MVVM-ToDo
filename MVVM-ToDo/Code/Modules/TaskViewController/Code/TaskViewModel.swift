//
//  TaskViewModel.swift
//  MVVM-ToDo
//
//  Created by Filip on 14/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation
import RealmSwift

protocol TaskViewModelProtocol: class {
    var delegate: TaskViewModelDelegate! { get set }
    var texts: TaskViewModel.Texts { get }

    func getData()
    func takeRow(at row: Int, isAble: Bool)
    func saveTask(title: String, description: String)
    func savingTask(task: TaskModel)
    func close()
}

protocol TaskViewModelDelegate: class {
    func presentDescription(title: String?, description: String?)
    func isExisting(enable: Bool)
}

final class TaskViewModel {
    private enum Contants {
        static let nul: Int = 0
        static let one: Int = 1
    }

    struct Texts {
        let title = "New Task"
    }
    
    weak var delegate: TaskViewModelDelegate!
    
    private let coordinator: MainCoordinator
    let realm = try! Realm()
    var toDoTasks: Results<TaskModel>?
    private var taskCount: Int = Contants.nul
    
    private var selectedRow: Int?
    private var isEnable: Bool?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension TaskViewModel: TaskViewModelProtocol {
    var texts: TaskViewModel.Texts {
        return Texts()
    }

    func saveTask(title: String, description: String) {
        let newTask = TaskModel()
        title.isEmpty ? (newTask.title = "Task \(taskCount)") : (newTask.title = title)
        description == "Enter own task" ? (newTask.taskDescription = "") : (newTask.taskDescription = description)
        savingTask(task: newTask)
    }
    
    func savingTask(task: TaskModel) {
        try! realm.write {
            realm.add(task)
        }
    }
    
    func getData() {
        taskCount = realm.objects(TaskModel.self).count + Contants.one
        guard let tempRow = selectedRow else { return }
        toDoTasks = realm.objects(TaskModel.self)
        delegate.isExisting(enable: isEnable!)
        delegate.presentDescription(title: toDoTasks?[tempRow].title, description: toDoTasks?[tempRow].taskDescription)
    }
    
    func takeRow(at row: Int, isAble: Bool) {
        selectedRow = row
        isEnable = isAble
    }
    
    func close() {
        coordinator.close()
    }
}
