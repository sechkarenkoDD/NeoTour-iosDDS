//
//  MainViewModel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 18.04.2024.
//

import Foundation

protocol MainViewModelProtocol {
    var forCategories: [Category] { get }
    var toursForGaleries: [Tour] { get }
    var toursForRecommendations: [Tour] { get }
    func getDataForCategoriesCell(at indexPath: IndexPath) -> CategoryCellViewModelProtocol
    func getDataForGaleryCell(at indexPath: IndexPath) -> TourCellViewModeProtocol
    func getDataForRecommendedCell(at indexPath: IndexPath) -> TourCellViewModeProtocol
    func getDataForDetailView(tour: Tour) -> TourDetailViewModelProtocol
    init(categories: [Category], tours: [Tour], recommendations: [Tour])
}

class MainViewModel: MainViewModelProtocol {
    
    var forCategories: [Category] {
        categories
    }
    var toursForGaleries: [Tour] {
        tours
    }
    
    var toursForRecommendations: [Tour] {
        recommendations
    }
    
    func getDataForCategoriesCell(at indexPath: IndexPath) -> CategoryCellViewModelProtocol {
        let category = categories[indexPath.item]
        return CategoryCellViewModel(category: category)
    }
    
    func getDataForGaleryCell(at indexPath: IndexPath) -> TourCellViewModeProtocol {
        let tour = tours[indexPath.item]
        return TourCellViewModel(tour: tour)
    }
    
    func getDataForRecommendedCell(at indexPath: IndexPath) -> TourCellViewModeProtocol {
        let recommended = recommendations[indexPath.item]
        return TourCellViewModel(tour: recommended)
    }
    
    func getDataForDetailView(tour: Tour) -> TourDetailViewModelProtocol {
        TourDetailViewModel(tour: tour)
    }
    
    private let categories: [Category]
    private let tours: [Tour]
    private let recommendations: [Tour]
    
    required init(categories: [Category], tours: [Tour], recommendations: [Tour]) {
        self.categories = categories
        self.tours = tours
        self.recommendations = recommendations
    }
    
}
