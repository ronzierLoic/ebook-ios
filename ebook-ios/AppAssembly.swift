//
//  AppAssembly.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

class AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppNavigator.self) { (_, viewControllerProvider: ViewControllerProvider, router: Router) in
            AppNavigator(viewControllerProvider: viewControllerProvider, router: router)
        }
    }
}
