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
    
    init(bookRepository: BookRepository) {
        self.bookRepository = bookRepository
    }
    
    func saveLastSearchBook(title: String?, author: String?) {
        guard let title = title,
              !title.isEmpty,
              let author = author,
              !author.isEmpty else {
            error.onNext()
            return
        }
        
        bookRepository.saveLastSearchBook(with: SearchBook(title: title, author: author))
    }
    
    func retrieveLastSearchBook() -> SearchBook? {
        bookRepository.retrieveLastSearchBook()
    }
}
