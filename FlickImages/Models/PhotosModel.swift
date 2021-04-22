//
//  Photos.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import Foundation

struct PhotosModel: Codable {
    let photos: Photos
}

struct Photos: Codable {
    let photo: [Photo]
}

struct Photo: Codable {
    let title: String
    let farm: Int
    let id, secret, server: String
    
    func flickrImageURL() -> String {
        let path = "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
        
        return path
    }
}
