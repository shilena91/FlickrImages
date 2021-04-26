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
        photoListVM?.fetchPhotos(searchTerm: "", completion: { result in
            switch result {
            case .failure(let error):
                print(error)
                XCTAssert(false, "photoListVM should be able to fetch")
            case .success(_):
                break
            }
        })
    }

}
