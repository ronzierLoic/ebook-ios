//
//  BookViewDataWrapper.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

class BookViewDataWrapper {
    private let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var title: String {
        book.volumeInfo.title
    }
    
    var authors: String? {
        guard let authors = book.volumeInfo.authors else { return nil }
        var authorsString = authors.joined(separator: ", ")
        if authors.count > 1 {
            authorsString = String(authorsString.dropLast())
        }
        return authorsString
    }
    
    var description: String? {
        book.volumeInfo.description
    }
    
    var imageUrl: URL? {
        guard let urlString = book.volumeInfo.image else { return nil }
        
        return URL(string: urlString)
    }
}
