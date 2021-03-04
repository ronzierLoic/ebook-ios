//
//  ObserverType.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import RxSwift

extension ObserverType where Element == Void {
    public func onNext() {
        onNext(())
    }
}
