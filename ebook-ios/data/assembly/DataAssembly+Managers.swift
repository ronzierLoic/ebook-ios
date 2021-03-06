//
//  DataAssembly+Managers.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

extension DataAssembly {
    func assembleManagers(in container: Container) {
        container.register(UserDefaultsManager.self) { _ in
            UserDefaultsManagerImpl()
        }
        .inObjectScope(.container)
        
        container.register(ApiManager.self) { _ in
            ApiManagerImpl()
        }
        .inObjectScope(.container)
    }
}
