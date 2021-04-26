//
//  CategoryTypesViewModel+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 26.4.2021.
//

import XCTest
@testable import FlickImages

class CategoryTypesViewModel_Tests: XCTestCase {

    private var categoryTypesVM: CategoryTypesViewModel?
    
    override func setUp() {
        super.setUp()
        
        let categoryTypes: CategoryTypesProtocol = CategoriesViewModel().getItem(byPosition: 0) as! CategoryTypesProtocol
        
        categoryTypesVM = CategoryTypesViewModel(categoryTypes: categoryTypes)
    }

    override func tearDown() {
        categoryTypesVM = nil
        super.tearDown()
    }

    
    func testGetTitle() {
        let title = categoryTypesVM?.getTitle()
        
        XCTAssertEqual(title, "Animals")
    }

    
    func testNumberOfItems() {
        let numberOfItems = categoryTypesVM?.numberOfItems()
        
        XCTAssertEqual(numberOfItems, 3, "Expect 3 items: pets, wild animals, domestic animals")
    }

    
    func testGetItem() {
        let item = categoryTypesVM?.getItem(byPosition: 0) as! Pets
        
        XCTAssertEqual(item, Pets())
    }

}
