//
//  Category.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 15.04.2024.
//

import Foundation

struct Category: Hashable, Decodable {
    let id: Int
    let name: String
    
    static func getCategories() -> [Category] {
        let categories = [
            Category(id: 0, name: "Popular"),
            Category(id: 1, name: "Featured"),
            Category(id: 2, name: "Most visited"),
            Category(id: 3, name: "Europe"),
            Category(id: 4, name: "Asia")
        ]
        return categories
    }
    
    
    
}
