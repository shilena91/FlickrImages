//
//  APIConstants+Key.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import Foundation

enum APIConstants {
    static let baseURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search"
    static let apiKey = "b59eaa142fbb03d0ba6c93882fd62e30"
}

enum APIKey {
    static let apiKey = "api_key"
    static let nojsoncallbackKey = "nojsoncallback"
    static let formatKey = "format"
    static let textKey = "text"
    static let pageKey = "page"
}
