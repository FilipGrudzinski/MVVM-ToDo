//
//  ToDoViewController.swift
//  MVVM-ToDo
//
//  Created by Filip on 13/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

final class MainViewController: BaseViewController {
    @IBOutlet private weak var toDoTableView: UITableView!
    
    private var viewModel: MainViewModelProtcol

    init(with viewModel: MainViewModelProtcol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        viewModel.getData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        toDoTableView.reloadData()
    }

    private func setup() {
        title = viewModel.texts.title
        setupTableView()
        addAddButton()
    }

    private func setupTableView() {
        toDoTableView.registerCellByNib(MainTableViewCell.self)
        toDoTableView.dataSource = self
        toDoTableView.delegate = self
        toDoTableView.separatorInset = .zero
    }

    private func addAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(_:)))
    }

    @IBAction func addAction(_ sender: UIButton) {
        viewModel.showTaskView()
    }
}

extension MainViewController: MainViewModelDelegate {
    func reloadData() {
        toDoTableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedTask(at: indexPath.row)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSourceCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.setupData(with: viewModel.task(at: indexPath))
        cell.isDoneButtonTapped =  { [weak self] in self?.viewModel.isDoneTask(at: indexPath.row) }

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        viewModel.delete(at: indexPath.row)
    }
}
