//
//  URLSession+NetworkFetching.swift
//  URLSession+NetworkFetching
//
//  Created by Chad Zeluff on 8/12/21.
//

import Foundation
import Combine

extension URLSession: NetworkFetching {
    
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        dataTaskPublisher(for: request)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
    
}
