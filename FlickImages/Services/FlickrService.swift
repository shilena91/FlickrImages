//
//  PhotosServiceCall.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

final class FlickrService: FlickrServiceProtocol {
    
//    static let shared = FlickrService()
    private let cache = NSCache<NSString, UIImage>()
        
//    private init() {}
    
    
    func fetchPhotos(searchText: String?, completion: @escaping (Result<PhotosModel, NetworkErrors>) -> Void) {
        let parameters: [String: String] = FlickrAPIParameters.dictionaryFor(
            [
                .method(FlickrAPIMethod.photoSearch.path),
                .text(searchText),
                .apiKey,
                .format,
                .nojsoncallback,
            ]
        )
        
        let restRequest = FlickrRestRequest(host: FlickrAPIConstants.host, path: FlickrAPIConstants.path, parameters: parameters)
        
        NetworkService.shared.get(restRequest: restRequest) { (result) in
            switch result {
            case .success(let data):
                do {
                    let photosModel = try FlickrAPIMethod.photoSearch.parseJson(data: data)
                    completion(.success(photosModel))
                } catch {
                    completion(.failure(.parseJsonFailed(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            return

        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data)
            else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        task.resume()
    }
}
