//
//  TourDetailBottomCellViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 24.04.2024.
//

import Foundation

protocol TourDetailBottomCellViewModelProtocol {
    var title: String { get }
    var location: String { get }
    var description: String { get }
    var comments: [Comment] { get }
    init(tour: Tour)
}

class TourDetailBottomCellViewModel: TourDetailBottomCellViewModelProtocol {
    
    var title: String {
        tour.title
    }
    
    var location: String {
        tour.location
    }
    
    var description: String {
        tour.description
    }
    
    var comments: [Comment] {
        tour.comments
    }
    
    private let tour: Tour
    
    required init(tour: Tour) {
        self.tour = tour
    }
    
    
}
