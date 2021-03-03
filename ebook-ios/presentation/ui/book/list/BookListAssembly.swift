//
//  BookListAssembly.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Swinject

class BookListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BookListNavigator.self) { _ in
            BookListNavigator()
        }

        container.register(BookListViewModel.self) { _ in
            BookListViewModel()
        }

        container.register(BookListViewController.self) { resolver in
            BookListViewController.makeViewController(
                viewModel: resolver.forceResolve(BookListViewModel.self),
                navigator: resolver.forceResolve(BookListNavigator.self)
            )
        }
    }
}
