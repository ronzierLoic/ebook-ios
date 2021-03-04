//
//  MyLibraryViewModel.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

class MyLibraryViewModel {
    private var bookRepository: BookRepository
    
    init(bookRepository: BookRepository) {
        self.bookRepository = bookRepository
    }
    
    func retrieveFavoriteBooks() -> [BookViewDataWrapper]? {
        bookRepository.retrieveFavoriteBook().map({ $0.map(BookViewDataWrapper.init) })
    }
    
    func removeFavoriteBook(bookWrapper: BookViewDataWrapper) {
        bookRepository.removeFavoriteBook(book: bookWrapper.book)
    }
}

