//
//  MyLibraryNavigator.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

class MyLibraryNavigator: Navigator {
    enum Destination {
        case bookDetails(bookWrapper: BookViewDataWrapper)
    }
    
    private weak var viewControllerProvider: ViewControllerProvider?
    private var router: Router
    
    init(viewControllerProvider: ViewControllerProvider, router: Router) {
        self.viewControllerProvider = viewControllerProvider
        self.router = router
    }

    func navigate(to destination: Destination) {
        let controller = makeViewContoller(destination: destination)
        switch destination {
        case .bookDetails:
            router.present(controller)
        }
    }
}

private extension MyLibraryNavigator {
    func makeViewContoller(destination: Destination) -> Presentable {
        guard let viewControllerProvider = viewControllerProvider else { return UIViewController() }
        
        switch destination {
        case .bookDetails(let bookWrapper):
            return viewControllerProvider.bookDetailsViewController(bookWrapper: bookWrapper)
        }
    }
}
