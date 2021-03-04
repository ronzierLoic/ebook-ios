//
//  InitialAssembly.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

class InitialAssembly: Assembly {
    func assemble(container: Container) {
        container.register(InitialNavigator.self) { (_: Resolver, viewControllerProvider: ViewControllerProvider, router: Router) in
            InitialNavigator(viewControllerProvider: viewControllerProvider, router: router)
        }
        
        container.register(InitialViewModel.self) { resolver in
            InitialViewModel(bookRepository: resolver.forceResolve(BookRepository.self))
        }
        
        container.register(InitialViewController.self) { (resolver: Resolver, viewControllerProvider: ViewControllerProvider, router: Router) in
            InitialViewController.makeViewController(
                viewModel: resolver.forceResolve(InitialViewModel.self),
                navigator: resolver.forceResolve(InitialNavigator.self, arguments: viewControllerProvider, router)
            )
        }
    }
}
