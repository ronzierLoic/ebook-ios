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
    func initialViewControler() -> Presentable {
        let assembler = Assembler([InitialAssembly()], container: sharedContainer)
        return assembler.resolver.forceResolve(InitialViewController.self)
    }
}
