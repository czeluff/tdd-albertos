//
//  MenuList.swift
//  MenuList
//
//  Created by Chad Zeluff on 8/7/21.
//

import SwiftUI

struct MenuList: View {
    let viewModel: ViewModel

    var body: some View {
        List {
            ForEach(viewModel.sections) { section in
                Section(header: Text(section.category)) {
                    ForEach(section.items) { item in
                        MenuRow(viewModel: .init(item: item))
                    }
                }
            }
        }
    }
    
    struct ViewModel {
        typealias MenuItemGrouper = ([MenuItem]) -> [MenuSection]
        let sections: [MenuSection]
        init(
            menu: [MenuItem],
            menuGrouping: @escaping MenuItemGrouper = groupMenuByCategory
        ) {
            self.sections = menuGrouping(menu)
        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MenuList(viewModel: .init(menu: menu))
            MenuList(viewModel: .init(menu: menu))
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
