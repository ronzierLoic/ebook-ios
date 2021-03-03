//
//  InitialViewController.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit
import RxSwift

class InitialViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var titleBookLabel: UILabel!
    @IBOutlet private weak var titleBookTextField: UITextField!
    @IBOutlet private weak var authorBookLabel: UILabel!
    @IBOutlet private weak var authorBookTextField: UITextField!
    @IBOutlet private weak var searchBookButton: UIButton!
    @IBOutlet private weak var myLibraryButton: UIButton!
    @IBOutlet private weak var myLibraryBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bookImageVie: UIImageView!
    
    // MARK: - Properties
    private var navigator: InitialNavigator!
    private var viewModel: InitialViewModel!
    
    private var disposeBag = DisposeBag()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localized.initialTitleController()
        setupUI()
        bindViewModel()
        hideKeyboardWhenTappedAround()
    }
}

// MARK: - Private action
private extension InitialViewController {
    @IBAction func searchBookButtonTapped(_ sender: Any) {
        viewModel.saveLastSearchBook(title: titleBookTextField.text, author: authorBookTextField.text)
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
        
        let lastSearchBook = viewModel.retrieveLastSearchBook()
        titleBookTextField.text = lastSearchBook?.title
        authorBookTextField.text = lastSearchBook?.author
        
        titleBookTextField.delegate = self
        authorBookTextField.delegate = self
    }
    
    func bindViewModel() {
        viewModel
            .error
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                
                if self.titleBookTextField.text?.isEmpty ?? true {
                    self.titleBookTextField.backgroundColor = R.color.redError()
                    self.titleBookTextField.shakeError()
                }
                
                if self.authorBookTextField.text?.isEmpty ?? true {
                    self.authorBookTextField.backgroundColor = R.color.redError()
                    self.authorBookTextField.shakeError()
                }
            })
            .disposed(by: disposeBag)
        
        viewModel
            .navigateToBookList
            .subscribe(onNext: { [weak self] searchBook in
                guard let self = self else { return }
                self.navigator.navigate(to: .bookList(searchBook: searchBook))
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - UITextFieldDelegate
extension InitialViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.backgroundColor = R.color.lightGray()
        return true
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
