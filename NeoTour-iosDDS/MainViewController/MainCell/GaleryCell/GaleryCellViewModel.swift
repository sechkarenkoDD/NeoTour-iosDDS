//
//  GaleryCellViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 18.04.2024.
//

import Foundation

protocol GaleryCellViewModeProtocol {
    var image: Data? { get }
    var title: String { get }
    init(galery: Galery)
}

class GaleryCellViewModel: GaleryCellViewModeProtocol {
    var image: Data? {
        ImageManager.shared.fetchImageData(from: galery.image)
    }
    
    var title: String {
        galery.title
    }
    
    private let galery: Galery
    
    required init(galery: Galery) {
        self.galery = galery
    }
}
