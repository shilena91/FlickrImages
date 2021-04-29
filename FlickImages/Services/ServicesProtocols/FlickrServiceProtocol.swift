//
//  FlickrServiceProtocol.swift
//  FlickImages
//
//  Created by Hoang Pham on 26.4.2021.
//

import UIKit

// Network service class has to confrom to this protocol
protocol FlickrServiceProtocol {
    func fetchPhotos(searchText: String?, completion: @escaping (Result<PhotosModel, NetworkErrors>) -> Void)
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
}
