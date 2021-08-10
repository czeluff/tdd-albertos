//
//  MenuFetchingStub.swift
//  MenuFetchingStub
//
//  Created by Chad Zeluff on 8/8/21.
//

@testable import Albertos
import Foundation
import Combine

class MenuFetchingStub: MenuFetching {
    
    let result: Result<[MenuItem], Error>
    
    init(returning result: Result<[MenuItem], Error>) {
        self.result = result
    }
    
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        return result.publisher
            .delay(for: 0.1, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
