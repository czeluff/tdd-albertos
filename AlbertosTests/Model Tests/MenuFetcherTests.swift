//
//  MenuFetcherTests.swift
//  MenuFetcherTests
//
//  Created by Chad Zeluff on 8/12/21.
//

@testable import Albertos
import XCTest
import Combine

class MenuFetcherTests: XCTestCase {
    
    func testMenuRequestSucceedsAndDecodes() throws {
        let json = """
        [
            { "name": "a name", "category": "a category", "spicy": true, "price": 10 },
            { "name": "another name", "category": "a category", "spicy": true, "price": 10 }
        ]
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let menuFetcher = MenuFetcher(networkFetcher: NetworkFetchingStub(returning: .success(data)))
        let expectation = XCTestExpectation(description: "Publishes decoded [MenuItem]")
        requestSucceedHelper(publisher: menuFetcher.fetchMenu()) { items in
            XCTAssertEqual(items.count, 2)
            XCTAssertEqual(items.first?.name, "a name")
            XCTAssertEqual(items.last?.name, "another name")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testDishOfDayRequestSucceedsAndDecodes() throws {
        let json = #"{ "name": "Spaghetti Carbonara", "category": "pastas", "spicy": false, "price": 7.5 }"#
        let data = try XCTUnwrap(json.data(using: .utf8))
        let menuFetcher = MenuFetcher(networkFetcher: NetworkFetchingStub(returning: .success(data)))
        let expectation = XCTestExpectation(description: "Publishes decoded MenuItem")
        requestSucceedHelper(publisher: menuFetcher.fetchDishOfDay()) { item in
            XCTAssertEqual(item.name, "Spaghetti Carbonara")
            XCTAssertEqual(item.category, "pastas")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testRequestFailsAndErrors() {
        let expectation: XCTestExpectation = {
            let xcte = XCTestExpectation(description: "Publishes error when request fails")
            xcte.expectedFulfillmentCount = 2
            return xcte
        }()
        let menuFetcher = MenuFetcher(networkFetcher: NetworkFetchingStub(returning: .failure(URLError(.badServerResponse))))
        requestFailureHelper(publisher: menuFetcher.fetchMenu(), expectation: expectation)
        requestFailureHelper(publisher: menuFetcher.fetchDishOfDay(), expectation: expectation)
        wait(for: [expectation], timeout: 1)
    }
    
    private func requestSucceedHelper<T>(publisher: AnyPublisher<T, Error>, receiveValue: @escaping ((T) -> Void)) {
        publisher
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return }
                    XCTFail(error.localizedDescription)
                },
                receiveValue: receiveValue
            )
            .store(in: &cancellables)
    }
    
    private func requestFailureHelper<T>(publisher: AnyPublisher<T, Error>, expectation: XCTestExpectation) {
        let expectedError = URLError(.badServerResponse)
        publisher
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return }
                    XCTAssertEqual(error as? URLError, expectedError)
                    expectation.fulfill()
                },
                receiveValue: { items in
                    XCTFail("Expected to fail, succeeded with \(items)")
                }
            )
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
}
