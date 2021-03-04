//
//  BookListViewModel.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import RxSwift

class BookListViewModel {
    private var searchBook: SearchBook
    private var bookRepository: BookRepository
    
    // MARK: DisposeBags
    private var bookDisposeBag = DisposeBag()
    
    // MARK: Outputs
    var bookResponse: PublishSubject<BookResponseViewDataWrapper> = PublishSubject()
    var error: PublishSubject<Void> = PublishSubject()
    
    init(searchBook: SearchBook, bookRepository: BookRepository) {
        self.searchBook = searchBook
        self.bookRepository = bookRepository
    }
    
    func retrieveBook() {
        bookRepository.retrieveBook(searchBook: searchBook)
            .map(BookResponseViewDataWrapper.init)
            .subscribe(onSuccess: { [weak self] bookResponseWrapper in
                self?.bookResponse.onNext(bookResponseWrapper)
            }, onError: { [weak self] _ in
                self?.error.onNext()
            })
            .disposed(by: bookDisposeBag)
    }
    
    func favoriteBookTapped(bookWrapper: BookViewDataWrapper) {
        switch bookWrapper.isFavorite {
        case true:
            bookRepository.addFavoriteBook(book: bookWrapper.book)
        case false:
            bookRepository.removeFavoriteBook(book: bookWrapper.book)
        }
    }
}
