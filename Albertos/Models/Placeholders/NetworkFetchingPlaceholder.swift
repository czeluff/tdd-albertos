//
//  NetworkFetchingPlaceholder.swift
//  NetworkFetchingPlaceholder
//
//  Created by Chad Zeluff on 8/13/21.
//

import Foundation
import Combine

class NetworkFetchingPlaceholder: NetworkFetching {
    
    let _result: Result<Data, URLError>
    
    init(returning result: Result<Data, URLError>) {
        self._result = result
    }
    
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        _result
            .publisher
            .delay(for: 0.0, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
