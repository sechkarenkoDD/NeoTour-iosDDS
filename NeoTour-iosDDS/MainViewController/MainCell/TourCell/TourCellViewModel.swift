//
//  GaleryCellViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 18.04.2024.
//

import Foundation

protocol TourCellViewModeProtocol {
    var image: Data? { get }
    var title: String { get }
    init(tour: Tour)
}

class TourCellViewModel: TourCellViewModeProtocol {
    var image: Data? {
        ImageManager.shared.fetchImageData(from: tour.tourPhoto)
    }
    
    var title: String {
        tour.name
    }
    
    private let tour: Tour
    
    required init(tour: Tour) {
        self.tour = tour
    }
}