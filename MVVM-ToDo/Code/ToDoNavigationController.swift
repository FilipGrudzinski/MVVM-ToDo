//
//  ToDoNavigationController.swift
//  MVVM-ToDo
//
//  Created by Filip on 14/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

final class  ToDoNavigationController: UINavigationController {
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        topViewController?.navigationItem.backBarButtonItem = backButton
        navigationBar.barTintColor = UIColor(red: 0.2784, green: 0.5725, blue: 0.8275, alpha: 1.0)
        navigationBar.tintColor = .black
    }
}
