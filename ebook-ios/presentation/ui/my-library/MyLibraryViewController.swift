//
//  MyLibraryViewController.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit
import RxSwift

class MyLibraryViewController: UITableViewController {
    // MARK: - Outlets

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
        tableView.register(
            UINib(nibName: R.nib.bookListTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.reuseIdentifier.bookListTableViewCell.identifier
        )
    }
    
    func loadViewModel() {
        guard let favoriteBook = viewModel.retrieveFavoriteBooks() else {
            // TODO: Handle nil
            return
        }
        
        bookListWrapper = favoriteBook
    }
}

// MARK: - TableView Delgate & DataSource
extension MyLibraryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookListWrapper.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.bookListTableViewCell, for: indexPath) else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.setup(bookWrapper: bookListWrapper[indexPath.row])
        
        return cell
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
