//
//  BeerDetailsViewControllerTest.swift
//  ShowMyBeerTests
//
//  Created by Fabio Souza de Morais on 22/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest
@testable import ShowMyBeer

class BeerDetailsViewControllerTest: XCTestCase {

    var sut: BeerDetailsViewController?
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupBeerDetaiilsViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func setupBeerDetaiilsViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "BeerDetailsViewController") as? BeerDetailsViewController
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
