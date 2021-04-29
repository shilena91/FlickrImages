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

        let searchController = UISearchController()
        
        searchController.searchBar.delegate = mainImageVC
        mainImageVC?.navigationItem.searchController = searchController
    }

    override func tearDown() {
        mainImageVC = nil
        super.tearDown()
    }


    func testSearchTextWithWhitespaces() {
        let searchBar = mainImageVC?.navigationItem.searchController?.searchBar
        
        searchBar?.text = "Corgi Dogs Black"
        
        mainImageVC?.searchBarSearchButtonClicked(searchBar!)
        
        XCTAssertEqual(mainImageVC?.photosListViewModel.searchText, "Corgi+Dogs+Black")
    }


    func testSearchTextWithOnlyWhitespaces() {
        let searchBar = mainImageVC?.navigationItem.searchController?.searchBar
        
        searchBar?.text = "Corgi Dogs Black"
        
        mainImageVC?.searchBarSearchButtonClicked(searchBar!)
                
        searchBar?.text = "   "
        
        mainImageVC?.searchBarSearchButtonClicked(searchBar!)
        
        XCTAssertEqual(mainImageVC?.photosListViewModel.searchText, "Corgi+Dogs+Black")
    }

}
