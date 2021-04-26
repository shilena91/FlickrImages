//
//  CategoriesDataSourceProtocol.swift
//  FlickImages
//
//  Created by Hoang Pham on 26.4.2021.
//

import Foundation

// ViewModel in categories has to confrom to this protocol
protocol CategoriesDataSourceProtocol {
    associatedtype T
    
    func getTitle() -> String
    func numberOfItems() -> Int
    func getItem(byPosition position: Int) -> T
}
