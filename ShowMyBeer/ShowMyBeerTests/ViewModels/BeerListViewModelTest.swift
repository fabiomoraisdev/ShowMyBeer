//
//  BeerListViewModelTest.swift
//  ShowMyBeerTests
//
//  Created by Fabio Souza de Morais on 22/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest
import Foundation

@testable import ShowMyBeer

class BeerListViewModelTest: XCTestCase {

    var sut: BeerListViewModel!
    
    override func setUp() {
        super.setUp()
        
    }
    
    func preepareObject() {
        
    }
    
    class BeerListViewModelSpy: BeerListViewModelDelegate {
        var isFetchSuccess = false
        var isFetchFailed = false
        
        func onFetchCompleted() {
            isFetchSuccess = true
        }
        
        func onFetchFailed(errorMessage: String) {
            isFetchFailed = true
        }
        
        
    }
    
    class NetworkingSpy: Networking {
        let spy = BeerListViewModelSpy()
        
        override func fetchData(method: String, page: Int, completionSuccess: @escaping Networking.responseSuccess, completionFailure: @escaping Networking.responseFailure) {
            spy.onFetchCompleted()
            print("teste")
        }
    }
    
    func testFetchBeers() {
        let networkingSpy = NetworkingSpy()
        sut = BeerListViewModel()
        sut.networking = networkingSpy
        
        sut.fetchBeers()
        
        XCTAssertTrue(networkingSpy.spy.isFetchSuccess)
    }

}
