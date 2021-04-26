//
//  CategoryKeywordsViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

final class CategoryKeywordViewModel: CategoriesDataSourceProtocol {
    
    typealias T = String
    
    private var keywordsModel: KeywordsProtocol
    
    init(keywords: KeywordsProtocol) {
        self.keywordsModel = keywords
    }

    
    func getTitle() -> String {
        return keywordsModel.title
    }
    
    
    func numberOfItems() -> Int {
        return keywordsModel.keywords.count
    }

    
    func getItem(byPosition position: Int) -> String {
        return keywordsModel.keywords[position]
    }
    
}
