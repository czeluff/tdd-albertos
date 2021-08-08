//
//  MenuFetchingPlaceholder.swift
//  MenuFetchingPlaceholder
//
//  Created by Chad Zeluff on 8/7/21.
//

import Foundation
import Combine

class MenuFetchingPlaceholder: MenuFetching {
    
    var forceFail: Bool
    
    init(forceFail:Bool = false) {
        self.forceFail = forceFail
    }
    
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        
        let value: Result<[MenuItem], Error> =
        forceFail ?
            .failure(NSError(domain: "", code: 420, userInfo: [NSLocalizedDescriptionKey: "Failed boi"])) :
            .success(menu)
        
        return Future { $0(value) }
           // Use a delay to simulate async fetch
          .delay(for: 0.5, scheduler: RunLoop.main)
          .eraseToAnyPublisher()
    }
    
}

// In this first iteration the menu is an hard-coded array
let menu = [
    MenuItem(
        category: "starters",
        name: "Caprese Salad",
        spicy: true,
        price: 10
    ),
    MenuItem(category: "starters", name: "Arancini Balls", spicy: false, price: 10),
    MenuItem(category: "pastas", name: "Penne all'Arrabbiata", spicy: false, price: 10),
    MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false, price: 10),
    MenuItem(category: "drinks", name: "Water", spicy: false, price: 10),
    MenuItem(category: "drinks", name: "Red Wine", spicy: false, price: 10),
    MenuItem(category: "desserts", name: "Tiramisù", spicy: false, price: 10),
    MenuItem(category: "desserts", name: "Crema Catalana", spicy: false, price: 10),
]

