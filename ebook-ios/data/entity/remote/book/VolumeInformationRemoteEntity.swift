//
//  VolumeInformationRemoteEntity.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

struct VolumeInformationRemoteEntity: Codable {
    let title: String
    let authors: [String]?
    let pageCount: Int?
    let imageLinks: ImageLinkRemoteEntity?
    let description: String?
}
