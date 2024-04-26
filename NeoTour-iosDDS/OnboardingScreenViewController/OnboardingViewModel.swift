//
//  OnboardingViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 21.04.2024.
//

import Foundation

protocol OnboardingViewModelProtocol {
    var imageName: String { get }
    func fetchCategories()
    func getMainViewModel() -> MainViewModelProtocol
}

class OnboardingViewModel: OnboardingViewModelProtocol {
    
    var imageName: String {
        "home"
    }
    
    func fetchCategories() {
        NetworkManager.shered.fetchCategories { result in
            switch result {
            case.success(let categories):
                self.categories = categories
            case.failure(let error):
                print(error)
            }
        }
    }
    
    private var categories: [Category] = []
    private let galeries = Tour.getToursForGalery()
    private let recommendations = Tour.getToursForRecommended()
    
    func getMainViewModel() -> MainViewModelProtocol {
        MainViewModel(categories: categories, galeries: galeries, recommendations: recommendations)
    }
    
}
