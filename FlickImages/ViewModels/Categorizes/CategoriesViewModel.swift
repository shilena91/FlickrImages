//
//  CategorizesViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import Foundation

final class CategoriesViewModel: CategoriesDataSourceProtocol {
    
    typealias T = CategoryProtocol
    
    private var categories: CategoriesModel = CategoriesModel()

    
    func getTitle() -> String {
        return categories.title
    }
    
    
    func numberOfItems() -> Int {
        return categories.count
    }

    
    func getItem(byPosition position: Int) -> CategoryProtocol {
        return categories.types[position]
    }
    
}
