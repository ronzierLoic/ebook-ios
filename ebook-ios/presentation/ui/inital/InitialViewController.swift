//
//  InitialViewController.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    // MARK: - Outlets

    // MARK: - Properties
    private var navigator: InitialNavigator!
    private var viewModel: InitialViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ebook"
    }
}

// MARK: - Internal Extension
extension InitialViewController {
    static func makeViewController(
        viewModel: InitialViewModel,
        navigator: InitialNavigator
    ) -> InitialViewController {
        guard let viewController = R.storyboard.initialViewController.initialViewController() else {
            preconditionFailure()
        }
    
        viewController.navigator = navigator
        viewController.viewModel = viewModel
        
        return viewController
    }
}
