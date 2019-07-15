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

    let realm = try! Realm()
    var toDoTasks: Results<TaskModel>?

    private let coordinator: MainCoordinator
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension MainViewModel: MainViewModelProtcol {
    var texts: MainViewModel.Texts {
        return Texts()
    }

    var dataSourceCount: Int {
        return toDoTasks!.count
    }

    func getData() {
        toDoTasks = realm.objects(TaskModel.self)
    }

    func task(at indexPath: IndexPath) -> TaskModel {
        return (toDoTasks?[indexPath.row])!
    }

    func selectedTask(at row: Int) {
        coordinator.showTaskView(taskRow: row)
    }

    func showTaskView() {
        coordinator.showTaskView()
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
}
