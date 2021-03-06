//
//  Navigator.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

protocol Navigator {
    associatedtype Destination

    func navigate(to destination: Destination)
}
