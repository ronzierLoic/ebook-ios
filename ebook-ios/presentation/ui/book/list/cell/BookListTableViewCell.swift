//
//  BookListTableViewCell.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit
import Kingfisher

class BookListTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var bookImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var bookmarkContaineView: UIView!
    @IBOutlet private weak var bookmarkImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.isHighlighted = false
        self.selectionStyle = .none
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setup(bookWrapper: BookViewDataWrapper) {
        bookImageView.kf.setImage(with: bookWrapper.imageUrl, placeholder: R.image.book())
        titleLabel.text = bookWrapper.title
        authorLabel.text = bookWrapper.authors
        descriptionLabel.text = bookWrapper.description
    }
}

// MARK: - Private extension
private extension BookListTableViewCell {
    func setupUI() {
        containerView.applyCornerRadius(withRadius: BookListTableViewCellValues.CELL_CORNER_RADIUS)
        containerView.layer.borderWidth = BookListTableViewCellValues.CELL_BORDER_RADIUS
        containerView.layer.borderColor = R.color.primary()?.cgColor
        
        bookmarkContaineView.applyCircleRender()
    }
}
