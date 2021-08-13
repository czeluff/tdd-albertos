//
//  MenuFetchingStub.swift
//  MenuFetchingStub
//
//  Created by Chad Zeluff on 8/8/21.
//

@testable import Albertos
import Foundation
import Combine

extension MenuFetching where Self: PublisherStub<[MenuItem], Error> {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        producePublisher()
    }
}

extension DishOfDayFetching where Self: PublisherStub<MenuItem, Error> {
    func fetchDishOfDay() -> AnyPublisher<MenuItem, Error> {
        producePublisher()
    }
}

extension NetworkFetching where Self: PublisherStub<Data, URLError> {
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        producePublisher()
    }
}

class MenuFetchingStub: PublisherStub<[MenuItem], Error>, MenuFetching {}
class DishOfDayFetchingStub: PublisherStub<MenuItem, Error>, DishOfDayFetching {}
class NetworkFetchingStub: PublisherStub<Data, URLError>, NetworkFetching {}

