//
//  NetworkService.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    private let apiKey = "b59eaa142fbb03d0ba6c93882fd62e30"
    private let baseURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&media=photos&format=json&nojsoncallback=1"
    
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
                completion(.success(photos))
            } catch {
                completion(.failure(.parseJsonFailed(error)))
            }
        }
        task.resume()
    }
    
}
