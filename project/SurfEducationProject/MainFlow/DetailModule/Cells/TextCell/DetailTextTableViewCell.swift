//
//  DetailTextTableViewCell.swift
//  SurfEducationProject
//
//  Created by Владислав Климов on 05.08.2022.
//

import UIKit

class DetailTextTableViewCell: UITableViewCell {

    // MARK: - Views

    @IBOutlet private weak var contentLabel: UILabel!

    // MARK: - Properties

    var text: String? {
        didSet {
            contentLabel.text = text
        }
    }

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    private func configureAppearance() {
        selectionStyle = .none
        contentLabel.font = .systemFont(ofSize: 12, weight: .light)
        contentLabel.textColor = .black
        contentLabel.numberOfLines = 0
    }
}
