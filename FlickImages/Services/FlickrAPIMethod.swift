//
//  RequestType.swift
//  FlickImages
//
//  Created by Hoang Pham on 24.4.2021.
//

import Foundation

enum FlickrAPIMethod {
    case photoSearch
    
    var path: String {
        switch self {
        case .photoSearch:
            return "flickr.photos.search"
        }
    }
    
    func parseJson(data: Data) throws -> PhotosModel {
        switch self {
        case .photoSearch:
            return try JSONDecoder().decode(PhotosModel.self, from: data)
        }
    }
}
