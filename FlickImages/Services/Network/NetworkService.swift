//
//  NetworkService.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import UIKit

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}

    
    func loadData(urlString: String, parameters: [String: String], completion: @escaping (Result<Data, NetworkErrors>) -> Void) {
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
    
}
