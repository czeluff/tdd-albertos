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
        switch viewModel.sections {
        case .success(let sections):
            List {
                ForEach(sections) { section in
                    Section(header: Text(section.category)) {
                        ForEach(section.items) { item in
                            MenuRow(viewModel: .init(item: item))
                        }
                    }
                }
            }
        case .failure(let error):
            VStack {
                Text("An error occured:")
                Text(error.localizedDescription)
                    .italic()
            }
        }
    }
    
    class ViewModel: ObservableObject {
        @Published private(set) var sections: Result<[MenuSection], Error> = .success([])
        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping MenuItemGrouper = groupMenuByCategory
        ) {
            menuFetching
                .fetchMenu()
                .map(menuGrouping)
                .sink(
                    receiveCompletion: { [weak self] completion in
                        guard case .failure(let error) = completion else { return }
                        self?.sections = .failure(error)
                    },
                    receiveValue: { [weak self] value in
                        self?.sections = .success(value) }
                )
                .store(in: &cancellables)
        }
        
        private var cancellables = Set<AnyCancellable>()
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(viewModel: .init(menuFetching: MenuFetchingPlaceholder(forceFail: false)))
    }
}
