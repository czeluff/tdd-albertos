//
//  MenuRow.swift
//  MenuRow
//
//  Created by Chad Zeluff on 8/7/21.
//

import SwiftUI

struct MenuRow: View {
    let viewModel: ViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.text)
        }
    }
    
    struct ViewModel {
        let text: String
        init(
            item: MenuItem
        ) {
            text = item.spicy ? "\(item.name) 🌶" : item.name
        }
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(viewModel: .init(item: menu[0]))
    }
}
