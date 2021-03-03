//
//  AppNavigator.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit

class AppNavigator: Navigator {
    enum Destination {
        case initial
    }
    
    private weak var viewControllerProvider: ViewControllerProvider?
    private weak var router: Router?
    
    init(viewControllerProvider: ViewControllerProvider, router: Router) {
        self.viewControllerProvider = viewControllerProvider
        self.router = router
    }
    
    func navigate(to destination: Destination) {
        let module = makeViewContoller(destination: destination)
        
        switch destination {
        case .initial:
            router?.setRootModule(module)
        }
    }
}

private extension AppNavigator {
    func makeViewContoller(destination: Destination) -> Presentable {
        guard let viewControllerProvider = viewControllerProvider, let router = router else {
            return UIViewController()
        }
        
        switch destination {
        case .initial:
            return viewControllerProvider.initialViewControler(router: router)
        }
    }
}
