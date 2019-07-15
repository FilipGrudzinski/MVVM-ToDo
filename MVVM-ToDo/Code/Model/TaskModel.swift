//
//  TaskModel.swift
//  MVVM-ToDo
//
//  Created by Filip on 15/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation
import RealmSwift

final class TaskModel: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var taskDescription: String = ""
    @objc dynamic var isDone: Bool = false
}
