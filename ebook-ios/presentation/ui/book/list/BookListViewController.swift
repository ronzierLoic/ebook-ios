//
//  BookListViewController.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

class BookListViewController: UITableViewController {
    // MARK: - Outlets

    // MARK: - Properties
    private var navigator: BookListNavigator!
    private var viewModel: BookListViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localized.bookListTitleController()
        setupUI()
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
}

// MARK: - TableView Delgate & DataSource
extension BookListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Remove next branch
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.bookListTableViewCell, for: indexPath) else {
            return UITableViewCell()
        }
        
        return cell
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
