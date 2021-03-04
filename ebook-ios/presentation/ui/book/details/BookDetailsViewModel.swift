//
//  BookDetailsViewModel.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

class BookDetailsViewModel {
    var bookWrapper: BookViewDataWrapper
    
    init(bookWrapper: BookViewDataWrapper) {
        self.bookWrapper = bookWrapper
    }
}
