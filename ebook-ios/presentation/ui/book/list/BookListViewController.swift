//
//  BookListViewController.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit
import RxSwift

class BookListViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var errorLabel: UILabel!
    
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: R.nib.bookListTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.reuseIdentifier.bookListTableViewCell.identifier
        )
        
        errorLabel.isHidden = true
        errorLabel.text = R.string.localized.bookListNoResult()
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
                
                self.tableView.isHidden = self.bookListWrapper.isEmpty
                self.errorLabel.isHidden = !self.bookListWrapper.isEmpty
            })
            .disposed(by: disposeBag)
        
        viewModel
            .error
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.tableView.isHidden = true
                self.errorLabel.isHidden = false
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - TableView Delgate & DataSource
extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
