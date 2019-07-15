//
//  MainTableViewCell.swift
//  MVVM-ToDo
//
//  Created by Filip on 14/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet weak var isDoneButton: UIButton!

    private enum Constant {
        static let titleSize: CGFloat = 14.0
        static let descriptionSize: CGFloat = 12.0
    }

    var isDoneButtonTapped: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    @IBAction private func isDoneButtonAction(_ sender: Any) {
        isDoneButtonTapped?()
    }

    private func setup() {
        isDoneButton.setImage(UIImage(named: "done"), for: .normal)
        titleLabel.font = .systemFont(ofSize: Constant.titleSize, weight: .bold)
        descriptionLabel.font = .systemFont(ofSize: Constant.descriptionSize, weight: .regular)
    }

    func setupData(with model: TaskModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.descr
        isDoneButton.tintColor = model.isDone ? .red : .lightGray
    }
}
