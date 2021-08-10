//
//  XCTestCase+JSON.swift
//  XCTestCase+JSON
//
//  Created by Chad Zeluff on 8/9/21.
//

import XCTest

extension XCTestCase {
    
    func dataFromJSONFileNamed(_ name: String) throws -> Data {
        let url = try XCTUnwrap(
            Bundle(for: type(of: self)).url(forResource: name, withExtension: "json")
        )
        return try Data(contentsOf: url)
    }
    
}
