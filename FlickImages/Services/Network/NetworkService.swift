//
//  NetworkService.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import UIKit
import Combine

// RestRequest Model has to confrom to this protocol
protocol RestRequestProtocol {
    var host: String { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}

    
    func get<T: RestRequestProtocol>(restRequest: T) -> AnyPublisher<Data, NetworkErrors> {
        let request = buildGetRequestURL(from: restRequest)
        
        switch request {
        case .success(let request):
            return sendRequest(request: request)
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        }
    }

    
    private func buildGetRequestURL<T: RestRequestProtocol>(from restRequest: T) -> Result<URLRequest, NetworkErrors> {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = restRequest.host
        urlComponents.path = restRequest.path
        
        let parameters = restRequest.parameters
        
        let queryItems = parameters.map { (key, value) -> URLQueryItem in
            URLQueryItem(name: key, value: value)
        }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return .failure(.invalidData)
        }
        
        print(url)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        return .success(urlRequest)
    }

    
    private func sendRequest(request: URLRequest) -> AnyPublisher<Data, NetworkErrors> {
        let task = URLSession.shared.dataTaskPublisher(for: request).map { (data, response) in
            return data
        }.mapError({ error -> NetworkErrors in
            return .unableToComplete(error)
        })
        .eraseToAnyPublisher()
        
        return task
    }

}
