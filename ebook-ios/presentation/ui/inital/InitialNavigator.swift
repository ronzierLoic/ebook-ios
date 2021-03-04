//
//  InitialNavigator.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit

class InitialNavigator: Navigator {
    enum Destination {
        case bookList(searchBook: SearchBook)
        case myLibrary
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
        case .bookList, .myLibrary:
            router.push(controller)
        }
    }
}

private extension InitialNavigator {
    func makeViewContoller(destination: Destination) -> Presentable {
        guard let viewControllerProvider = viewControllerProvider else { return UIViewController() }
        
        switch destination {
        case .bookList(let searchBook):
            return viewControllerProvider.bookListViewController(searchBook: searchBook)
        case .myLibrary:
            return viewControllerProvider.myLibraryViewController()
        }
    }
}
