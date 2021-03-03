//
//  BookRepository.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import RxSwift

class BookRepository {
    private var userDefaultsManager: UserDefaultsManager
    private var apiManager: ApiManager
    
    private var bookMapper: BookMapper
    
    init(
        userDefaultsManager: UserDefaultsManager,
        apiManager: ApiManager,
        bookMapper: BookMapper
    ) {
        self.userDefaultsManager = userDefaultsManager
        self.apiManager = apiManager
        
        self.bookMapper = bookMapper
    }
    
    func saveLastSearchBook(with searchBook: SearchBook) {
        userDefaultsManager.saveLastSearchBook(with: searchBook)
    }
    
    func retrieveLastSearchBook() -> SearchBook? {
        userDefaultsManager.retrieveLastSearchBook()
    }
    
    func retrieveBook(searchBook: SearchBook) -> Single<BookReponse> {
        apiManager.retrieveBooks(with: searchBook).map(bookMapper.transform)
    }
}
