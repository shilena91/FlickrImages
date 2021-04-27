//
//  MainImagesVC+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 26.4.2021.
//

import XCTest
@testable import FlickImages

class MainImagesVC_Tests: XCTestCase {

    private var mainImageVC: MainImagesVC?
    
    override func setUp() {
        super.setUp()
        
        mainImageVC = MainImagesVC()
    }

    override func tearDown() {
        mainImageVC = nil
        super.tearDown()
    }
    
    
    func testSearchTextWithWhiteSpaces() {
        let searchController = UISearchController()
        
        searchController.searchBar.delegate = mainImageVC
        mainImageVC?.navigationItem.searchController = searchController
        let searchBar = mainImageVC?.navigationItem.searchController?.searchBar
        
        searchBar?.text = "   Corgi Dogs Black   "
        
        mainImageVC?.searchBarSearchButtonClicked(searchBar!)
        
        XCTAssertEqual(mainImageVC?.photosListViewModel.searchText, "Corgi+Dogs+Black")
    }

}
