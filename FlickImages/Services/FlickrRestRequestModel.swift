//
//  RestRequestModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 24.4.2021.
//

import Foundation

struct FlickrRestRequest: RestRequestProtocol {
    let host: String
    let path: String
    let parameters: [String: String]
}

enum FlickrAPIParameters {
    case apiKey
    case nojsoncallback
    case method(String)
    case format
    case text(String)
    case page(Int?)
    
    static func dictionaryFor(_ requestParamenters: [FlickrAPIParameters]) -> [String: String] {
        var parameters: [String: String] = [:]
        
        for param in requestParamenters {
            switch param {
            case .apiKey:
                parameters[FlickrAPIParametersKey.apiKey] = FlickrAPIConstants.apiKey
            case .nojsoncallback:
                parameters[FlickrAPIParametersKey.nojsoncallback] = "1"
            case .method(let method):
                parameters[FlickrAPIParametersKey.method] = method
            case .format:
                parameters[FlickrAPIParametersKey.format] = "json"
            case .text(let text):
                parameters[FlickrAPIParametersKey.text] = (!text.isEmpty) ? text : "Dog"
            case .page(let page):
                parameters[FlickrAPIParametersKey.page] = (page != nil) ? String(page!) : "1"
            }
        }
        return parameters
    }
}
