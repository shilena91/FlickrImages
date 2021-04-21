//
//  Photos.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import Foundation

protocol PhotoURL {}

extension PhotoURL where Self == Photo {
    
    func getPhotoPath() -> URL? {
        let path = "http://farm\(self.farm).static.flickr.com/\(self.server)/\(self.id)_\(self.secret).jpg"
        
        return URL(string: path)
    }
}

struct PhotosModel: Codable {
    let photos: Photos
}

struct Photos: Codable {
    let photo: [Photo]
}

struct Photo: Codable, PhotoURL {
    let title: String
    let farm: Int
    let id, secret, server: String
}
