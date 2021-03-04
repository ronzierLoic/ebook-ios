//
//  BookResponseViewDataWrapperTest.swift
//  ebook-iosTests
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import XCTest
@testable import ebook_ios

class BookResponseViewDataWrapperTest: XCTestCase {
    private let mockEmptyBookResponseWrapper = BookResponseViewDataWrapper(
        bookResponse: MockBookResponse.mockEmptyBookResponse
    )
    
    private let mockOneBookResponseWrapper = BookResponseViewDataWrapper(
        bookResponse: MockBookResponse.mockOneBookResponse
    )
    
    private var actualBookResponseWrapper: BookResponseViewDataWrapper?
    private var actualTitle: String?

    func test_bookResponseViewDataWrapper_should_return_title_with_zero_book() {
        given_book_response(bookReponseWrapper: mockEmptyBookResponseWrapper)
        when_retrieve_title_of_book_response()
        then_title_is_valid("Résultat de la recherche (0)")
    }
    
    func test_bookResponseViewDataWrapper_should_return_title_with_one_book() {
        given_book_response(bookReponseWrapper: mockOneBookResponseWrapper)
        when_retrieve_title_of_book_response()
        then_title_is_valid("Résultat de la recherche (1)")
    }
}

private extension BookResponseViewDataWrapperTest {
    func given_book_response(bookReponseWrapper: BookResponseViewDataWrapper) {
        self.actualBookResponseWrapper = bookReponseWrapper
    }
    
    func when_retrieve_title_of_book_response() {
        self.actualTitle = actualBookResponseWrapper?.title
    }
    
    func then_title_is_valid(_ expected: String) {
        XCTAssertEqual(actualTitle, expected)
    }
}
