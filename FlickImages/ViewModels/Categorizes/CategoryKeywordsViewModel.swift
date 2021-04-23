//
//  CategoryKeywordsViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

final class CategoryKeywordViewModel {
    
    private var keywordsModel: KeywordsProtocol
    
    init(keywords: KeywordsProtocol) {
        self.keywordsModel = keywords
    }

    
    func numberOfKeywords() -> Int {
        return keywordsModel.keywords.count
    }

    
    func getKeyword(byPosition position: Int) -> String {
        return keywordsModel.keywords[position]
    }
}
