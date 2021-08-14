//
//  PlaceholderData.swift
//  PlaceholderData
//
//  Created by Chad Zeluff on 8/13/21.
//

import Foundation

struct PlaceholderData {
    
    static var menu: [MenuItem] {
        [
            MenuItem(category: "starters", name: "Caprese Salad", spicy: true, price: 10),
            MenuItem(category: "starters", name: "Arancini Balls", spicy: false, price: 10),
            MenuItem(category: "pastas", name: "Penne all'Arrabbiata", spicy: false, price: 10),
            MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false, price: 10),
            MenuItem(category: "drinks", name: "Water", spicy: false, price: 10),
            MenuItem(category: "drinks", name: "Red Wine", spicy: false, price: 10),
            MenuItem(category: "desserts", name: "Tiramisù", spicy: false, price: 10),
            MenuItem(category: "desserts", name: "Crema Catalana", spicy: false, price: 10),
        ]
    }
    
    static var dishOfDay: MenuItem {
        MenuItem(category: "desserts", name: "Chef's Chocolate Salty Balls", spicy: true, price: 10)
    }
    
    static var encodedMenu: Data {
        try! JSONEncoder()
            .encode(menu)
    }
    
    static var encodedDishOfDay: Data {
        try! JSONEncoder()
            .encode(dishOfDay)
    }
}
