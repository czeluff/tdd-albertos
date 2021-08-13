//
//  NetworkFetching.swift
//  NetworkFetching
//
//  Created by Chad Zeluff on 8/12/21.
//

import Foundation
import Combine

protocol NetworkFetching {
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError>
}
