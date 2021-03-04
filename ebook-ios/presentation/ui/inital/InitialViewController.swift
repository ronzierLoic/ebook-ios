//
//  InitialViewController.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var titleBookLabel: UILabel!
    @IBOutlet private weak var titleBookTextField: UITextField!
    @IBOutlet private weak var authorBookLabel: UILabel!
    @IBOutlet private weak var authorTextField: UITextField!
    @IBOutlet private weak var searchBookButton: UIButton!
    @IBOutlet private weak var myLibraryButton: UIButton!
    @IBOutlet private weak var myLibraryBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bookImageVie: UIImageView!
    
    // MARK: - Properties
    private var navigator: InitialNavigator!
    private var viewModel: InitialViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localized.initialTitleController()
        setupUI()
        hideKeyboardWhenTappedAround()
    }
}

// MARK: - Private function
private extension InitialViewController {
    func setupUI() {
        titleLabel.text = R.string.localized.initialTitle()
        titleBookLabel.text = R.string.localized.initialBookTitle()
        authorBookLabel.text = R.string.localized.initialBookAuthor()
        searchBookButton.setTitle(R.string.localized.initialSearchButton().uppercased(), for: .normal)
        myLibraryButton.setTitle(R.string.localized.initialMyLibraryButton().uppercased(), for: .normal)
        
        searchBookButton.applyCornerRadius(withRadius: InitialViewControllerValues.BUTTON_CORNER_RADIUS)
        myLibraryButton.applyCornerRadius(withRadius: InitialViewControllerValues.BUTTON_CORNER_RADIUS)
        
        bookImageVie.isHidden = !(view.frame.size.height - (myLibraryButton.frame.size.height + myLibraryButton.frame.origin.y) > InitialViewControllerValues.MINIMUM_SPACE_FOR_SHOW_IMAGE)
    }
}

// MARK: - Internal Extension
extension InitialViewController {
    static func makeViewController(
        viewModel: InitialViewModel,
        navigator: InitialNavigator
    ) -> InitialViewController {
        guard let viewController = R.storyboard.initialViewController.initialViewController() else {
            preconditionFailure()
        }
    
        viewController.navigator = navigator
        viewController.viewModel = viewModel
        
        return viewController
    }
}
