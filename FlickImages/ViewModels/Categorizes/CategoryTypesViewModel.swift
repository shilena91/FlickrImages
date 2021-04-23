//
//  CategoryTypesViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

final class CategoryTypesViewModel {
    
    private var categoryTypes: [CategoryProtocol]
    
    init(categoryTypes: [CategoryProtocol]) {
        self.categoryTypes = categoryTypes
    }

    
    func numberOfCategoryTypes() -> Int {
        return categoryTypes.count
    }

    
    func getCategoryType(byPosition position: Int) -> CategoryProtocol {
        return categoryTypes[position]
    }
}
