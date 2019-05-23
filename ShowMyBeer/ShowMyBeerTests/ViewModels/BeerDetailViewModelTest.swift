//
//  BeerDetailViewModelTest.swift
//  ShowMyBeerTests
//
//  Created by Fabio Souza de Morais on 22/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest
@testable import ShowMyBeer

class BeerDetailViewModelTest: XCTestCase {
    let sut = BeerDetailsViewModel()
    var beer: Beer?
    var beerNil: Beer?
    override func setUp() {
        super.setUp()
        beer = Beer(id: 1, name: "TestName", tagline: "TestTag", description: "TestDescription", image_url: "TerstUrl", abv: 2.0, ibu: 2.0, error: nil)
    }
    
    func testBeerName(){
        sut.beer = beer
        let name = sut.beerName()
        
        XCTAssertEqual(name, "TestName")
    }
    
    func testTagline() {
        sut.beer = beer
        let tagLine = sut.tagline()
        
        XCTAssertEqual(tagLine, "TestTag")
    }
    
    func testBeerImage() {
        sut.beer = beer
        let imageUrl = sut.beerImage()
        
        XCTAssertEqual(imageUrl, "TerstUrl")
    }
    
    func testAbv() {
        sut.beer = beer
        let abv = sut.abv()

        XCTAssertEqual(abv, "2.0% ABV")
    }
    
    func testIbu() {
        sut.beer = beer
        let ibu = sut.ibu()

        XCTAssertEqual(ibu, "2.0% IBU")
    }
    
    func testDescription()  {
        sut.beer = beer
        let description = sut.description()

        XCTAssertEqual(description, "TestDescription")
    }
    
    func testBeerNameFail(){
        sut.beer = beerNil
        let name = sut.beerName()
        
        XCTAssertEqual(name, "")
    }
    
    func testTaglineFail() {
        sut.beer = beerNil
        let tagLine = sut.tagline()
        
        XCTAssertEqual(tagLine, "")
    }
    
    func testBeerImageFail() {
        sut.beer = beerNil
        let imageUrl = sut.beerImage()
        
        XCTAssertEqual(imageUrl, "")
    }
    
    func testAbvFail() {
        sut.beer = beerNil
        let abv = sut.abv()
        
        XCTAssertEqual(abv, "% ABV")
    }
    
    func testIbuFail() {
        sut.beer = beerNil
        let ibu = sut.ibu()
        
        XCTAssertEqual(ibu, "% IBU")
    }
    
    func testDescriptionFail()  {
        sut.beer = beerNil
        let description = sut.description()
        
        XCTAssertEqual(description, "")
    }
}
