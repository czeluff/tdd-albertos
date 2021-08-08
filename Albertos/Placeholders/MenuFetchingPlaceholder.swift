//
//  MenuFetchingPlaceholder.swift
//  MenuFetchingPlaceholder
//
//  Created by Chad Zeluff on 8/7/21.
//

import Foundation
import Combine

class MenuFetchingPlaceholder: MenuFetching {
    
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        return Future { $0(.success(menu)) }
           // Use a delay to simulate async fetch
          .delay(for: 0.5, scheduler: RunLoop.main)
          .eraseToAnyPublisher()
    }
    
}
