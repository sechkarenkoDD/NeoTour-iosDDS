//
//  TourDetailsTopCellViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 24.04.2024.
//

import Foundation

protocol TourDetailTopCellViewModelProtocol {
    func getImage() async -> Data
    init(tour: Tour)
}

class TourDetailTopCellViewModel: TourDetailTopCellViewModelProtocol {
    
    func getImage() async -> Data {
        
        var data = Data()
        
        do {
            let imageData = try await ImageManager.shared.fetchImage(tour.tourPhoto)
            data = imageData
        } catch {
            print(error)
        }
        return data
    }
    
    private let tour: Tour
    
    required init(tour: Tour) {
        self.tour = tour
    }
}
