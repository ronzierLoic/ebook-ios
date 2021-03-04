//
//  MockBook.swift
//  ebook-iosTests
//
//  Created by Loic RONZIER on 04/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

@testable import ebook_ios

enum MockBook {
    static let mockBookWithMultipleAuthors = Book(
        id: "adz23flo",
        volumeInfo: VolumeInformation(
            title: "Harry Potter",
            authors: ["J. K. Rowling", "Harry Potter", "Harry Potter", "Harry Potter"],
            pageCount: 300,
            image: nil,
            description: "Description du livre"
        )
    )
    
    static let mockBookWithOneAuthors = Book(
        id: "adz23flo",
        volumeInfo: VolumeInformation(
            title: "Harry Potter",
            authors: ["J. K. Rowling"],
            pageCount: 300,
            image: nil,
            description: "Description du livre"
        )
    )
    
    static let mockBookWithZeroAuthors = Book(
        id: "adz23flo",
        volumeInfo: VolumeInformation(
            title: "Harry Potter",
            authors: [],
            pageCount: 300,
            image: nil,
            description: "Description du livre"
        )
    )
    
    static let mockBookWithFavoriteTrue = Book(
        id: "adz23flo",
        volumeInfo: VolumeInformation(
            title: "Harry Potter",
            authors: ["J. K. Rowling"],
            pageCount: 300,
            image: nil,
            description: "Description du livre"
        ),
        isFavorite: true
    )
}
