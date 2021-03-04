//
//  BookMapper.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

class BookMapper {
    // BookReponse
    func transform(_ source: BookReponseRemoteEntity) -> BookReponse {
        BookReponse(
            totalBooks: source.totalItems,
            bookList: transform(source.items)
        )
    }
    
    // Book
    func transform(_ source: BookRemoteEntity) -> Book {
        Book(
            id: source.id,
            volumeInfo: transform(source.volumeInfo)
        )
    }
    
    func transform(_ source: [BookRemoteEntity]) -> [Book] {
        source.map(transform)
    }
    
    // VolumeInformation
    func transform(_ source: VolumeInformationRemoteEntity) -> VolumeInformation {
        VolumeInformation(
            title: source.title,
            authors: source.authors,
            pageCount: source.pageCount,
            image: source.imageLinks?.thumbnail,
            description: source.description
        )
    }
}
