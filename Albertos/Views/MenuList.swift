//
//  MenuList.swift
//  MenuList
//
//  Created by Chad Zeluff on 8/7/21.
//

import SwiftUI
import Combine

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    return Dictionary(grouping: menu, by: { $0.category })
        .map { MenuSection(category: $0, items: $1) }
        .sorted { $0.category > $1.category }
}

struct MenuList: View {
    @ObservedObject var viewModel: ViewModel

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
    
    class ViewModel: ObservableObject {
        @Published private(set) var sections: [MenuSection] = []
        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping MenuItemGrouper = groupMenuByCategory
        ) {
            menuFetching
                .fetchMenu()
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { [weak self] in self?.sections = menuGrouping($0) }
                )
                .store(in: &cancellables)
        }
        
        typealias MenuItemGrouper = ([MenuItem]) -> [MenuSection]
        private var cancellables = Set<AnyCancellable>()
    }
}
