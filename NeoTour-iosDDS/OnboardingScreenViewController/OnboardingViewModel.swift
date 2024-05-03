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
    func fetchTours()
    func fetchRecommendations()
    func getMainViewModel() -> MainViewModelProtocol
}

class OnboardingViewModel: OnboardingViewModelProtocol {
    var imageName: String {
        "home"
    }
    
    private var categories: [Category] = []
    private var tours: [Tour] = []
    private var recommendations: [Tour] = []
    
    
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
    
    func fetchTours() {
        NetworkManager.shered.fetchTours { result in
            switch result {
            case .success(let tours):
                self.tours = tours
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchRecommendations() {
        NetworkManager.shered.fetchTours { result in
            switch result {
            case .success(let recommendations):
                self.recommendations = recommendations
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getMainViewModel() -> MainViewModelProtocol {
        MainViewModel(categories: categories, tours: tours, recommendations: recommendations)
    }
    
}
