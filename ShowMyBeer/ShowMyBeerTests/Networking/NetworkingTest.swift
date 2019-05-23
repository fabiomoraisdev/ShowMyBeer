//
//  BeerListViewModelTest.swift
//  ShowMyBeerTests
//
//  Created by Fabio Souza de Morais on 22/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest
@testable import ShowMyBeer

class NetworkingTest: XCTestCase {
    
    var sut = Networking()
    
    func testFetch() {
        let expectation = XCTestExpectation(description: "fech beers")
        sut.fetchData(method: "", page: 1, completionSuccess: { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }, completionFailure: { (error) in
            XCTAssertNotNil(error)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 2.0)
    }
}
