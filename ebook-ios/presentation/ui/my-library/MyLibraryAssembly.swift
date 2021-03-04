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
        container.register(MyLibraryNavigator.self) { _ in
            MyLibraryNavigator()
        }

        container.register(MyLibraryViewModel.self) { resolver in
            MyLibraryViewModel(bookRepository: resolver.forceResolve(BookRepository.self))
        }

        container.register(MyLibraryViewController.self) { resolver in
            MyLibraryViewController.makeViewController(
                viewModel: resolver.forceResolve(MyLibraryViewModel.self),
                navigator: resolver.forceResolve(MyLibraryNavigator.self)
            )
        }
    }
}
