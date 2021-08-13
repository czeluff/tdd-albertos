//
//  PublisherStub.swift
//  PublisherStub
//
//  Created by Chad Zeluff on 8/12/21.
//

import Foundation
import Combine

class PublisherStub<T, U: Error> {
    
    let _result: Result<T, U>
    
    init(returning result: Result<T, U>) {
        self._result = result
    }
    
    func producePublisher() -> AnyPublisher<T, U> {
        _result.publisher
            .delay(for: 0.0, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
