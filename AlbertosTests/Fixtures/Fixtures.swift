//
//  Fixtures.swift
//  Fixtures
//
//  Created by Chad Zeluff on 8/7/21.
//

@testable import Albertos
extension MenuItem {
    static func fixture(
        category: String = "category",
        name: String = "name",
        spicy: Bool = false,
        price: Double = 0
    ) -> MenuItem {
        MenuItem(
            category: category,
            name: name,
            spicy: spicy,
            price: price
        )
    }
}

extension MenuSection {
    static func fixture(
        category: String = "category",
        items: [MenuItem] = [.fixture()]
    ) -> MenuSection {
        MenuSection(
            category: category,
            items: items
        )
    }
}
