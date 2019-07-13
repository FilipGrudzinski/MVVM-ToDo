//
//  ToDoModel.swift
//  MVVM-ToDo
//
//  Created by Filip on 14/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation

struct ToDoModel {
    let title: String
    let description: String
    var isDone: Bool

    init(title: String, description: String, isDone: Bool) {
        self.title = title
        self.description = description
        self.isDone = isDone
    }
}
