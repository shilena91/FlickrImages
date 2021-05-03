//
//  PhotoCell+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 28.4.2021.
//

import XCTest
@testable import FlickImages

class FlickrImageView_Tests: XCTestCase {
    
    private var flickrImageView: FlickrImageView?

    override func setUp() {
        flickrImageView = FlickrImageView(frame: .zero)
        super.setUp()
    }

    override func tearDown() {
        flickrImageView = nil
        super.tearDown()
    }

    // This test is flankiness, should be improved
    func testDownloadImageFail() {
        let promise = expectation(description: "download Image Fail")
        
        let dumbURLString = "https://live.staticflickr.com/65535/51140125339_8ede520502.jpn"
        
        flickrImageView?.service = FlickrService()
        flickrImageView?.downloadImage(from: dumbURLString)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if self.flickrImageView?.image == Images.placeholder {
                promise.fulfill()
            }
        }
        
        wait(for: [promise], timeout: 3)
    }
  
}
