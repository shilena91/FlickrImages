//
//  PhotosServiceCall.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import Foundation

protocol PhotosServiceCallProtocol: class {
    func fetchPhotos(searchTerm: String, completion: @escaping (Result<PhotosModel, NetworkErrors>) -> Void)
}

final class PhotosServiceCall: PhotosServiceCallProtocol {
    
    static let shared = PhotosServiceCall()
    
    let endpoint = APIConstants.baseURL
    
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

            }
        })
    }
}
