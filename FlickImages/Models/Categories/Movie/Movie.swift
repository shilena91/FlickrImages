//
//  Movie.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

struct Movie: CategoryTypesProtocol {
    
    var title: String = "Movie"
    
    var count: Int {
        return types.count
    }
    
    var types: [CategoryProtocol] = [ScienceFiction()]
}

struct ScienceFiction: KeywordsProtocol {
    
    var title: String = "Science Fiction"
    
    var count: Int {
        return keywords.count
    }
    
    var keywords: [String] = ["Sunshine", "Interstellar", "The Moon", "Oblivion", "Star Trek", "Star Wars"]
}
