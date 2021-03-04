//
//  MyLibraryAssembly.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Swinject

class MyLibraryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MyLibraryNavigator.self) { (_: Resolver, viewControllerProvider: ViewControllerProvider, router: Router) in
            MyLibraryNavigator(viewControllerProvider: viewControllerProvider, router: router)
        }

        container.register(MyLibraryViewModel.self) { resolver in
            MyLibraryViewModel(bookRepository: resolver.forceResolve(BookRepository.self))
        }

        container.register(MyLibraryViewController.self) { (resolver: Resolver, viewControllerProvider: ViewControllerProvider, router: Router) in
            MyLibraryViewController.makeViewController(
                viewModel: resolver.forceResolve(MyLibraryViewModel.self),
                navigator: resolver.forceResolve(MyLibraryNavigator.self, arguments: viewControllerProvider, router)
            )
        }
    }
}
