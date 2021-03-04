//
//  UserDefaultsManager.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

protocol UserDefaultsManager {
    func saveLastSearchBook(with searchBook: SearchBook)
    func retrieveLastSearchBook() -> SearchBook?
    
    func saveFavoriteBookList(with books: [Book])
    func retrieveFavoriteBookList() -> [Book]?
}
