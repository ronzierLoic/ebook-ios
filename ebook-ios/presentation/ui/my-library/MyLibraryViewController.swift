//
//  MyLibraryViewController.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit
import RxSwift

class MyLibraryViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: - Properties
    private var navigator: MyLibraryNavigator!
    private var viewModel: MyLibraryViewModel!

    private var disposeBag = DisposeBag()
    private var bookListWrapper: [BookViewDataWrapper] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localized.myLibraryTitleController()
        setupUI()
        loadViewModel()
    }
}

// MARK: - Private function
private extension MyLibraryViewController {
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: R.nib.bookListTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.reuseIdentifier.bookListTableViewCell.identifier
        )
        
        errorLabel.isHidden = true
        errorLabel.text = R.string.localized.myLibraryNoFavori()
    }
    
    func loadViewModel() {
        guard let favoriteBook = viewModel.retrieveFavoriteBooks() else {
            tableView.isHidden = true
            errorLabel.isHidden = false
            return
        }

        bookListWrapper = favoriteBook
    }
}

// MARK: - TableView Delgate & DataSource
extension MyLibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.isHidden = bookListWrapper.isEmpty
        errorLabel.isHidden = !bookListWrapper.isEmpty
        
        return bookListWrapper.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.bookListTableViewCell, for: indexPath) else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.setup(bookWrapper: bookListWrapper[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigator.navigate(to: .bookDetails(bookWrapper: bookListWrapper[indexPath.row]))
    }
}

// MARK: - BookListTableViewDelagate
extension MyLibraryViewController: BookListTableViewCellDelegate {
    func bookmarkDidClick(bookWrapper: BookViewDataWrapper) {
        viewModel.removeFavoriteBook(bookWrapper: bookWrapper)
        bookListWrapper.removeAll(where: { $0.id == bookWrapper.id })
        tableView.reloadData()
    }
}

// MARK: - Internal Extension
extension MyLibraryViewController {
    static func makeViewController(
        viewModel: MyLibraryViewModel,
        navigator: MyLibraryNavigator
    ) -> MyLibraryViewController {
        guard let viewController = R.storyboard.myLibrary.myLibraryViewController() else {
            preconditionFailure()
        }
    
        viewController.navigator = navigator
        viewController.viewModel = viewModel
        
        return viewController
    }
}
