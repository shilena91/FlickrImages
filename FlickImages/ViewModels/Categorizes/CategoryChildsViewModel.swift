//
//  CategoryTypesViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

final class CategoryChildsViewModel: CategoriesDataSourceProtocol {
    
    typealias T = CategoryProtocol
    
    private var categoryChilds: CategoryChildsProtocol
        
    init(categoryChilds: CategoryChildsProtocol) {
        self.categoryChilds = categoryChilds
    }

    
    func getTitle() -> String {
        return categoryChilds.title
    }
    
    
    func numberOfItems() -> Int {
        return categoryChilds.count
    }

    
    func getItem(byPosition position: Int) -> CategoryProtocol {
        return categoryChilds.childCategories[position]
    }
    
}
