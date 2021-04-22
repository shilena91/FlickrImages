//
//  NetworkService.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import UIKit

final class NetworkService {
    
    static let shared = NetworkService()
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}

    
    func loadData(urlString: String, parameters: [String: String], completion: @escaping(Result<Data, NetworkErrors>) -> Void) {
        guard let url = URLComponents(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var components: URLComponents = url
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        print(components.url ?? "nil url")
        
        let task = URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            
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
            
            completion(.success(data))
        }
        task.resume()
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
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data)
            else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
    
}
