//
//  MockBookResponse.swift
//  ebook-iosTests
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

@testable import ebook_ios

enum MockBookResponse {
    static let mockEmptyBookResponse = BookReponse(
        totalBooks: 0,
        bookList: []
    )
    
    static let mockOneBookResponse = BookReponse(
        totalBooks: 1,
        bookList: [
            MockBook.mockBookWithZeroAuthors
        ]
    )

}
