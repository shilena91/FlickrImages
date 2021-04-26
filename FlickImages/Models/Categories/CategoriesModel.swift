//
//  CategorizesModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import Foundation

struct CategoriesModel: CategoryChildsProtocol {
    
    var title: String = "Categories"
    
    var count: Int {
        return childCategories.count
    }
    
    var childCategories: [CategoryProtocol] = [Animals(), Food(), Movie(), Vehicle()]
}
