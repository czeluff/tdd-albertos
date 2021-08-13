//
//  MenuItemTests.swift
//  MenuItemTests
//
//  Created by Chad Zeluff on 8/9/21.
//

@testable import Albertos
import XCTest
class MenuItemTests: XCTestCase {
    
    // This is probably all you ever want to do with JSON Decoding validation, is test to ensure that decoding didn't throw
    
    func testWhenDecodingFromJSONFileDoesNotThrow() throws {
        let data = try dataFromJSONFileNamed("menu_item")
        XCTAssertNoThrow(try JSONDecoder().decode(MenuItem.self, from: data))
    }
    
    func testWhenDecodingFromJSONDataDoesNotThrow() throws {
        let json = #"{ "name": "a name", "category": "a category", "spicy": true, "price": 10 }"#
        let data = try XCTUnwrap(json.data(using: .utf8))
        XCTAssertNoThrow(try JSONDecoder().decode(MenuItem.self, from: data))
    }
    
    // These verify data after decoding, but do you ever really need that?
    
    func testWhenDecodedFromJSONDataHasAllTheInputProperties() throws {
        let json = #"{ "name": "a name", "category": "a category", "spicy": true, "price": 10 }"#
        let data = try XCTUnwrap(json.data(using: .utf8))
        let item = try JSONDecoder()
            .decode(MenuItem.self, from: data)
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, true)
        XCTAssertEqual(item.price, 10.0)
    }
    
    func testDecodesFromJSONFile() throws {
        let data = try dataFromJSONFileNamed("menu_item")
        let item = try JSONDecoder().decode(MenuItem.self, from: data)
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, true)
        XCTAssertEqual(item.price, 10.0)
    }
}
