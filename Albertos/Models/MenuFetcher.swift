//
//  MenuFetcher.swift
//  MenuFetcher
//
//  Created by Chad Zeluff on 8/12/21.
//

import Foundation
import Combine

class MenuFetcher: MenuFetching, DishOfDayFetching {
    
    private let _networkFetcher: NetworkFetching
    
    init(networkFetcher: NetworkFetching = URLSession.shared) {
        self._networkFetcher = networkFetcher
    }
    
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        _networkFetcher
            .load(URLRequest(url: URL(string: "https://s3.amazonaws.com/mokacoding/menu_response.json")!))
            .decode(type: [MenuItem].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchDishOfDay() -> AnyPublisher<MenuItem, Error> {
        _networkFetcher
            .load(URLRequest(url: URL(string: "https://raw.githubusercontent.com/mokagio/tddinswift_fake_api/trunk/dish_of_the_day.json")!))
            .decode(type: MenuItem.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
