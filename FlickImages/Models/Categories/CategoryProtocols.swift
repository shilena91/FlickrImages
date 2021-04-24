//
//  CategorizeProtocols.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

// All models in categories have to confrom to this protocol
protocol CategoryProtocol {
    var title: String { get }
    var count: Int { get }
}

// Model contains child categories has to confrom to this protocol
protocol CategoryTypesProtocol: CategoryProtocol {
    var types: [CategoryProtocol] { get }
}

// Model contains keywords (last layer in categories) has to confrom to this protocol
protocol KeywordsProtocol: CategoryProtocol {
    var keywords: [String] { get }
}
