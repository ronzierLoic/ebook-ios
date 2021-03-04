//
//  BookResponseViewDataWrapper.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

class BookResponseViewDataWrapper {
    private let bookResponse: BookReponse
    
    init(bookResponse: BookReponse) {
        self.bookResponse = bookResponse
    }
    
    var title: String {
        R.string.localized.bookListTitleController(bookResponse.totalBooks)
    }
    
    var bookList: [BookViewDataWrapper] {
        bookResponse.bookList.map(BookViewDataWrapper.init)
    }
}
