//
//  CategorizeProtocols.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

protocol CategoryProtocol {
    var title: String { get }
    var count: Int { get }
}

protocol CategoryTypesProtocol: CategoryProtocol {
    var types: [CategoryProtocol] { get }
}

protocol KeywordsProtocol: CategoryProtocol {
    var keywords: [String] { get }
}
