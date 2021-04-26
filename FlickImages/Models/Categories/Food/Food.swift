//
//  Food.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

struct Food: CategoryChildsProtocol {
    
    var childCategories: [CategoryProtocol] = [FastFood(), Dessert()]
    
    var title: String = "Food"
    
    var count: Int {
        return childCategories.count
    }
}

struct FastFood: KeywordsProtocol {
    
    var title: String = "Fast Food"
    
    var count: Int {
        return keywords.count
    }
    
    var keywords: [String] = ["Cheeseburger", "Hamburger"]
}

struct Dessert: KeywordsProtocol {
    
    var title: String = "Dessert"
    
    var count: Int {
        return keywords.count
    }
    
    var keywords: [String] = ["Chocolate", "Cookie", "Cake", "Pie"]
}
