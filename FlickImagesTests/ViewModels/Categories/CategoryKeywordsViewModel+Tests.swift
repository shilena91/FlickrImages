//
//  CategoryKeywordsViewModel+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 26.4.2021.
//

import XCTest
@testable import FlickImages

class CategoryKeywordsViewModel_Tests: XCTestCase {

    private var categoryKeywordsVM: CategoryKeywordViewModel?
    
    override func setUp() {
        super.setUp()
        
        categoryKeywordsVM = CategoryKeywordViewModel(keywords: Pets())
    }

    override func tearDown() {
        categoryKeywordsVM = nil
        super.tearDown()
    }
    
    
    func testGetTitle() {
        let title = categoryKeywordsVM?.getTitle()
        
        XCTAssertEqual(title, "Pets")
    }

    
    func testNumberOfKeywords() {
        let numberOfKeywords = categoryKeywordsVM?.numberOfItems()
        
        XCTAssertEqual(numberOfKeywords, 5, "Expect 5 keywords: Guppy, Parrot, GoldFish, Dog, Cat")
    }
    

    func testGetKeyword() {
        let keyword = categoryKeywordsVM!.getItem(byPosition: 0)
        
        XCTAssertEqual(keyword, "Guppy")
    }

}
