//
//  Vechicle.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

struct Vehicle: CategoryChildsProtocol {
    
    var title: String = "Vehicle"
    
    var count: Int {
        return childCategories.count
    }
    
    var childCategories: [CategoryProtocol] = [Motorcycle(), Car()]
}

struct Motorcycle: KeywordsProtocol {
    
    var title: String = "Motorcycle"
    
    var count: Int {
        return keywords.count
    }
    
    var keywords: [String] = ["Harley Davidson"]
}

struct Car: KeywordsProtocol {
    
    var title: String = "Car"
    
    var count: Int {
        return keywords.count
    }
    
    var keywords: [String] = ["Lamborghini", "Ferrari", "Bugatti", "BMW", "Mercedes"]
}
