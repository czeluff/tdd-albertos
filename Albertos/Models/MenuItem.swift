//
//  MenuItem.swift
//  MenuItem
//
//  Created by Chad Zeluff on 8/7/21.
//

import Foundation

struct MenuItem {
    let category: String
    let name: String
    let spicy: Bool
    let price: Double
}

extension MenuItem: Identifiable {
    var id: String { name }
}

extension MenuItem: Equatable {}
