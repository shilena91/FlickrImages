//
//  NetworkErrors.swift
//  FlickImages
//
//  Created by Hoang Pham on 21.4.2021.
//

import Foundation

enum NetworkErrors: CustomDebugStringConvertible, Error {
    case httpError(statusCode: Int)
    case invalidData
    case parseJsonFailed(Error)
    case invalidURL
    case unableToComplete(Error)

    var debugDescription: String {
        switch self {
        case .httpError(let code):
            return "HTTP error code \(code)."
        case .unableToComplete(let error):
            return "\(error.localizedDescription)"
        case .parseJsonFailed(let error):
            return "Cannot decode JSON data, \(error)"
        case .invalidData:
            return "Data received from the server was invalid. Please try again."
        case .invalidURL:
            return "Invalid URL."
        }
    }
}
