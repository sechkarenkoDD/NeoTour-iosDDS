//
//  OnboardingViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 21.04.2024.
//

import Foundation

protocol OnboardingViewModelProtocol {
    var imageName: String { get }
    func getMainViewModel() -> MainViewModelProtocol
}

class OnboardingViewModel: OnboardingViewModelProtocol {
    
    var imageName: String {
        "home"
    }
    
    private let categories = Category.getCategories()
    private let galeries = Galery.getToursForGalery()
    private let recommendations = Galery.getToursForRecommended()
    
    func getMainViewModel() -> MainViewModelProtocol {
        MainViewModel(categories: categories, galeries: galeries, recommendations: recommendations)
    }
    
}
