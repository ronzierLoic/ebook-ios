//
//  BookDetailsAssembly.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Swinject

class BookDetailsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BookDetailsNavigator.self) { (_: Resolver, router: Router) in
            BookDetailsNavigator(router: router)
        }

        container.register(BookDetailsViewModel.self) { (_: Resolver, bookWrapper: BookViewDataWrapper) in
            BookDetailsViewModel(bookWrapper: bookWrapper)
        }

        container.register(BookDetailsViewController.self) { (resolver: Resolver, bookWrapper: BookViewDataWrapper, router: Router) in
            BookDetailsViewController.makeViewController(
                viewModel: resolver.forceResolve(BookDetailsViewModel.self, argument: bookWrapper),
                navigator: resolver.forceResolve(BookDetailsNavigator.self, argument: router)
            )
        }
    }
}
