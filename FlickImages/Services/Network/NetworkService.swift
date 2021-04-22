//
//  NetworkService.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    let cache = NSCache<NSString, UIImage>()

    
    private let apiKey = "b59eaa142fbb03d0ba6c93882fd62e30"
    private let baseURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&text=car&format=json&nojsoncallback=1"
    
    private init() {}
    
    func requestFor(page: Int, completion: @escaping (Result<Photos, NetworkErrors>) -> Void) {
        let endpoint = "\(baseURL)&api_key=\(apiKey)&page=\(page)"
                
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                completion(.failure(.unableToComplete(error!)))
            }
            
            if let response = response as? HTTPURLResponse {
                let code = response.statusCode
                if !(200...299 ~= code) {
                    completion(.failure(.httpError(statusCode: code)))
                    return
                }
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PhotosModel.self, from: data)
                let photos = jsonData.photos
                DispatchQueue.main.async {
                    completion(.success(photos))
                }
            } catch {
                completion(.failure(.parseJsonFailed(error)))
            }
        }
        task.resume()
    }
    
    func downloadImage(from urlString: URL?, completion: @escaping (UIImage?) -> Void) {
//        let cacheKey = NSString(string: urlString)
        
//        if let image = cache.object(forKey: cacheKey) {
//            completion(image)
//            return
//        }
        
//        guard let url = URL(string: urlString) else {
//            return
//
//        }
        
        let task = URLSession.shared.dataTask(with: urlString!) { [weak self] (data, response, error) in
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data)
            else {
                completion(nil)
                return
            }
            
//            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
    
}
