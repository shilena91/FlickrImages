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
    
    
    func testFetchPhotosWhenAppOpen() {
        let promise = expectation(description: "Success result")
        
        photoListVM?.fetchPhotos(searchTerm: nil, completion: { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
                XCTAssert(false, "photoListVM should be able to fetch photos")
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
                if self?.photoListVM?.numberOfItems() == 0 {
                    promise.fulfill()
                }
            }
        })
        
        wait(for: [promise], timeout: 3)
    }

    
    func testImageURL() {
        let file = Bundle(for: FlickrService_Tests.self).url(forResource: "mockPhotosModel", withExtension: "json")
        
        let data = try! Data(contentsOf: file!)
        
        do {
            let decoded = try FlickrAPIMethod.photoSearch.parseJson(data: data)
            let firstPhotoImageURL = decoded.photos.photo.first?.flickrImageURL()
            let mockImageURL = "https://live.staticflickr.com/65535/51140125339_8ede520502.jpg"
            XCTAssertEqual(mockImageURL, firstPhotoImageURL)
        } catch {
            print(error)
            XCTAssertThrowsError("Decoding should have passed")
        }
    }

}
