//
//  BookDetailsViewController.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var bookImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    private var navigator: BookDetailsNavigator!
    private var viewModel: BookDetailsViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImageView.kf.setImage(with: viewModel.bookWrapper.imageUrl, placeholder: R.image.book())
        titleLabel.text = viewModel.bookWrapper.title
        authorLabel.text = viewModel.bookWrapper.authors
        descriptionLabel.text = viewModel.bookWrapper.description
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: R.string.localized.bookDetailsCloseButton(), style: .done, target: self, action: #selector(closeTapped))
    }
    
    @objc func closeTapped() {
        navigator.navigate(to: .close)
    }
}

// MARK: - Internal Extension
extension BookDetailsViewController {
    static func makeViewController(
        viewModel: BookDetailsViewModel,
        navigator: BookDetailsNavigator
    ) -> BookDetailsViewController {
        guard let viewController = R.storyboard.bookDetails.bookDetailsViewController() else {
            preconditionFailure()
        }
    
        viewController.navigator = navigator
        viewController.viewModel = viewModel
        
        return viewController
    }
}
