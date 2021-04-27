//
//  PhotosListViewModel+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 26.4.2021.
//

import XCTest
@testable import FlickImages

// TODO: improve this test by creating mock service

class PhotosListViewModel_Tests: XCTestCase {

    private var photoListVM: PhotosListViewModel?
    
    override func setUp() {
        super.setUp()
        
        photoListVM = PhotosListViewModel()
    }

    override func tearDown() {
        photoListVM = nil
        super.tearDown()
    }
    
    
    func testFetchPhotos() {
        let promise = expectation(description: "Success result")
        
        photoListVM?.fetchPhotos(searchTerm: "", completion: { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
                XCTAssert(false, "photoListVM should be able to fetch")
            case .success(_):
                if self!.photoListVM!.numberOfItems() > 0 {
                    promise.fulfill()
                }
            }
        })
        
        wait(for: [promise], timeout: 3)
    }
    
    
    func testDumbSearchTerm() {
        let promise = expectation(description: "Success result")
        
        photoListVM?.fetchPhotos(searchTerm: "$*%*%*", completion: { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTAssert(false, "photoListVM should still call API successfully")
            case .success(_):
                if self!.photoListVM!.numberOfItems() == 0 {
                    promise.fulfill()
                }
            }
        })
        
        wait(for: [promise], timeout: 3)
    }

}
