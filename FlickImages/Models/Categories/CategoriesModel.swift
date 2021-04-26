//
//  CategorizesModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import Foundation

struct CategoriesModel: CategoryTypesProtocol {
    
    var title: String = "Categories"
    
    var count: Int {
        return types.count
    }
    
    var types: [CategoryProtocol] = [Animals(), Food(), Movie(), Vehicle()]
}
