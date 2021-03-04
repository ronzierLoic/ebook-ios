//
//  BookViewDataWrapperTest.swift
//  ebook-iosTests
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import XCTest
@testable import ebook_ios

class BookViewDataWrapperTest: XCTestCase {
    private let mockBookWrapperWithMultipleAuthors = BookViewDataWrapper(book: MockBook.mockBookWithMultipleAuthors)
    private let mockBookWrapperWithOneAuthors = BookViewDataWrapper(book: MockBook.mockBookWithOneAuthors)
    private let mockBookWrapperWithZeroAuthors = BookViewDataWrapper(book: MockBook.mockBookWithZeroAuthors)
    
    private let mockBookResponseWrapperWithFavorite = BookViewDataWrapper(book: MockBook.mockBookWithFavoriteTrue)
    
    private var actualBookWrapper: BookViewDataWrapper?
    private var actualAuthors: String?
    private var actualFavorite: Bool?
    
    func test_bookViewDataWrapper_should_return_authors_with_zero_author() {
        given_book_wrapper(bookWrapper: mockBookWrapperWithZeroAuthors)
        when_retrieve_authors_of_book_wrapper()
        then_authors("")
    }

    func test_bookViewDataWrapper_should_return_authors_with_one_author() {
        given_book_wrapper(bookWrapper: mockBookWrapperWithOneAuthors)
        when_retrieve_authors_of_book_wrapper()
        then_authors("J. K. Rowling")
    }
    
    func test_bookViewDataWrapper_should_return_authors_with_two_author() {
        given_book_wrapper(bookWrapper: mockBookWrapperWithMultipleAuthors)
        when_retrieve_authors_of_book_wrapper()
        then_authors("J. K. Rowling, Harry Potter, Harry Potter, Harry Potter")
    }
    
    func test_bookViewDataWrapper_toggle_favorite_already_add() {
        given_book_wrapper(bookWrapper: mockBookResponseWrapperWithFavorite)
        when_toggle_and_retrieve_favorite_of_book_wrapper()
        then_favorite(false)
    }
    
    func test_bookViewDataWrapper_toggle_favorite_not_add() {
        given_book_wrapper(bookWrapper: mockBookWrapperWithZeroAuthors)
        when_toggle_and_retrieve_favorite_of_book_wrapper()
        then_favorite(true)
    }
}

private extension BookViewDataWrapperTest {
    func given_book_wrapper(bookWrapper: BookViewDataWrapper) {
        self.actualBookWrapper = bookWrapper
    }
    
    func when_retrieve_authors_of_book_wrapper() {
        self.actualAuthors = actualBookWrapper?.authors
    }
    
    func when_toggle_and_retrieve_favorite_of_book_wrapper() {
        self.actualBookWrapper?.toggleFavorite()
        self.actualFavorite = actualBookWrapper?.isFavorite
    }
    
    func then_authors(_ expected: String) {
        XCTAssertEqual(actualAuthors, expected)
    }
    
    func then_favorite(_ expected: Bool) {
        XCTAssertEqual(actualFavorite, expected)
    }
}
