//
//  Single+Extension.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import RxSwift
import Moya
import Alamofire

extension PrimitiveSequence where Trait == SingleTrait, Element: Response {
    func errorInterceptor(reachabilityManager: NetworkReachabilityManager?) -> Single<Element> {
        guard let reachabilityManager = reachabilityManager else { return self }
        
        guard reachabilityManager.isReachable else {
            return .error(ApiError.noNetwork)
        }
        
        return self
    }
}
