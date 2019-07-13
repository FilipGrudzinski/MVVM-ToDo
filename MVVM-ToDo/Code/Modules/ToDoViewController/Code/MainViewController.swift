//
//  ToDoViewController.swift
//  MVVM-ToDo
//
//  Created by Filip on 13/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

final class MainViewController: BaseViewController {
    @IBOutlet weak var toDoTableView: UITableView!
    
    private var viewModel: MainViewModelProtcol

    init(with vieModel: MainViewModelProtcol) {
        self.viewModel = vieModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: MainViewModelDelegate {

}
