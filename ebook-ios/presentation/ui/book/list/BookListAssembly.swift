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
        container.register(BookListNavigator.self) { (_: Resolver, viewControllerProvider: ViewControllerProvider, router: Router) in
            BookListNavigator(viewControllerProvider: viewControllerProvider, router: router)
        }

        container.register(BookListViewModel.self) { (resolver: Resolver, searchBook: SearchBook) in
            BookListViewModel(
                searchBook: searchBook,
                bookRepository: resolver.forceResolve(BookRepository.self)
            )
        }

        container.register(BookListViewController.self) { (resolver: Resolver, searchBook: SearchBook, viewControllerProvider: ViewControllerProvider, router: Router) in
            BookListViewController.makeViewController(
                viewModel: resolver.forceResolve(BookListViewModel.self, argument: searchBook),
                navigator: resolver.forceResolve(BookListNavigator.self, arguments: viewControllerProvider, router)
            )
        }
    }
}
