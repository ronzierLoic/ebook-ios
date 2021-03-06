//
//  ViewControllerProvider.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit
import Swinject

class ViewControllerProvider {
    private let presentationAssembly: PresentationAssembly
    private let dataAssembly: DataAssembly
    
    private let sharedContainer: Container
    
    init(presentationAssembly: PresentationAssembly, dataAssembly: DataAssembly) {
        self.presentationAssembly = presentationAssembly
        self.dataAssembly = dataAssembly
        
        sharedContainer = Container()
        self.presentationAssembly.assemble(container: sharedContainer)
        self.dataAssembly.assemble(container: sharedContainer)
    }
}

extension ViewControllerProvider {
    func initialViewControler(router: Router) -> Presentable {
        let assembler = Assembler([InitialAssembly()], container: sharedContainer)
        return assembler.resolver.forceResolve(InitialViewController.self, arguments: self, router)
    }
    
    func bookListViewController(searchBook: SearchBook, router: Router) -> Presentable {
        let assembler = Assembler([BookListAssembly()], container: sharedContainer)
        return assembler.resolver.forceResolve(BookListViewController.self, arguments: searchBook, self, router)
    }
    
    func myLibraryViewController(router: Router) -> Presentable {
        let assembler = Assembler([MyLibraryAssembly()], container: sharedContainer)
        return assembler.resolver.forceResolve(MyLibraryViewController.self, arguments: self, router)
    }
    
    func bookDetailsViewController(bookWrapper: BookViewDataWrapper) -> Presentable {
        let navigationController = UINavigationController()
        let router: Router = RouterImpl(rootController: navigationController)
       
        let assembler = Assembler([BookDetailsAssembly()], container: sharedContainer)
        let controller = assembler.resolver.forceResolve(BookDetailsViewController.self, arguments: bookWrapper, router)
        
        router.setRootModule(controller)
        
        return router
    }
}
