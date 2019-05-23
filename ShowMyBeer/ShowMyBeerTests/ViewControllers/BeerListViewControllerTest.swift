//
//  BeerListViewControllerTest.swift
//  ShowMyBeerTests
//
//  Created by Fabio Souza de Morais on 22/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest
@testable import ShowMyBeer

class BeerListViewControllerTest: XCTestCase {

    var sut: BeerListTableViewController?
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupBeerListTableViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func setupBeerListTableViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "BeerListTableViewController") as? BeerListTableViewController
    }
    
    func loadView() {
        window.addSubview(sut?.view ?? UIView())
        RunLoop.current.run(until: Date())
    }
    
    func testLoad() {
        // When
        loadView()
        
        // Then
        XCTAssertNotNil(sut?.viewModel)
    }

}
