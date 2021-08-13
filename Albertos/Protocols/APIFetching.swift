//
//  APIFetching.swift
//  APIFetching
//
//  Created by Chad Zeluff on 8/7/21.
//

import Combine

protocol MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error>
}

protocol DishOfDayFetching {
    func fetchDishOfDay() -> AnyPublisher<MenuItem, Error>
}
