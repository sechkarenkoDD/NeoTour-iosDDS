//
//  Category.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 15.04.2024.
//

import Foundation

struct Category: Hashable {
    var id: Int
    var title: String
    
    static func getCategories() -> [Category] {
        return [Category(id: 0, title: "Popular"), Category(id: 1, title: "Featured"), Category(id: 2, title: "Most visited"), Category(id: 3, title: "Europe"), Category(id: 4, title: "Asia")]
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
