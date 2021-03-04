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
        apiManager
            .retrieveBooks(with: searchBook)
            .map(bookMapper.transform)
            .map(addFavoriteInBookResponse)
    }
    
    func addFavoriteBook(book: Book) {
        if var favoriteBook = userDefaultsManager.retrieveFavoriteBookList() {
            if !favoriteBook.contains(where: { $0.id == book.id }) {
                favoriteBook.append(book)
                userDefaultsManager.saveFavoriteBookList(with: favoriteBook)
            }
        } else {
            userDefaultsManager.saveFavoriteBookList(with: [book])
        }
    }
    
    func removeFavoriteBook(book: Book) {
        guard var favoriteBook = userDefaultsManager.retrieveFavoriteBookList() else { return }
        
        favoriteBook.removeAll(where: { $0.id == book.id })
        userDefaultsManager.saveFavoriteBookList(with: favoriteBook)
    }
    
    func retrieveFavoriteBook() -> [Book]? {
        userDefaultsManager.retrieveFavoriteBookList()
    }
}

private extension BookRepository {
    func addFavoriteInBookResponse(bookResponse: BookReponse) -> BookReponse {
        guard let favoriteBook = userDefaultsManager.retrieveFavoriteBookList() else { return bookResponse }
        
        var bookResponseWithFavorite = bookResponse
        
        bookResponseWithFavorite.bookList = bookResponseWithFavorite
            .bookList
            .map({ book -> Book in
                var bookWithFavorite = book
                if favoriteBook.contains(where: { $0.id == book.id }) {
                    bookWithFavorite.isFavorite = true
                }
                return bookWithFavorite
            })
        
        return bookResponseWithFavorite
    }
}
