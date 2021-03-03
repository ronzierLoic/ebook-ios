//
//  UserDefaultsManagerImpl.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Foundation

class UserDefaultsManagerImpl: UserDefaultsManager {
    private enum UserDefaultsKeys {
        static let LAST_SEARCH_BOOK: String = "LAST_SEARCH_BOOK"
    }
    
    func saveLastSearchBook(with searchBook: SearchBook) {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(searchBook)
        UserDefaults.standard.set(data, forKey: UserDefaultsKeys.LAST_SEARCH_BOOK)
    }
    
    func retrieveLastSearchBook() -> SearchBook? {
        guard let data = UserDefaults.standard.data(forKey: UserDefaultsKeys.LAST_SEARCH_BOOK) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(SearchBook.self, from: data)
    }
}
