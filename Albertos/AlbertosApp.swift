//
//  AlbertosApp.swift
//  Shared
//
//  Created by Chad Zeluff on 8/7/21.
//

import SwiftUI

@main
struct AlbertosApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuList(viewModel: .init(menu: menu))
                    .navigationTitle("Alberto's 🇮🇹")
            }
        }
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
