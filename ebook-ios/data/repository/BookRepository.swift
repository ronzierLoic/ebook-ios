//
//  BookRepository.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

class BookRepository {
    private var userDefaultsManager: UserDefaultsManager
    
    init(userDefaultsManager: UserDefaultsManager) {
        self.userDefaultsManager = userDefaultsManager
    }
    
    func saveLastSearchBook(with searchBook: SearchBook) {
        userDefaultsManager.saveLastSearchBook(with: searchBook)
    }
    
    func retrieveLastSearchBook() -> SearchBook? {
        userDefaultsManager.retrieveLastSearchBook()
    }
}
