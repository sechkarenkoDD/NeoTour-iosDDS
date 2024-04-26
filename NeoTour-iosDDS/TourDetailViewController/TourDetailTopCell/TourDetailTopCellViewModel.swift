//
//  TourDetailsTopCellViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 24.04.2024.
//

import Foundation

protocol TourDetailTopCellViewModelProtocol {
    var image: Data? { get }
    init(tour: Tour)
}

class TourDetailTopCellViewModel: TourDetailTopCellViewModelProtocol {
    
    var image: Data? {
        ImageManager.shared.fetchImageData(from: tour.tourPhoto)
    }
    
    private let tour: Tour
    
    required init(tour: Tour) {
        self.tour = tour
    }
}
