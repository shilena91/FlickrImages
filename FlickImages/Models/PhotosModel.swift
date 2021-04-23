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
    let id, secret, server: String
    
    func flickrImageURL() -> String {
        let path = "https://live.staticflickr.com/\(server)/\(id)_\(secret).jpg"
        
        return path
    }
}
