//
//  ApiServiceValues.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Moya
import Foundation

private enum ApiServiceValues {
    static let baseUrl = "https://www.googleapis.com/books/v1"
    
    static let volumesPath = "/volumes"
    
    static let qKey = "q"
    static let authorKey = "+inauthor:%@"
}

struct ApiService: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: ApiServiceValues.baseUrl)!
    }
    
    var path: String
    var method: Moya.Method
    var sampleData: Data
    var task: Task
    var headers: [String: String]?
    private(set) var validationType: ValidationType
    private(set) var authorizationType: AuthorizationType?
    
    init(
        path: String = "",
        method: Moya.Method = .get,
        task: Task = .requestPlain,
        validationType: ValidationType = .successAndRedirectCodes,
        sampleJsonString: String = "",
        headers: [String: String]? = nil,
        authorizationType: AuthorizationType = .bearer
    ) {
        self.path = path
        self.method = method
        self.sampleData = Data(sampleJsonString.utf8)
        self.task = task
        self.validationType = validationType
        self.headers = headers
        self.authorizationType = authorizationType
    }
}

extension ApiService {
    /// Retrieve books
    /// - HTTP Method: GET
    /// - Response: BookResponseRemoteEntity
    static func getBooks(searchBook: SearchBook) -> ApiService {
        var params: [String: Any] = [:]
        
        var qValues = ""
        
        if !searchBook.title.isEmpty {
            qValues += searchBook.title
        }
        
        if !searchBook.author.isEmpty {
            qValues += String(format: ApiServiceValues.authorKey, searchBook.author)
        }
        
        params[ApiServiceValues.qKey] = qValues
        
        return ApiService(
            path: ApiServiceValues.volumesPath,
            method: .get,
            task: .requestParameters(parameters: params, encoding: URLEncoding.default)
        )
    }
}
