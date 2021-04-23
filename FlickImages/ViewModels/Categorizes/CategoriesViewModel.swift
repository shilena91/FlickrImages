//
//  CategorizesViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import Foundation

final class CategoriesViewModel {
    
    private var categories: CategoriesModel = CategoriesModel()

    func getTitle() -> String {
        return categories.title
    }

    
    func numberOfCategorizes() -> Int {
        return categories.count
    }
    
    
    func getCategoryType(byPosition position: Int) -> CategoryProtocol {
        return categories.types[position]
    }
}
