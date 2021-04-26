//
//  CategoryTypesViewModel+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 26.4.2021.
//

import XCTest
@testable import FlickImages

class CategoryChildsViewModel_Tests: XCTestCase {

    private var categoryChildsVM: CategoryChildsViewModel?
    
    override func setUp() {
        super.setUp()
        
        let categoryChilds: CategoryChildsProtocol = CategoriesViewModel().getItem(byPosition: 0) as! CategoryChildsProtocol
        
        categoryChildsVM = CategoryChildsViewModel(categoryChilds: categoryChilds)
    }

    override func tearDown() {
        categoryChildsVM = nil
        super.tearDown()
    }

    
    func testGetTitle() {
        let title = categoryChildsVM?.getTitle()
        
        XCTAssertEqual(title, "Animals")
    }

    
    func testNumberOfItems() {
        let numberOfItems = categoryChildsVM?.numberOfItems()
        
        XCTAssertEqual(numberOfItems, 3, "Expect 3 items: pets, wild animals, domestic animals")
    }

    
    func testGetItem() {
        let item = categoryChildsVM?.getItem(byPosition: 0) as! Pets
        
        XCTAssertEqual(item, Pets())
    }

}
