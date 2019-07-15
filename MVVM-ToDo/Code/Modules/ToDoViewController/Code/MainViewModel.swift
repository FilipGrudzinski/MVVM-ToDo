//
//  ToDoViewModel.swift
//  MVVM-ToDo
//
//  Created by Filip on 13/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation
import RealmSwift

protocol MainViewModelProtcol: class {
    var delegate: MainViewModelDelegate! { get set }
    var texts: MainViewModel.Texts { get }
    var dataSourceCount: Int { get }

    func getData()
    func selectedTask(at row: Int)
    func isDoneTask(at row: Int)
    func task(at indexPath: IndexPath) -> TaskModel
    func delete(at row: Int)
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

    let realm = try! Realm()
    var toDoTasks: Results<TaskModel>?

    private let coordinator: MainCoordinator
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension MainViewModel: MainViewModelProtcol {
    func selectedTask(at row: Int) {
        coordinator.showTaskView(taskRow: row)
    }

    func delete(at row: Int) {
        guard let task = toDoTasks?[row] else { return }
        do {
            try self.realm.write {
                self.realm.delete(task)
            }
        } catch {
            print(error)
        }
        //data.remove(at: row)
        delegate.reloadData()
    }

    func isDoneTask(at row: Int) {
        guard let task = toDoTasks?[row] else { return }
            do {
                try realm.write {
                    task.isDone = !task.isDone
                }
            } catch {
                print(error)
            }
            delegate.reloadData()
    }

    func task(at indexPath: IndexPath) -> TaskModel {
        return (toDoTasks?[indexPath.row])!
    }

    func showTaskView() {
        coordinator.showTaskView()
    }

    var dataSourceCount: Int {
        return toDoTasks!.count
    }

    func getData() {
        let model = TaskModel()
        model.title = "Dome"
        model.descr = "dadsadsadasdasd"

        try! realm.write {
            realm.add(model)
        }

        toDoTasks = realm.objects(TaskModel.self)

        //data = [ToDoModel(title: "Dom", description: "dsadasdadsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdasdsadasdass", isDone: true),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: false),ToDoModel(title: "Dom", description: "dsadasdas", isDone: true)]
    }

    var texts: MainViewModel.Texts {
        return Texts()
    }
}
