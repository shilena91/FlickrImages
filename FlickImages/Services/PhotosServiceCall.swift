//
//  PhotosServiceCall.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

protocol PhotosServiceCallProtocol: class {
    func fetchPhotos(searchTerm: String, completion: @escaping (Result<PhotosModel, NetworkErrors>) -> Void)
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
}

final class PhotosServiceCall: PhotosServiceCallProtocol {
    
    static let shared = PhotosServiceCall()
    let cache = NSCache<NSString, UIImage>()
    
    let endpoint = APIConstants.baseURL
    
    private init() {}
    
    
    func fetchPhotos(searchTerm: String, completion: @escaping (Result<PhotosModel, NetworkErrors>) -> Void) {
        var parameters: [String: String] = [
            APIKey.method: APIConstants.APIMethods_PhotosSearch,
            APIKey.apiKey: APIConstants.apiKey,
            APIKey.nojsoncallbackKey: "1",
            APIKey.formatKey: "json",
            APIKey.textKey: searchTerm
        ]
        
        if searchTerm.isEmpty {
            parameters[APIKey.textKey] = "Dog"
        }
        
        NetworkService.shared.loadData(urlString: endpoint, parameters: parameters, completion: { (result) in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(PhotosModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(jsonData))
                    }
                } catch {
                    completion(.failure(.parseJsonFailed(error)))
                }
            case .failure(let error):
                print("network load data error: ", error)
                completion(.failure(.other))
            }
        })
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
