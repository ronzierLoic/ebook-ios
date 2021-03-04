//
//  DataAssembly+Repositories.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

extension DataAssembly {
    func assembleRepositories(in container: Container) {
        container.register(BookRepository.self) { resolver in
            BookRepository(userDefaultsManager: resolver.forceResolve(UserDefaultsManager.self))
        }
        .inObjectScope(.container)
    }
}
