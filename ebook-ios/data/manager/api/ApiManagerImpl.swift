//
//  ApiManagerImpl.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Moya
import Alamofire
import RxMoya
import RxSwift

class ApiManagerImpl {
    private let NETWORK_REACHABILITY_HOST = "8.8.8.8"
    
    private var apiProvider: MoyaProvider<ApiService>
    private var reachabilityManager: NetworkReachabilityManager?
    
    init() {
        self.apiProvider = MoyaProvider<ApiService>(plugins: [NetworkLoggerPlugin()])
        self.reachabilityManager = NetworkReachabilityManager(host: NETWORK_REACHABILITY_HOST)
    }
}

extension ApiManagerImpl: ApiManager {
    func retrieveBooks(with searchBook: SearchBook) -> Single<BookReponseRemoteEntity> {
        apiProvider
            .rx
            .request(ApiService.getBooks(searchBook: searchBook))
            .errorInterceptor(reachabilityManager: reachabilityManager)
            .map(BookReponseRemoteEntity.self)
    }
}
