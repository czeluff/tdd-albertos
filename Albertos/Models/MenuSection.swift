//
//  MenuSection.swift
//  MenuSection
//
//  Created by Chad Zeluff on 8/7/21.
//

import Foundation

struct MenuSection {
    let category: String
    let items: [MenuItem]
}

extension MenuSection: Identifiable {
    var id: String { category }
}

extension MenuSection: Equatable {}
