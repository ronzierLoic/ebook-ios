//
//  BookReponseRemoteEntity.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

struct BookReponseRemoteEntity: Codable {
    let totalItems: Int
    let items: [BookRemoteEntity]
}
