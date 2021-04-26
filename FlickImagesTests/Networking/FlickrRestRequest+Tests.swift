//
//  FlickrRestRequest+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 26.4.2021.
//

import XCTest
@testable import FlickImages

class FlickrRestRequest_Tests: XCTestCase {
    
    override class func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override class func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testParameters() {
        let parameters: [String: String] = FlickrAPIParameters.dictionaryFor(
            [
                .method(FlickrAPIMethod.photoSearch.path),
                .text("Dog"),
                .apiKey,
                .format,
                .nojsoncallback,
            ]
        )
        
        XCTAssertNotNil(parameters)
        XCTAssertEqual(parameters[FlickrAPIParametersKey.method], FlickrAPIMethod.photoSearch.path)
    }
}
