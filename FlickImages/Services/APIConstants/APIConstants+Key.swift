//
//  APIConstants+Key.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import Foundation

enum FlickrAPIConstants {
    static let apiKey = "b59eaa142fbb03d0ba6c93882fd62e30"
    static let host = "api.flickr.com"
    static let path = "/services/rest/"
}

enum FlickrAPIParametersKey {
    static let apiKey = "api_key"
    static let nojsoncallback = "nojsoncallback"
    static let method = "method"
    static let format = "format"
    static let text = "text"
    static let page = "page"
}
