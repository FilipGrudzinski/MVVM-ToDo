//
//  TaskViewController.swift
//  MVVM-ToDo
//
//  Created by Filip on 14/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

final class TaskViewController: BaseViewController {
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var descriptionTextView: UITextView!

    private var viewModel: TaskViewModelProtocol

    init(with viewModel: TaskViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        viewModel.getData()
    }



    private func addEditButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction(_:)))
        descriptionTextView.isEditable = false
    }

    private func addSaveButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveEditionButtonAction(_:)))
        descriptionTextView.isEditable = true
    }

    private func setupView() {
        addSaveButton()
        descriptionTextView.text = ""
    }

    @IBAction func saveEditionButtonAction(_ sender: Any) {
        addEditButton()
        //viewModel.close()
    }

    @IBAction func editAction(_ sender: UIButton) {
        addSaveButton()
    }
}

extension TaskViewController: TaskViewModelDelegate {
    func isExisting(enable: Bool) {
        enable == true ? addEditButton() : addSaveButton()
    }


    func presentDescription(title: String?, description: String?) {
        self.title = title
        descriptionTextView.text = description
        titleTextField.placeholder = title
    }

    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }
}
