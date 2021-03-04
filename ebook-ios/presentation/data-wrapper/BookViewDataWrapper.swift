//
//  BookViewDataWrapper.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

class BookViewDataWrapper {
    var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var id: String {
        book.id
    }
    
    var title: String {
        book.volumeInfo.title
    }
    
    var authors: String? {
        guard let authors = book.volumeInfo.authors else { return nil }
        return authors.joined(separator: ", ")
    }
    
    var description: String? {
        book.volumeInfo.description
    }
    
    var imageUrl: URL? {
        guard let urlString = book.volumeInfo.image else { return nil }
        
        return URL(string: urlString)
    }
    
    var isFavorite: Bool {
        book.isFavorite
    }
    
    func toggleFavorite() {
        book.isFavorite.toggle()
    }
}
