//
//  Animals.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import Foundation

struct Animals: CategoryTypesProtocol {
    
    var title: String {
        return "Animals"
    }
    
    var count: Int {
        return types.count
    }
    
    var types: [CategoryProtocol] = [Pets(), WildAnimals(), DomesticAnimals()]
}

struct Pets: KeywordsProtocol {
    
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
