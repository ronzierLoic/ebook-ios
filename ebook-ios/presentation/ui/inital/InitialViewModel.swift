//
//  InitialViewModel.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit
import RxSwift

class InitialViewModel {
    private var bookRepository: BookRepository
    
    // MARK: Outputs
    var error: PublishSubject<Void> = PublishSubject()
    var navigateToBookList: PublishSubject<SearchBook> = PublishSubject()
    
    init(bookRepository: BookRepository) {
        self.bookRepository = bookRepository
    }
    
    func saveLastSearchBook(title: String?, author: String?) {
        guard let title = title,
              let author = author else {
            error.onNext()
            return
        }
        
        guard !title.isEmpty || !author.isEmpty else {
            error.onNext()
            return
        }
        
        let searchBook = SearchBook(title: title, author: author)
        bookRepository.saveLastSearchBook(with: searchBook)
        navigateToBookList.onNext(searchBook)
    }
    
    func retrieveLastSearchBook() -> SearchBook? {
        bookRepository.retrieveLastSearchBook()
    }
}
