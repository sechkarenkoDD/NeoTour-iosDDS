//
//  CategoryCellViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 18.04.2024.
//

import Foundation

protocol CategoryCellViewModelProtocol {
    var title: String { get }
    init(category: Category)
}

class CategoryCellViewModel: CategoryCellViewModelProtocol {
    
    var title: String {
        category.name
    }
    
    private let category: Category
    
    required init(category: Category) {
        self.category = category
    }
}
