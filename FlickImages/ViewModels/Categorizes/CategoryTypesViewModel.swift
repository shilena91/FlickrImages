//
//  CategoryTypesViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

final class CategoryTypesViewModel: CategoriesDataSourceProtocol {
    
    typealias T = CategoryProtocol
    
    private var categoryTypes: [CategoryProtocol]
        
    init(categoryTypes: [CategoryProtocol]) {
        self.categoryTypes = categoryTypes
    }

    
    func numberOfItems() -> Int {
        return categoryTypes.count
    }

    
    func getItem(byPosition position: Int) -> CategoryProtocol {
        return categoryTypes[position]
    }
    
}
