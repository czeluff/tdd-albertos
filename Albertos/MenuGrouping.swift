//
//  MenuGrouping.swift
//  MenuGrouping
//
//  Created by Chad Zeluff on 8/7/21.
//

import Foundation

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {    
    return Dictionary(grouping: menu, by: { $0.category })
        .map { MenuSection(category: $0, items: $1) }
        .sorted { $0.category > $1.category }
}
