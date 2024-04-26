//
//  TourDetailViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 23.04.2024.
//

import Foundation

protocol TourDetailViewModelProtocol {
    func getDataForTopCell() -> TourDetailTopCellViewModelProtocol
    func getDataForBottomCell() -> TourDetailBottomCellViewModelProtocol
    init(tour: Tour)
}
class TourDetailViewModel: TourDetailViewModelProtocol {

    private var tour: Tour
    
    func getDataForTopCell() -> TourDetailTopCellViewModelProtocol {
        TourDetailTopCellViewModel(tour: tour)
    }
    
    func getDataForBottomCell() -> TourDetailBottomCellViewModelProtocol {
        TourDetailBottomCellViewModel(tour: tour)
    }

    
    required init(tour: Tour) {
        self.tour = tour
    }
}
