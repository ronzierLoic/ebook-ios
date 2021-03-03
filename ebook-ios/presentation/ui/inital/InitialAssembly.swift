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
        container.register(InitialNavigator.self) { _ in
            InitialNavigator()
        }
        
        container.register(InitialViewModel.self) { _ in
            InitialViewModel()
        }
        
        container.register(InitialViewController.self) { _ in
            InitialViewController.makeViewController(
                viewModel: container.forceResolve(InitialViewModel.self),
                navigator: container.forceResolve(InitialNavigator.self)
            )
        }
    }
}
