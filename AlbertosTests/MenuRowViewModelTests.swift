//
//  MenuRowViewModelTests.swift
//  MenuRowViewModelTests
//
//  Created by Chad Zeluff on 8/7/21.
//

@testable import Albertos
import XCTest

class MenuRowViewModelTests: XCTestCase {

    func testWhenItemIsNotSpicyTextIsItemNameOnly() {
        let item = MenuItem.fixture(name: "name", spicy: false)
        let viewModel = MenuRow.ViewModel(item: item)
        XCTAssertEqual(viewModel.text, "name")
    }
    
    func testWhenItemIsSpicyTextIsItemNameWithChiliEmoji() {
        let item = MenuItem.fixture(name: "name", spicy: true)
        let viewModel = MenuRow.ViewModel(item: item)
        XCTAssertEqual(viewModel.text, "name 🌶")
    }

}
