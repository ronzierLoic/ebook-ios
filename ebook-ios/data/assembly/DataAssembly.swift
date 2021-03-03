//
//  DataAssembly.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

class DataAssembly: Assembly {
    func assemble(container: Container) {
        assembleManagers(in: container)
        assembleRepositories(in: container)
        assembleMappers(in: container)
    }
}
