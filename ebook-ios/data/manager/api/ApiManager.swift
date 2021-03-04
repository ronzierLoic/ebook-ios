//
//  ApiManager.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import RxSwift

protocol ApiManager {
    func retrieveBooks(with searchBook: SearchBook) -> Single<BookReponseRemoteEntity>
}
