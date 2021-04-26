//
//  FlickrService+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 26.4.2021.
//

import XCTest
@testable import FlickImages

class FlickrService_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testBuildGetInvalidRequestURL() {
        let restRequest = FlickrRestRequest(host: FlickrAPIConstants.invalidHostForTesting, path: FlickrAPIConstants.invalidPathForTesting, parameters: [:])
        
        let invalidRequest = NetworkService.shared.buildRequestURL(from: restRequest)
        
        switch invalidRequest {
        case .success(_):
            XCTAssertThrowsError("Building URL request should have failed")
        case .failure(let error):
            let debugMsg = NetworkErrors.invalidURL.debugDescription
            XCTAssertEqual(error.debugDescription, debugMsg)
        }
    }

    
    func testBuildPhotoSearchRequestURL() {
        let parameters: [String: String] = FlickrAPIParameters.dictionaryFor(
            [
                .method(FlickrAPIMethod.photoSearch.path)
            ]
        )
        
        let restRequest = FlickrRestRequest(host: FlickrAPIConstants.host, path: FlickrAPIConstants.path, parameters: parameters)
        
        let validRequest = NetworkService.shared.buildRequestURL(from: restRequest)
        
        switch validRequest {
        case .success(let request):
            XCTAssertEqual(request.httpMethod, "GET")
            XCTAssertTrue(request.url!.absoluteString.contains("https://api.flickr.com/services/rest/?method=flickr.photos.search"))
        case .failure(_):
            XCTAssertThrowsError("Building URL request should have passed")
        }
    }

    
    func testDecodePhotosModel() {
        let file = Bundle(for: FlickrService_Tests.self).url(forResource: "mockPhotosModel", withExtension: "json")
        
        let data = try! Data(contentsOf: file!)
        
        do {
            let decoded = try FlickrAPIMethod.photoSearch.parseJson(data: data)
            XCTAssertEqual(decoded.photos.photo.count, 4)
            XCTAssertEqual((decoded.photos.photo.first! as Photo).id, "51140125339")
        } catch {
            print(error)
            XCTAssertThrowsError("Decoding should have passed")
        }
    }

}
