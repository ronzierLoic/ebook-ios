//
//  BookDetailsNavigator.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

class BookDetailsNavigator: Navigator {
    enum Destination {
        case close
    }
    
    private var router: Router
    
    init(router: Router) {
        self.router = router
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .close:
            router.dismissModule()
        }
    }
}
