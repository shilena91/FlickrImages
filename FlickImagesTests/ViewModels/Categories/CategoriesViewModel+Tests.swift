//
//  CategoriesViewModel+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 26.4.2021.
//

import XCTest
@testable import FlickImages

class CategoriesViewModel_Tests: XCTestCase {

    private var categoriesVM: CategoriesViewModel?
    
    override func setUp() {
        super.setUp()
        categoriesVM = CategoriesViewModel()
    }

    override func tearDown() {
        categoriesVM = nil
        super.tearDown()
    }

    
    func testGetTitle() {
        let title = categoriesVM?.getTitle()
        
        XCTAssertEqual(title, "Categories")
    }

    
    func testNumberOfItems() {
        let numberOfItems = categoriesVM?.numberOfItems()
        
        XCTAssertEqual(numberOfItems, 4, "Expect 4 items: Animals, Food, Movie, Vehicle")
    }
    
    
    func testGetItem() {
        let item = categoriesVM?.getItem(byPosition: 0)
        
        let animals = Animals()
        
        XCTAssertEqual(item?.title, animals.title)
    }

}
