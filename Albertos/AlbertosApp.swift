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
                MenuList(viewModel: .init(menuFetching: MenuFetchingPlaceholder()))
                    .navigationTitle("Alberto's 🇮🇹")
            }
        }
    }
}
