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
    var comments: [Review] { get }
    init(tour: Tour)
}

class TourDetailBottomCellViewModel: TourDetailBottomCellViewModelProtocol {
    
    var title: String {
        tour.name
    }
    
    var location: String {
        tour.location
    }
    
    var description: String {
        tour.description
    }
    
    var comments: [Review] {
        tour.reviews
    }
    
    private let tour: Tour
    
    required init(tour: Tour) {
        self.tour = tour
    }
    
    
}
