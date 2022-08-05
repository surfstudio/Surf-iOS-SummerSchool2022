//
//  DetailTitleTableViewCell.swift
//  SurfEducationProject
//
//  Created by Владислав Климов on 05.08.2022.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell {

    // MARK: - Views

    @IBOutlet private weak var cartTitleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    // MARK: - Properties

    var title: String = "" {
        didSet {
            cartTitleLabel.text = title
        }
    }

    var date: String = "" {
        didSet {
            dateLabel.text = date
        }
    }

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    private func configureAppearance() {
        selectionStyle = .none
        cartTitleLabel.font = .systemFont(ofSize: 16)
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = UIColor(displayP3Red: 0xB3 / 255, green: 0xB3 / 255, blue: 0xB3 / 255, alpha: 1)
    }
}
