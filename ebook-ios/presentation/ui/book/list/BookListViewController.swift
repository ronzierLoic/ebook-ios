//
//  BookListViewController.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit
import RxSwift

class BookListViewController: UITableViewController {
    // MARK: - Outlets

    // MARK: - Properties
    private var navigator: BookListNavigator!
    private var viewModel: BookListViewModel!

    private var disposeBag = DisposeBag()
    private var bookListWrapper: [BookViewDataWrapper] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localized.bookListTitleController(0)
        setupUI()
        bindViewModel()
        loadViewModel()
    }
}

// MARK: - Private function
private extension BookListViewController {
    func setupUI() {
        tableView.register(
            UINib(nibName: R.nib.bookListTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.reuseIdentifier.bookListTableViewCell.identifier
        )
    }
    
    func loadViewModel() {
        viewModel.retrieveBook()
    }
    
    func bindViewModel() {
        viewModel
            .bookResponse
            .subscribe(onNext: { [weak self] bookResponseWrapper in
                guard let self = self else { return }
                self.title = bookResponseWrapper.title
                self.bookListWrapper = bookResponseWrapper.bookList
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - TableView Delgate & DataSource
extension BookListViewController {
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
extension BookListViewController: BookListTableViewCellDelegate {
    func bookmarkDidClick(bookWrapper: BookViewDataWrapper) {
        bookListWrapper.forEach({
            if $0.id == bookWrapper.id {
                $0.toggleFavorite()
                viewModel.favoriteBookTapped(bookWrapper: $0)
            }
        })
        
        tableView.reloadData()
    }
}

// MARK: - Internal Extension
extension BookListViewController {
    static func makeViewController(
        viewModel: BookListViewModel,
        navigator: BookListNavigator
    ) -> BookListViewController {
        guard let viewController = R.storyboard.bookList.bookListViewController() else {
            preconditionFailure()
        }
    
        viewController.navigator = navigator
        viewController.viewModel = viewModel
        
        return viewController
    }
}
