//
//  Animals.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

// Animals confrom to Equatable for testing purpose
struct Animals: CategoryChildsProtocol, Equatable {
    static func == (lhs: Animals, rhs: Animals) -> Bool {
        return lhs.title == rhs.title
    }
    
    
    var title: String {
        return "Animals"
    }
    
    var count: Int {
        return childCategories.count
    }
    
    var childCategories: [CategoryProtocol] = [Pets(), WildAnimals(), DomesticAnimals()]
}

struct Pets: KeywordsProtocol, Equatable {
    
    var title: String = "Pets"
    
    var count: Int {
        return keywords.count
    }
    
    var keywords: [String] {
        return ["Guppy", "Parrot", "GoldFish", "Dog", "Cat"]
    }
}

struct WildAnimals: KeywordsProtocol {
    
    var title: String = "Wild Animals"
    
    var count: Int {
        return keywords.count
    }
    
    var keywords: [String] {
        return ["Tiger", "Ant", "Tetra", "Peafowl", "Mongoose"]
    }
}

struct DomesticAnimals: KeywordsProtocol {
    
    var title: String = "Domestic Animals"
    
    var count: Int {
        return keywords.count
    }
    
    var keywords: [String] {
        return ["Cow", "Pig", "Goat", "Horse"]
    }
}
